package com.kh.final6.service;

import java.net.URISyntaxException;

import com.kh.final6.vo.KakaoPayApproveRequestVO;
import com.kh.final6.vo.KakaoPayApproveResponseVO;
import com.kh.final6.vo.KakaoPayReadyRequestVO;
import com.kh.final6.vo.KakaoPayReadyResponseVO;

public interface KakaoPayService {
	
	KakaoPayReadyResponseVO ready(KakaoPayReadyRequestVO requestVO) throws URISyntaxException;
	KakaoPayApproveResponseVO approve(KakaoPayApproveRequestVO requestVO) throws URISyntaxException;

}
