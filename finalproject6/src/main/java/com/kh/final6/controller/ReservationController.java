package com.kh.final6.controller;

import java.io.IOException;
import java.net.URISyntaxException;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.mail.MessagingException;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.final6.entity.MemberDto;
import com.kh.final6.entity.PaymentDto;
import com.kh.final6.entity.ReservationDto;
import com.kh.final6.entity.StoreDto;
import com.kh.final6.error.CannotFindException;
import com.kh.final6.repository.MemberDao;
import com.kh.final6.repository.PaymentDao;
import com.kh.final6.repository.ReservationDao;
import com.kh.final6.repository.SellerDao;
import com.kh.final6.repository.StoreDao;
import com.kh.final6.service.EmailService;
import com.kh.final6.service.KakaoPayService;
import com.kh.final6.service.PaymentService;
import com.kh.final6.service.ReservationService;
import com.kh.final6.vo.BarRoomVO;
import com.kh.final6.vo.KakaoPayApproveRequestVO;
import com.kh.final6.vo.KakaoPayApproveResponseVO;
import com.kh.final6.vo.KakaoPayCancelRequestVO;
import com.kh.final6.vo.KakaoPayCancelResponsetVO;
import com.kh.final6.vo.KakaoPayReadyRequestVO;
import com.kh.final6.vo.KakaoPayReadyResponseVO;
import com.kh.final6.vo.MyReservationVO;
import com.kh.final6.vo.PaymentNoVO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/reservation")
public class ReservationController {

	@Autowired
	private StoreDao storeDao;
	@Autowired
	private ReservationService reservationService;
	@Autowired
	private ReservationDao reservationDao;
	@Autowired
	private MemberDao memberDao;
	@Autowired
	private KakaoPayService kakaoPayService;
	@Autowired
	private PaymentDao paymentDao;
	@Autowired
	private PaymentService paymentService;
	@Autowired
	private SellerDao sellerDao;
	@Autowired
	private EmailService emailService;
	
	
	@GetMapping("/")
	public String reservation(
			@RequestParam int storeNo,
			HttpSession session,
			Model model
			) {
		model.addAttribute("storeDto", storeDao.one(storeNo));
		int memberNo = (int)session.getAttribute("no");
		System.out.println(memberNo);
		MemberDto memberDto = memberDao.oneNo(memberNo);
		model.addAttribute("memberDto", memberDto);
		BarRoomVO barRoomVO = storeDao.barRoom(storeNo);
		model.addAttribute("barRoomVO",barRoomVO);
		return "reservation/reservation";
	}
	
	@PostMapping("/insert")
	public String insert(
			@ModelAttribute ReservationDto reservationDto,
			@ModelAttribute BarRoomVO barRoomVO,
			Model model,
			HttpSession session
			) {
		log.debug("@@@@@@@@@@@@@@@@@@@@barRoomVO = {} ", barRoomVO);
			ReservationDto reservationNewDto =  reservationService.insert(reservationDto, barRoomVO);
//			ReservationDto reservationNewDto = reservationDao.one(reservationDto.getReservationNo());
			
			model.addAttribute("reservationDto", reservationNewDto);
			
			
			String memberId = (String)session.getAttribute("login");
			model.addAttribute("memberDto", memberDao.info(memberId));
			model.addAttribute("storeDto", storeDao.one(reservationNewDto.getStoreNo()));
			
		
		return "reservation/reservationCheck";
	}
	
	@PostMapping("/pay")
	public String pay(
			@ModelAttribute PaymentNoVO paymentNoVO,
			HttpSession session
			) throws URISyntaxException {
		ReservationDto reservationDto = reservationDao.one(paymentNoVO.getReservationNo());
		if(reservationDto == null) {
			throw new CannotFindException();
		}
		MemberDto memberDto = memberDao.oneNo(paymentNoVO.getMemberNo());
		StoreDto storeDto = storeDao.one(paymentNoVO.getStoreNo());
		int paymentNo = paymentDao.sequence();
		String itemName = storeDto.getStoreName()+"  "+reservationDto.getReservationPeople()+"명";
		
		KakaoPayReadyRequestVO requestVO = KakaoPayReadyRequestVO.builder()
				.partner_order_id(String.valueOf(paymentNo))
				.partner_user_id(memberDto.getMemberName())
				.item_name(itemName)
				.quantity(reservationDto.getReservationPeople())
				.total_amount(reservationDto.getReservationPrice())
				.build();

			KakaoPayReadyResponseVO responseVO =
			kakaoPayService.ready(requestVO);
			
			session.setAttribute("pay", KakaoPayApproveRequestVO.builder()
					.tid(responseVO.getTid())
					.partner_order_id(requestVO.getPartner_order_id())
					.partner_user_id(requestVO.getPartner_user_id())
				.build()
				);
			
			//paymentNoVO
			session.setAttribute("paymentNoVO", List.of(paymentNoVO));
			
			//결제 번호
			session.setAttribute("paymentNo", paymentNo);
		
		return "redirect:"+responseVO.getNext_redirect_pc_url();
	}
	
	
	@GetMapping("/pay/approve")
	public String paySuccess(@RequestParam String pg_token, HttpSession session) throws URISyntaxException, MessagingException, IOException {

		KakaoPayApproveRequestVO requestVO = (KakaoPayApproveRequestVO)session.getAttribute("pay");
		session.removeAttribute("pay");
		
		List<PaymentNoVO> paymentNoList = (List<PaymentNoVO>) session.getAttribute("paymentNoVO");
		session.removeAttribute("paymentNoVO");
		
		int paymentNo = (int) session.getAttribute("paymentNo");
		session.removeAttribute("paymentNo");
		
		
		requestVO.setPg_token(pg_token);
		KakaoPayApproveResponseVO responseVO = 
				kakaoPayService.approve(requestVO);
		
		
		paymentService.insert(paymentNo, responseVO, paymentNoList);
		
		emailService.sendReservationInfo(paymentNo);
		
		
		
		return "redirect:/reservation/pay/finish";
	}

