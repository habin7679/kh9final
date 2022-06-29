package com.kh.final6.reservation;

import java.net.URISyntaxException;
import java.util.UUID;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;

import com.kh.final6.service.KakaoPayService;
import com.kh.final6.vo.KakaoPayReadyRequestVO;
import com.kh.final6.vo.KakaoPayReadyResponseVO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {
	"file:src/main/webapp/WEB-INF/spring/root-context.xml",
	"file:src/main/webapp/WEB-INF/spring/appServlet/servlet-context.xml"
})
@WebAppConfiguration
public class KakaopayReadyTest {

	@Autowired
	private KakaoPayService kakaoPayService;
	
	@Test
	public void test() throws URISyntaxException {
		KakaoPayReadyResponseVO responseVO =
			kakaoPayService.ready(
									KakaoPayReadyRequestVO.builder()
										.partner_order_id("123")
										.item_name("레몬 스콘 외 3건")
										.partner_user_id("test")
										.quantity(1)
										.total_amount(125000)
									.build()
								);
		
		log.debug("responseVO = {}", responseVO);
		log.debug(responseVO.getNext_redirect_pc_url());
	}
}
