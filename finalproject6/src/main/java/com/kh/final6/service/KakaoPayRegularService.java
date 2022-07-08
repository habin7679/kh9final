package com.kh.final6.service;

import java.net.URISyntaxException;

import com.kh.final6.vo.KakaoPayRegularApproveRequestVO;
import com.kh.final6.vo.KakaoPayRegularApproveResponseVO;
import com.kh.final6.vo.KakaoPayRegularCancelRequestVO;
import com.kh.final6.vo.KakaoPayRegularCancelResponseVO;
import com.kh.final6.vo.KakaoPayRegularOrderRequestVO;
import com.kh.final6.vo.KakaoPayRegularOrderResponseVO;
import com.kh.final6.vo.KakaoPayRegularReadyRequestVO;
import com.kh.final6.vo.KakaoPayRegularReadyResponseVO;
import com.kh.final6.vo.KakaoPayRegularRequestRequestVO;
import com.kh.final6.vo.KakaoPayRegularRequestResponseVO;

public interface KakaoPayRegularService {

	 KakaoPayRegularReadyResponseVO ready(KakaoPayRegularReadyRequestVO requestVO) throws URISyntaxException;
	 KakaoPayRegularApproveResponseVO approve(KakaoPayRegularApproveRequestVO requestVO) throws URISyntaxException;
	KakaoPayRegularRequestResponseVO request(KakaoPayRegularRequestRequestVO requestVO) throws URISyntaxException;
	KakaoPayRegularCancelResponseVO cancel(KakaoPayRegularCancelRequestVO requestVO) throws URISyntaxException;
	KakaoPayRegularOrderResponseVO order(KakaoPayRegularOrderRequestVO requestVO) throws URISyntaxException;
	KakaoPayRegularReadyResponseVO readyChange(KakaoPayRegularReadyRequestVO requestVO) throws URISyntaxException;
	KakaoPayRegularApproveResponseVO approveChange(KakaoPayRegularApproveRequestVO requestVO) throws URISyntaxException;
}
