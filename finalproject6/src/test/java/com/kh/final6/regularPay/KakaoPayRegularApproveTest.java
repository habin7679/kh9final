package com.kh.final6.regularPay;

import java.net.URISyntaxException;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;

import com.kh.final6.service.KakaoPayRegularService;
import com.kh.final6.vo.KakaoPayRegularApproveRequestVO;
import com.kh.final6.vo.KakaoPayRegularApproveResponseVO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {
	"file:src/main/webapp/WEB-INF/spring/root-context.xml",
	"file:src/main/webapp/WEB-INF/spring/appServlet/servlet-context.xml"
})
@WebAppConfiguration
public class KakaoPayRegularApproveTest {
	
	@Autowired
	private KakaoPayRegularService kakaoPayRegularService;
	
	@Test
	public void approveTest() throws URISyntaxException {
		KakaoPayRegularApproveResponseVO responseVO = 
				kakaoPayRegularService.approve(
								KakaoPayRegularApproveRequestVO.builder()
								.partner_order_id("12345")
								.partner_user_id("testuser")
								.tid("T2c24e1c1d3605d4b393")
								.pg_token("c3c0b4745043301421ef")
							.build()
						);
		
		log.debug("resoponseVO = {}" , responseVO);
		log.debug("@@@@Aid = {}", responseVO.getAid());
		log.debug("#####Sid ={}", responseVO.getSid());
	}

}
