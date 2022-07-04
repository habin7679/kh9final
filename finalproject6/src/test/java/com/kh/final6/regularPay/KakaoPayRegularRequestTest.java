package com.kh.final6.regularPay;

import java.net.URISyntaxException;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;

import com.kh.final6.service.KakaoPayRegularService;
import com.kh.final6.vo.KakaoPayRegularRequestRequestVO;
import com.kh.final6.vo.KakaoPayRegularRequestResponseVO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {
	"file:src/main/webapp/WEB-INF/spring/root-context.xml",
	"file:src/main/webapp/WEB-INF/spring/appServlet/servlet-context.xml"
})
@WebAppConfiguration
public class KakaoPayRegularRequestTest {
	
	@Autowired
	private KakaoPayRegularService kakaoPayRegularService;
	
	@Test
	public void requestTest() throws URISyntaxException {
		KakaoPayRegularRequestResponseVO responseVO = 
				kakaoPayRegularService.request(
								KakaoPayRegularRequestRequestVO.builder()
								.partner_order_id("12345")
								.partner_user_id("testuser")
								.item_name("테스트 정기 결제")
								.quantity(1)
								.total_amount(50000)
								.sid("S2c24e8630bf237a5d1a")
							.build()
						);
		
		log.debug("resoponseVO = {}" , responseVO);
	}

}
