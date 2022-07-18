package com.kh.final6.controller;

import java.net.URISyntaxException;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.final6.entity.RegularPaymentDto;
import com.kh.final6.repository.RegularPaymentDao;
import com.kh.final6.service.KakaoPayRegularService;
import com.kh.final6.vo.KakaoPayRegularApproveRequestVO;
import com.kh.final6.vo.KakaoPayRegularApproveResponseVO;
import com.kh.final6.vo.KakaoPayRegularCancelRequestVO;
import com.kh.final6.vo.KakaoPayRegularCancelResponseVO;
import com.kh.final6.vo.KakaoPayRegularReadyRequestVO;
import com.kh.final6.vo.KakaoPayRegularReadyResponseVO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/changePay")
public class RegularPayChangeController {

	
	@Autowired
	private KakaoPayRegularService kakaoPayRegularService;
	@Autowired
	private RegularPaymentDao regularPaymentDao;
	
	@GetMapping("/change/{regularPaymentNo}")
	public String changeRegularPaymentReady(
			@PathVariable int regularPaymentNo,
			HttpSession session
			) throws URISyntaxException {
		
		RegularPaymentDto regularPaymentDto = regularPaymentDao.listAll(regularPaymentNo);
		KakaoPayRegularCancelRequestVO cancelRequestVO=
														KakaoPayRegularCancelRequestVO.builder()
															.sid(regularPaymentDto.getRegularPaymentSid())
														.build();
		KakaoPayRegularCancelResponseVO CancelresponseVO = 
				kakaoPayRegularService.cancel(cancelRequestVO);

		
		KakaoPayRegularReadyRequestVO readyRequestVO = 
																KakaoPayRegularReadyRequestVO.builder()
																		.item_name(regularPaymentDto.getRegularPaymentName())
																		.partner_order_id(String.valueOf(regularPaymentDto.getRegularPaymentNo()))
																		.partner_user_id(regularPaymentDto.getRegularPaymentUserId())
																		.quantity(1)
																		.total_amount(0)
																	.build();
		KakaoPayRegularReadyResponseVO readyResponseVO = 
				kakaoPayRegularService.readyChange(readyRequestVO);
		
		
		session.setAttribute("pay", KakaoPayRegularApproveRequestVO.builder()
				.tid(readyResponseVO.getTid())
				.partner_order_id(readyRequestVO.getPartner_order_id())
				.partner_user_id(readyRequestVO.getPartner_user_id())
						.build());
		
		//결제 번호
		session.setAttribute("regularPaymentNo", regularPaymentNo);
	
		log.debug("@@@@@@ pc_url = {}", readyResponseVO.getNext_redirect_pc_url());
	return "redirect:"+readyResponseVO.getNext_redirect_pc_url();
		
	}
	
	@GetMapping("/approve")
	public String paySuccess(@RequestParam String pg_token, HttpSession session) throws URISyntaxException {

		KakaoPayRegularApproveRequestVO requestVO = (KakaoPayRegularApproveRequestVO)session.getAttribute("pay");
		session.removeAttribute("pay");
		
		
		int regularpaymentNo = (int) session.getAttribute("regularPaymentNo");
		session.removeAttribute("regularPaymentNo");
		
		
		requestVO.setPg_token(pg_token);
		KakaoPayRegularApproveResponseVO responseVO = 
				kakaoPayRegularService.approveChange(requestVO);
		
		regularPaymentDao.update(responseVO, regularpaymentNo);
		
		int sellerNo = regularPaymentDao.getSellerNo(regularpaymentNo);
		
		
		session.setAttribute("sellerNo", sellerNo);
		return "redirect:/changePay/changePayFinish";
		
		
	}
	
	@GetMapping("/changePayFinish") //성공
	public String payFinish(HttpSession session, Model model)	{
		int sellerNo = (int) session.getAttribute("sellerNo");
		session.removeAttribute("sellerNo");
		
		model.addAttribute("sellerNo",sellerNo);
		return "regularPay/changePayFinish";
	}
	
	@GetMapping("/cancel") //취소
	public String payCancel(HttpSession session) {
		session.removeAttribute("pay");
		session.removeAttribute("regularpaymentNo");
		return "regularPay/payCancel";
	}
	
	@GetMapping("/fail") //실패
	public String payFail(HttpSession session) {
		session.removeAttribute("pay");
		session.removeAttribute("regularpaymentNo");
		return "regularPay/payFail";
	}
	
}
