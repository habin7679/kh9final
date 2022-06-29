package com.kh.final6.service;

import java.net.URI;
import java.net.URISyntaxException;

import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.stereotype.Service;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.client.RestTemplate;

import com.kh.final6.vo.KakaoPayApproveRequestVO;
import com.kh.final6.vo.KakaoPayApproveResponseVO;
import com.kh.final6.vo.KakaoPayReadyRequestVO;
import com.kh.final6.vo.KakaoPayReadyResponseVO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class KakaoPayServiceVersion1 implements KakaoPayService {
	
	private String urlPrefix = "https://kapi.kakao.com/v1/payment";
	
	private RestTemplate template = new RestTemplate(); //서버 끼리 요청
	
	private String authorization = "KakaoAK fbf7ae1aaa6b6d4d7901f226439db3a5"; //관리자 번호이기 때문에 property에 지정해서 저장소에 안올리게 해야함
	private String contentType="application/x-www-form-urlencoded;charset=utf-8";
	
	private String cid = "TC0ONETIME";

	@Override
	public KakaoPayReadyResponseVO ready(KakaoPayReadyRequestVO requestVO) throws URISyntaxException {
		
	
		HttpHeaders headers = new HttpHeaders();
		headers.add("Authorization", authorization);
		headers.add("Content-type",contentType);

		MultiValueMap<String, String> body = new LinkedMultiValueMap<String, String>();
		body.add("cid", cid);
		body.add("partner_order_id", requestVO.getPartner_order_id());
		body.add("partner_user_id",  requestVO.getPartner_user_id());
		body.add("item_name", requestVO.getItem_name());
		body.add("quantity", String.valueOf(requestVO.getQuantity()));
		body.add("total_amount", String.valueOf(requestVO.getTotal_amount()));
		body.add("tax_free_amount", "0");
		
		String prefix = "http://localhost:8080/final6/reservation/pay";
		body.add("approval_url", prefix+"/approve");
		body.add("cancel_url", prefix+"/cancel");
		body.add("fail_url", prefix+"/fail");
			
		HttpEntity<MultiValueMap<String, String>> entity = new HttpEntity<>(body,headers);
			
		URI uri = new URI(urlPrefix+"/ready");
		KakaoPayReadyResponseVO responseVO =
				template.postForObject(uri, entity, KakaoPayReadyResponseVO.class);
		
		return responseVO;
	}
	
	@Override
	public KakaoPayApproveResponseVO approve(KakaoPayApproveRequestVO requestVO) throws URISyntaxException {
		
		HttpHeaders headers = new HttpHeaders();
		
		headers.add("Authorization", authorization);
		headers.add("Content-type", contentType);
		
		MultiValueMap<String, String> body = new LinkedMultiValueMap<String, String>();
		body.add("cid", cid);
		body.add("tid", requestVO.getTid()); 
		body.add("partner_order_id", requestVO.getPartner_order_id()); 
		body.add("partner_user_id", requestVO.getPartner_user_id());
		body.add("pg_token", requestVO.getPg_token());
		
		HttpEntity<MultiValueMap<String, String>> entity = new HttpEntity<>(body, headers);
		
		URI uri = new URI(urlPrefix+"/approve");
		
		KakaoPayApproveResponseVO responseVO = 
				template.postForObject(uri, entity, KakaoPayApproveResponseVO.class);
		return responseVO;
	}
	
}
