package com.kh.final6.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.final6.entity.PaymentDto;
import com.kh.final6.repository.PaymentDao;
import com.kh.final6.vo.KakaoPayApproveResponseVO;
import com.kh.final6.vo.PaymentNoVO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class PaymentServiceImpl  implements PaymentService{
	
	@Autowired
	private PaymentDao paymentDao;

	@Override
	public void insert(int paymentNo, KakaoPayApproveResponseVO responseVO, List<PaymentNoVO> paymentNoList) {
//		log.error("@@@@@paymentNoList = {}", paymentNoList);
		PaymentDto paymentDto = PaymentDto.builder()
				.paymentNo(paymentNo)
				.paymentTid(responseVO.getTid())
				.paymentPrice(responseVO.getAmount().getTotal())
				.paymentName(responseVO.getItem_name())
				.storeNo(paymentNoList.get(0).getStoreNo())
				.memberNo(paymentNoList.get(0).getMemberNo())
				.reservationNo(paymentNoList.get(0).getReservationNo())
			.build();
//		log.error("@@@@@storeNo = {}", paymentDto.getStoreNo());
//		log.error("@@@@@memberNo = {}", paymentDto.getMemberNo());
//		log.error("@@@@@reservationNo = {}", paymentDto.getReservationNo());
		paymentDao.insertPayment(paymentDto);
		
	}

}
