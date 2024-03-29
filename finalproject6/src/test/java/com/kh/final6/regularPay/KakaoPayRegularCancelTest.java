package com.kh.final6.regularPay;

import java.net.URISyntaxException;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;

import com.kh.final6.service.KakaoPayRegularService;
import com.kh.final6.vo.KakaoPayRegularCancelRequestVO;
import com.kh.final6.vo.KakaoPayRegularCancelResponseVO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {
	"file:src/main/webapp/WEB-INF/spring/root-context.xml",
	"file:src/main/webapp/WEB-INF/spring/appServlet/servlet-context.xml"
})
@WebAppConfiguration
public class KakaoPayRegularCancelTest {
	
	@Autowired
	private KakaoPayRegularService kakaoPayRegularService;
	
	@Test
	public void requestTest() throws URISyntaxException {
		KakaoPayRegularCancelResponseVO responseVO = 
				kakaoPayRegularService.cancel(
								KakaoPayRegularCancelRequestVO.builder()
								.sid("S2c7bd3030bf237a7216")
							.build()
						);

	}

}
