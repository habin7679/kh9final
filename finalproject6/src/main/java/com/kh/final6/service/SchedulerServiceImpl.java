package com.kh.final6.service;

import java.net.URISyntaxException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Service;

import com.kh.final6.component.HolidayChecker;
import com.kh.final6.entity.RegularPaymentDto;
import com.kh.final6.repository.RegularPaymentDao;
import com.kh.final6.vo.KakaoPayRegularRequestRequestVO;
import com.kh.final6.vo.KakaoPayRegularRequestResponseVO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class SchedulerServiceImpl implements SchedulerService{

	@Autowired
	private KakaoPayRegularService kakaoPayRegularService;
	
	@Autowired
	private RegularPaymentDao regularPaymentDao;
	@Autowired
	private HolidayChecker holidayChecker;
	
	@Scheduled(cron = "0 0 18 * * *") //매일 18시 마다
//	@Scheduled(cron=" */20 * * * * *") //20초마다
	@Override
	public void regularPay() throws ParseException, URISyntaxException {
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
}