		@GetMapping("/pay/finish")
		public String payFinish(
				HttpSession session,
				Model model
				)	{
			model.addAttribute("memberNo", (int)session.getAttribute("no"));
			return "reservation/payFinish";
		}
		
		@GetMapping("/pay/cancel")
		public String payCancel(HttpSession session) {
			session.removeAttribute("pay");
			session.removeAttribute("paymentNoVO");
			session.removeAttribute("paymentNo");
			return "reservation/payCancel";
		}
		
		@GetMapping("/pay/fail")
		public String payFail(HttpSession session) {
			session.removeAttribute("pay");
			session.removeAttribute("paymentNoVO");
			session.removeAttribute("paymentNo");
			return "reservation/payFail";
		}

		@GetMapping("/cancelTest")
		public String canelTest() {
			return "reservation/cancelTest";
		}
		
		@GetMapping("/cancel")
		public String cancelDetail(
				@RequestParam int paymentNo
				) throws URISyntaxException {
			PaymentDto paymentDto = paymentDao.one(paymentNo);
			
			int sellerNo = paymentDao.findSellerNo(paymentNo);
			
			ReservationDto reservationDto = reservationDao.one(paymentDto.getReservationNo());
			
			Calendar getToday = Calendar.getInstance();
			getToday.setTime(new Date()); //금일 날짜
			
			Date date = reservationDto.getReservationDate();
			Calendar cmpDate = Calendar.getInstance();
			cmpDate.setTime(date); //특정 일자
			
			long diffSec = (cmpDate.getTimeInMillis() - getToday.getTimeInMillis() ) / 1000;
			long diffDays = diffSec / (24*60*60); //일자수 차이
			
//			System.out.println("@@@@@@@@@@@diffDays" + diffDays);
					
			if(diffDays  >= 7) {
				//전액 환불
				KakaoPayCancelRequestVO requestVO =  KakaoPayCancelRequestVO.builder()
						.tid(paymentDto.getPaymentTid())
						.cancel_amount(paymentDto.getPaymentPrice())
						.build();
				KakaoPayCancelResponsetVO responseVO = kakaoPayService.cancel(requestVO);
				paymentDao.cancel(paymentDto);
				
			} else if(diffDays < 7 && diffDays >= 2) {
				//50% 환불
				paymentDto.setPaymentPrice(paymentDto.getPaymentPrice()/2);
				KakaoPayCancelRequestVO requestVO =  KakaoPayCancelRequestVO.builder()
						.tid(paymentDto.getPaymentTid())
						.cancel_amount(paymentDto.getPaymentPrice())
						.build();
				
				KakaoPayCancelResponsetVO responseVO = kakaoPayService.cancel(requestVO);
				paymentDao.cancel(paymentDto);
				sellerDao.addPoint(paymentDto.getPaymentPrice(), sellerNo);
				
			} else {
				// 환불 못하고 사장님 포인트로 변환
				paymentDao.cancel(paymentDto);
				sellerDao.addPoint(paymentDto.getPaymentPrice(), sellerNo);
			}
//
//			return "redirect:more?paymentNo="+paymentDetailDto.getPaymentNo();
			return "redirect:/member/mypage" ;
		}
		
		
	@GetMapping("/check")
	public String check(
			@RequestParam int storeNo,
			Model model
			) {
		model.addAttribute("storeNo", storeNo);
		return "store/storeMemberCheck";
	}
	
	
	@GetMapping("/memberCheck")
	public String memberCheck(
			@RequestParam int memberNo,
			Model model
			
			) {
		
		List<MyReservationVO> list = reservationDao.myReservation(memberNo);
		model.addAttribute("list", list);
		
		return "reservation/myReservation";
	}
	
	

}

