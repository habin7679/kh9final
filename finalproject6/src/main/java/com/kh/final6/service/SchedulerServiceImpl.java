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
	
//	@Schedule(cron="초설정  분설정  시간설정  날짜설정  월설정  요일설정") //띄어쓰기 주의
//	@Scheduled(cron="* * * * * *") //매 초마다(1초마다)
//	@Scheduled(cron="0 * * * * *") //매 분 0초마다(1분마다)
//	@Scheduled(cron="0-20 * * * * *") //매 분 0초~20초 사이 (1분에 21번)
//	@Scheduled(cron="0,20 * * * * *") //매 분 0초와 20초 마다 (1분에 2번)
//	@Scheduled(cron="*/5 * * * * *") //매 5초 마다
//	@Scheduled(cron=" 0 0 9 * * *") //매일 9시 마다
//	@Scheduled(cron="0 0 * * * *") //매 정각마다
//	@Scheduled(cron="0 0 9-18 * * 1-5") //매 업무시간 중 매 정각마다(9to6)
//	@Scheduled(cron="0 0 9-18 * * mon-fri") //매 업무시간 중 매 정각마다(9to6)
//	@Scheduled(cron="0 0 15 25 * ?") //매월 25일 오후 3시 정각  (25일이 무슨요일인지 관심없다) (ex:급여지급)
//	@Scheduled(cron="* * * ? * 5L") //매월 마지막 금요일 (L : 라스트,  5 : 금요일)
//	@Scheduled(cron="* * * ? * 5#1") //매월 첫번째 금요일 (= 1주차 금요일) 금요일 없으면 첫번째 금요일로 자동 타켓
	
//	@Scheduled(cron=" 0 0 9 * * *") //매일 9시 마다
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
