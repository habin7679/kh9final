package com.kh.final6.reservation;

import java.net.URISyntaxException;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;

import com.kh.final6.service.KakaoPayService;
import com.kh.final6.vo.KakaoPayApproveRequestVO;
import com.kh.final6.vo.KakaoPayApproveResponseVO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {
	"file:src/main/webapp/WEB-INF/spring/root-context.xml",
	"file:src/main/webapp/WEB-INF/spring/appServlet/servlet-context.xml"
})
@WebAppConfiguration
public class KakaoPayApproveTest {

	@Autowired
	private KakaoPayService kakaoPayService;
	
	@Test
	public void test() throws URISyntaxException {
		KakaoPayApproveResponseVO responseVO = 
				kakaoPayService.approve(
								KakaoPayApproveRequestVO.builder()
								.partner_order_id("123")
								.partner_user_id("test")
								.tid("T2bbd2f31d3605d4a391")
								.pg_token("3495e9703cc930cc1109")
							.build()
						);
		
		log.debug("resoponseVO = {}" , responseVO);
	}
}
