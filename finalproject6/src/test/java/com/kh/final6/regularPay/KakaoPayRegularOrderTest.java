package com.kh.final6.regularPay;

import java.net.URISyntaxException;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;

import com.kh.final6.service.KakaoPayRegularService;
import com.kh.final6.vo.KakaoPayRegularOrderRequestVO;
import com.kh.final6.vo.KakaoPayRegularOrderResponseVO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {
	"file:src/main/webapp/WEB-INF/spring/root-context.xml",
	"file:src/main/webapp/WEB-INF/spring/appServlet/servlet-context.xml"
})
@WebAppConfiguration
public class KakaoPayRegularOrderTest {
	
	@Autowired
	private KakaoPayRegularService kakaoPayRegularService;
	
	@Test
	public void requestTest() throws URISyntaxException {
		KakaoPayRegularOrderResponseVO responseVO = 
				kakaoPayRegularService.order(
								KakaoPayRegularOrderRequestVO.builder()
								.sid("S2d4055930bf237a9da6")
								.tid("T2d405441d3605d4f3f8")
							.build()
						);
		
		log.debug("resoponseVO = {}" , responseVO);
	}

}
