package com.kh.final6.regularPay;

import java.net.URI;
import java.net.URISyntaxException;
import java.util.UUID;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.client.RestTemplate;

import com.kh.final6.service.KakaoPayRegularService;
import com.kh.final6.vo.KakaoPayReadyRequestVO;
import com.kh.final6.vo.KakaoPayRegularReadyRequestVO;
import com.kh.final6.vo.KakaoPayRegularReadyResponseVO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {
	"file:src/main/webapp/WEB-INF/spring/root-context.xml",
	"file:src/main/webapp/WEB-INF/spring/appServlet/servlet-context.xml"
})
@WebAppConfiguration
public class KakaoPayRegularReadyTest {

	@Autowired
	private KakaoPayRegularService kakaoPayRegularService;
	
	//@Test
	public void test() throws URISyntaxException {
		RestTemplate template = new RestTemplate();
		
		HttpHeaders headers = new HttpHeaders();
		
		
		headers.add("Authorization", "KakaoAK fbf7ae1aaa6b6d4d7901f226439db3a5");
		
		headers.add("Content-type","application/x-www-form-urlencoded;charset=utf-8");
		
		MultiValueMap<String, String> body = new LinkedMultiValueMap<String, String>();
		body.add("cid", "TCSUBSCRIP");
		body.add("partner_order_id", "123");
		body.add("partner_user_id", "testuser1");
		body.add("item_name", "음악정기결제");
		body.add("quantity", "1");
		body.add("total_amount", "10000");
		body.add("vat_amount", "0");
		body.add("tax_free_amount", "0");
		
		body.add("approval_url", "http://localhost:8080/final6/RegularPay/success"); //성공
		body.add("fail_url", "http://localhost:8080/final6/RegularPay/fail"); //실패
		body.add("cancel_url", "http://localhost:8080/final6/RegularPay/cancel"); //취소
		
		HttpEntity<MultiValueMap<String, String>> entity = new HttpEntity<>(body,headers);
		
		URI uri = new URI("https://kapi.kakao.com/v1/payment/ready");

		KakaoPayRegularReadyResponseVO vo = 
				template.postForObject(uri, entity, KakaoPayRegularReadyResponseVO.class);
		log.debug("vo = {}", vo);
		log.debug(vo.getNext_redirect_pc_url());
		
		log.warn("tid = {}", vo.getTid());


	}
	
	@Test
	public void test2() throws URISyntaxException {
		KakaoPayRegularReadyResponseVO responseVO =
				kakaoPayRegularService.ready(
										KakaoPayRegularReadyRequestVO.builder()
											.item_name("테스트 정기 결제")
											.partner_order_id("12345")
											.partner_user_id("testuser")
											.quantity(1)
											.total_amount(50000)
										.build()
									);
		log.debug("responseVO = {}", responseVO);
		log.debug(responseVO.getNext_redirect_pc_url());
	}
		
}
