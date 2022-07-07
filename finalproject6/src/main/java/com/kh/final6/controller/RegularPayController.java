package com.kh.final6.controller;

import java.net.URISyntaxException;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.final6.entity.MemberDto;
import com.kh.final6.entity.RegularPaymentDto;
import com.kh.final6.entity.StoreDto;
import com.kh.final6.repository.MemberDao;
import com.kh.final6.repository.RegularPaymentDao;
import com.kh.final6.repository.SellerDao;
import com.kh.final6.repository.StoreDao;
import com.kh.final6.service.KakaoPayRegularService;
import com.kh.final6.vo.KakaoPayRegularApproveRequestVO;
import com.kh.final6.vo.KakaoPayRegularApproveResponseVO;
import com.kh.final6.vo.KakaoPayRegularReadyRequestVO;
import com.kh.final6.vo.KakaoPayRegularReadyResponseVO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/regularPay")
public class RegularPayController {

	@Autowired
	private KakaoPayRegularService kakaoPayRegularService;
	@Autowired
	private RegularPaymentDao regularPaymentDao;
	@Autowired
	private SellerDao sellerDao;
	@Autowired
	private StoreDao storeDao;
	@Autowired
	private MemberDao memberDao;
	
	@GetMapping("/insert")
	public String insert(
			@RequestParam int storeNo,
			Model model
			) {
		
		model.addAttribute("storeNo", storeNo);
		
		
		return "regularPay/insert";
	}
	
	@PostMapping("/pay")
	public String regularpay(
				@RequestParam int storeNo,
				HttpSession session
			) throws URISyntaxException {
		int memberNo = (int)session.getAttribute("no");
		StoreDto storeDto = storeDao.one(storeNo);
		MemberDto memberDto = memberDao.oneNo(memberNo);
		int regularPaymentNo = regularPaymentDao.sequence();
		int sellerNo = sellerDao.getSellerNo(memberNo);
		KakaoPayRegularReadyRequestVO requestVO =
										KakaoPayRegularReadyRequestVO.builder()
											.item_name(storeDto.getStoreName()+"-"+ memberDto.getMemberName())
											.partner_order_id(String.valueOf(regularPaymentNo))
											.partner_user_id(memberDto.getMemberName())
											.quantity(1)
											.total_amount(100000)
										.build();
		KakaoPayRegularReadyResponseVO responseVO = 
				kakaoPayRegularService.ready(requestVO);
									

				session.setAttribute("pay", KakaoPayRegularApproveRequestVO.builder()
						.tid(responseVO.getTid())
						.partner_order_id(requestVO.getPartner_order_id())
						.partner_user_id(requestVO.getPartner_user_id())
					.build()
					);
				
				//sellerNo, 가게No
				session.setAttribute("sellerNo", sellerNo);
				session.setAttribute("storeNo", storeNo);
				
				//결제 번호
				session.setAttribute("regularPaymentNo", regularPaymentNo);
			
				log.debug("@@@@@@ pc_url = {}", responseVO.getNext_redirect_pc_url());
			return "redirect:"+responseVO.getNext_redirect_pc_url();
	}
	
	@GetMapping("/approve")
	public String paySuccess(@RequestParam String pg_token, HttpSession session) throws URISyntaxException {

		KakaoPayRegularApproveRequestVO requestVO = (KakaoPayRegularApproveRequestVO)session.getAttribute("pay");
		session.removeAttribute("pay");
		
		int sellerNo = (int)session.getAttribute("sellerNo");
		int storeNo = (int)session.getAttribute("storeNo");
		session.removeAttribute("sellerNo");
		session.removeAttribute("storeNo");
		
		int regularpaymentNo = (int) session.getAttribute("regularPaymentNo");
		session.removeAttribute("regularPaymentNo");
		
		
		requestVO.setPg_token(pg_token);
		KakaoPayRegularApproveResponseVO responseVO = 
				kakaoPayRegularService.approve(requestVO);
		
		regularPaymentDao.insert(regularpaymentNo,responseVO, sellerNo, storeNo);
//		paymentService.insert(paymentNo, responseVO, paymentNoList);
		
		
		return "redirect:/regularPay/payfinish";
	}

		@GetMapping("/payfinish") //성공
		public String payFinish()	{
			return "regularPay/payFinish";
		}
		
		@GetMapping("/pay/cancel") //취소
		public String payCancel(HttpSession session) {
			session.removeAttribute("pay");
			session.removeAttribute("sellerNo");
			session.removeAttribute("storeNo");
			session.removeAttribute("regularpaymentNo");
			return "regularPay/payCancel";
		}
		
		@GetMapping("/pay/fail") //실패
		public String payFail(HttpSession session) {
			session.removeAttribute("pay");
			session.removeAttribute("sellerNo");
			session.removeAttribute("storeNo");
			session.removeAttribute("regularpaymentNo");
			return "regularPay/payFail";
		}
	
		@GetMapping("/info")
		public String info(
				@RequestParam int sellerNo,
				Model model
				) {
			
			List<RegularPaymentDto> list = regularPaymentDao.listSellerNo(sellerNo);
			model.addAttribute("list", list);
			
			return "regularPay/info";
		}
		

		
}
