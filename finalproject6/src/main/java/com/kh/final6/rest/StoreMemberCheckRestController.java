package com.kh.final6.rest;

import java.net.URISyntaxException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.kh.final6.entity.PaymentDto;
import com.kh.final6.repository.PaymentDao;
import com.kh.final6.repository.ReservationDao;
import com.kh.final6.repository.SellerDao;
import com.kh.final6.service.KakaoPayService;
import com.kh.final6.vo.KakaoPayCancelRequestVO;
import com.kh.final6.vo.KakaoPayCancelResponsetVO;
import com.kh.final6.vo.ReservationMemberCheckVO;

import lombok.extern.slf4j.Slf4j;

@RestController
@RequestMapping("/rest/storeMemberCheck")
@Slf4j
public class StoreMemberCheckRestController {

	@Autowired
	private ReservationDao reservationDao;
	@Autowired
	private PaymentDao paymentDao;
	@Autowired
	private KakaoPayService kakaoPayService;
	@Autowired
	private SellerDao sellerDao;
	
	@GetMapping("/{storeNo}")
	public List<ReservationMemberCheckVO> list (@PathVariable int storeNo){
		
		return 	reservationDao.listStoreNo(storeNo);
	}
	
	@PutMapping("/sellerConfirm/{paymentNo}")
	public void sellerConfrim(@PathVariable int paymentNo) throws URISyntaxException {
		PaymentDto paymentDto = paymentDao.one(paymentNo);
		
		KakaoPayCancelRequestVO requestVO =  KakaoPayCancelRequestVO.builder()
				.tid(paymentDto.getPaymentTid())
				.cancel_amount(paymentDto.getPaymentPrice())
				.build();
		KakaoPayCancelResponsetVO responseVO = kakaoPayService.cancel(requestVO);
		reservationDao.visitUpdate(paymentDto.getReservationNo());
	}
	
	@PutMapping("/sellerCancel/{paymentNo}")
	public void sellerCancel(@PathVariable int paymentNo) throws URISyntaxException {
		PaymentDto paymentDto = paymentDao.one(paymentNo);
		
		int sellerNo = paymentDao.findSellerNo(paymentNo);
		
		sellerDao.addPoint(paymentDto.getPaymentPrice(), sellerNo);
		reservationDao.visitUpdate(paymentDto.getReservationNo());
	}
	
	
	
}
