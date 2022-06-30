package com.kh.final6.service;

import java.util.List;

import com.kh.final6.vo.KakaoPayApproveResponseVO;
import com.kh.final6.vo.PaymentNoVO;

public interface PaymentService {

	void insert(int paymentNo, KakaoPayApproveResponseVO responseVO, List<PaymentNoVO> paymentNoList);

}
