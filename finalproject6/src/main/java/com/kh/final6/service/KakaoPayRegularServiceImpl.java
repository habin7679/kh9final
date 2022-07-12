package com.kh.final6.service;

import java.net.URI;
import java.net.URISyntaxException;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.stereotype.Service;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.client.RestTemplate;

import com.kh.final6.vo.KakaoPayApproveResponseVO;
import com.kh.final6.vo.KakaoPayCancelResponsetVO;
import com.kh.final6.vo.KakaoPayOrderResponseVO;
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

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class KakaoPayRegularServiceImpl implements KakaoPayRegularService {

	@Value("${kakaopay.urlPrefix}")
	private String urlPrefix;

	private RestTemplate template = new RestTemplate();

	@Value("${kakaopay.authorization}")
	private String authorization;
	
	@Value("${kakaopay.contentType}")
	private String contentType;

	@Value("${kakaopay.cid}")
	private String cid;

	@Override
	public KakaoPayRegularReadyResponseVO ready(KakaoPayRegularReadyRequestVO requestVO) throws URISyntaxException {

		HttpHeaders headers = new HttpHeaders();
		headers.add("Authorization", authorization);
		headers.add("Content-type", contentType);

		MultiValueMap<String, String> body = new LinkedMultiValueMap<String, String>();
		body.add("cid", cid);
		body.add("partner_order_id", requestVO.getPartner_order_id());
		body.add("partner_user_id", requestVO.getPartner_user_id());
		body.add("item_name", requestVO.getItem_name());
		body.add("quantity", String.valueOf(requestVO.getQuantity()));
		body.add("total_amount", String.valueOf(requestVO.getTotal_amount()));
		body.add("vat_amount", "0");
		body.add("tax_free_amount", "0");

		String prefix = "http://localhost:8080/final6/regularPay";
		body.add("approval_url", prefix + "/approve");
		body.add("cancel_url", prefix + "/cancel");
		body.add("fail_url", prefix + "/fail");

		HttpEntity<MultiValueMap<String, String>> entity = new HttpEntity<>(body, headers);

		URI uri = new URI(urlPrefix + "/ready");
		KakaoPayRegularReadyResponseVO responseVO = template.postForObject(uri, entity, KakaoPayRegularReadyResponseVO.class);

		return responseVO;
	}
	
	@Override
	public KakaoPayRegularApproveResponseVO approve(KakaoPayRegularApproveRequestVO requestVO)
			throws URISyntaxException {

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
		
		KakaoPayRegularApproveResponseVO responseVO = 
				template.postForObject(uri, entity, KakaoPayRegularApproveResponseVO.class);
		return responseVO;
	}
	
@Override
	public KakaoPayRegularRequestResponseVO request(KakaoPayRegularRequestRequestVO requestVO)
			throws URISyntaxException {
	
		HttpHeaders headers = new HttpHeaders();
		
		headers.add("Authorization", authorization);
		headers.add("Content-type", contentType);
		
		MultiValueMap<String, String> body = new LinkedMultiValueMap<String, String>();
//		body.add("aid", "S2c133c330bf237a5bd2");
//		body.add("tid", "T2c1337830bf237a5bd1");
		body.add("cid", cid);
		body.add("sid", requestVO.getSid());
		body.add("partner_order_id", requestVO.getPartner_order_id()); 
		body.add("partner_user_id", requestVO.getPartner_user_id());
		body.add("item_name", requestVO.getItem_name());
		body.add("quantity", String.valueOf(requestVO.getQuantity()));
		body.add("total_amount", String.valueOf(requestVO.getTotal_amount()));
		body.add("vat_amount", "0");
		body.add("tax_free_amount", "0");
		
		HttpEntity<MultiValueMap<String, String>> entity = new HttpEntity<>(body, headers);
		
		URI uri = new URI(urlPrefix+"/subscription");
		
		KakaoPayRegularRequestResponseVO responseVO = 
				template.postForObject(uri, entity, KakaoPayRegularRequestResponseVO.class);
		return responseVO;
	}

	@Override
	public KakaoPayRegularCancelResponseVO cancel(KakaoPayRegularCancelRequestVO requestVO) throws URISyntaxException {
		

		HttpHeaders headers = new HttpHeaders();
		headers.add("Authorization", authorization);
		headers.add("Content-type", contentType);
		
		MultiValueMap<String, String> body = new LinkedMultiValueMap<String, String>();
		body.add("cid", cid);
		body.add("sid",requestVO.getSid());
		
		
		HttpEntity<MultiValueMap<String, String>> entity = new HttpEntity<>(body, headers);
		
		URI uri = new URI(urlPrefix + "/manage/subscription/inactive");
		
		KakaoPayRegularCancelResponseVO responseVO = 
				template.postForObject(uri, entity, KakaoPayRegularCancelResponseVO.class);
		log.debug("responseVO = {}", responseVO);
		
		return responseVO;
	}
	
	@Override
	public KakaoPayRegularOrderResponseVO order(KakaoPayRegularOrderRequestVO requestVO) throws URISyntaxException {
		
		HttpHeaders headers = new HttpHeaders();
		headers.add("Authorization", authorization);
		headers.add("Content-type", contentType);
		
		MultiValueMap<String, String> body = new LinkedMultiValueMap<String, String>();
		body.add("cid", cid);
		body.add("sid", requestVO.getSid());
		body.add("tid", requestVO.getTid());

		
		HttpEntity<MultiValueMap<String, String>> entity = new HttpEntity<>(body, headers);
		
		URI uri = new URI(urlPrefix + "/status");
		KakaoPayRegularOrderResponseVO responseVO = 
				template.postForObject(uri, entity, KakaoPayRegularOrderResponseVO.class);
		
		return responseVO;
	}
	
	
	
	@Override
	public KakaoPayRegularReadyResponseVO readyChange(KakaoPayRegularReadyRequestVO requestVO) throws URISyntaxException {

		HttpHeaders headers = new HttpHeaders();
		headers.add("Authorization", authorization);
		headers.add("Content-type", contentType);

		MultiValueMap<String, String> body = new LinkedMultiValueMap<String, String>();
		body.add("cid", cid);
		body.add("partner_order_id", requestVO.getPartner_order_id());
		body.add("partner_user_id", requestVO.getPartner_user_id());
		body.add("item_name", requestVO.getItem_name());
		body.add("quantity", String.valueOf(requestVO.getQuantity()));
		body.add("total_amount", String.valueOf(requestVO.getTotal_amount()));
		body.add("vat_amount", "0");
		body.add("tax_free_amount", "0");

		String prefix = "http://localhost:8080/final6/changePay";
		body.add("approval_url", prefix + "/approve");
		body.add("cancel_url", prefix + "/cancel");
		body.add("fail_url", prefix + "/fail");

		HttpEntity<MultiValueMap<String, String>> entity = new HttpEntity<>(body, headers);

		URI uri = new URI(urlPrefix + "/ready");
		KakaoPayRegularReadyResponseVO responseVO = template.postForObject(uri, entity, KakaoPayRegularReadyResponseVO.class);

		return responseVO;
	}
	
	@Override
	public KakaoPayRegularApproveResponseVO approveChange(KakaoPayRegularApproveRequestVO requestVO)
			throws URISyntaxException {

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
		
		KakaoPayRegularApproveResponseVO responseVO = 
				template.postForObject(uri, entity, KakaoPayRegularApproveResponseVO.class);
		return responseVO;
	}
}
