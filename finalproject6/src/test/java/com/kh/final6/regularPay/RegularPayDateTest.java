package com.kh.final6.regularPay;

import java.net.URISyntaxException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import org.junit.After;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;

import com.kh.final6.component.HolidayChecker;
import com.kh.final6.entity.RegularPaymentDto;
import com.kh.final6.repository.RegularPaymentDao;
import com.kh.final6.service.KakaoPayRegularService;
import com.kh.final6.vo.KakaoPayRegularRequestRequestVO;
import com.kh.final6.vo.KakaoPayRegularRequestResponseVO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "file:src/main/webapp/WEB-INF/spring/root-context.xml",
		"file:src/main/webapp/WEB-INF/spring/appServlet/servlet-context.xml" })
@WebAppConfiguration
public class RegularPayDateTest {

	@Autowired
	private RegularPaymentDao regularPaymentDao;
	@Autowired
	private KakaoPayRegularService kakaoPayRegularService;
	@Autowired
	private HolidayChecker holidayChecker;

	@Test
	public void DateTest() throws URISyntaxException, ParseException {
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		Calendar getToday = Calendar.getInstance();
		String today = format.format(getToday.getTime());
//		String todayDay = day.format(getToday.getTime());// 오늘 날짜 일
		

		String payAcceptDate = holidayChecker.getLastWorkDay(today); // 공휴일 전 날짜
		log.debug("@@@@@payAcceptDate = {}", payAcceptDate);

		List<RegularPaymentDto> list = regularPaymentDao.list(payAcceptDate, today);

		for (RegularPaymentDto regularPaymentDto : list) { // 정규 결제 반복 시작
			boolean holiday = holidayChecker.isHoliday(today);

			if (holiday) { //오늘 휴일이라면
				return; //중지
			}  else {
//				정기 결제
				KakaoPayRegularRequestRequestVO requestVO = 
										KakaoPayRegularRequestRequestVO.builder()
										.partner_order_id(String.valueOf(regularPaymentDto.getRegularPaymentNo()))
										.partner_user_id(regularPaymentDto.getRegularPaymentUserId())
										.item_name(regularPaymentDto.getRegularPaymentName())
										.total_amount(100000)
										.sid(regularPaymentDto.getRegularPaymentSid())
									.build();
				KakaoPayRegularRequestResponseVO responseVO =
							kakaoPayRegularService .request(requestVO);
			}
		}
	}
//		log.debug("payAcceptDay = {}", payAcceptDay); // 결제 가능한 날짜
//		log.debug("holidayList = {}", holidayList); //리스트에 잘 들어갔나 확인

//	@After
//	public void payAcceptDay(List<RegularPaymentDto> holidayList) throws ParseException, URISyntaxException {
//		SimpleDateFormat format = new SimpleDateFormat ( "yyyy-MM-dd");
//		Calendar getToday = Calendar.getInstance();
//		String today = format.format(getToday.getTime());
//		String payAcceptDay = holidayChecker.getLastWorkDay(today); //  전날 체크 휴일 체크
//		if(payAcceptDay == today) {
//	for(RegularPaymentDto regularPaymentDto : holidayList) { //정규 결제 
//	KakaoPayRegularRequestRequestVO requestVO = 
//			KakaoPayRegularRequestRequestVO.builder() 
//			.partner_order_id(String.valueOf(regularPaymentDto.getRegularPaymentNo()))
//			.partner_user_id(regularPaymentDto.getRegularPaymentUserId())
//			.item_name(regularPaymentDto.getRegularPaymentName())
//			.total_amount(100000)
//			.sid(regularPaymentDto.getRegularPaymentSid())
//		.build();
//		KakaoPayRegularRequestResponseVO responseVO =
//				kakaoPayRegularService .request(requestVO);
//	}

}
