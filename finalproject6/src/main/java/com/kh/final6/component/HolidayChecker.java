package com.kh.final6.component;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import org.springframework.stereotype.Component;

import com.ibm.icu.util.ChineseCalendar;
import com.kh.final6.entity.RegularPaymentDto;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Component
public class HolidayChecker {

	private Calendar calendar = Calendar.getInstance();
	private SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");
	private SimpleDateFormat mmddFormat = new SimpleDateFormat("MM-dd");

	// 1. 토/일 인지 검사
	// dateString = "yyyy-MM-dd"
	public boolean isWeekend(String dateString) throws ParseException {
		Date date = simpleDateFormat.parse(dateString);
		calendar.setTime(date);
		switch (calendar.get(Calendar.DAY_OF_WEEK)) {
		case Calendar.SATURDAY:
		case Calendar.SUNDAY:
			return true;
		}
		return false;
	}

	// 2. 양력 휴일 검사
	public boolean isSolarDay(String dateString) throws ParseException {
		Date date = simpleDateFormat.parse(dateString);
		String mmdd = mmddFormat.format(date);

		switch (mmdd) {
		case "01-01":// 신정
		case "03-01":// 삼일절
		case "05-05":// 어린이날
		case "06-06":// 현충일
		case "08-15":// 광복절
		case "10-03":// 개천절
		case "10-09":// 한글날
		case "12-25":// 성탄절
			return true;
		}
		return false;
	}


	// 3. 음력 휴일 검사
	public boolean isLunarDay(String dateString) throws ParseException {
		//음력으로 변환
		ChineseCalendar cc = new ChineseCalendar();
		Calendar cal = Calendar.getInstance();	
		cal.set(Calendar.YEAR, Integer.parseInt(dateString.substring(0, 4)));
		cal.set(Calendar.MONTH, Integer.parseInt(dateString.substring(5, 7)) - 1);
		cal.set(Calendar.DAY_OF_MONTH, Integer.parseInt(dateString.substring(8)));
		cc.setTimeInMillis(cal.getTimeInMillis());
		int y = cc.get(ChineseCalendar.EXTENDED_YEAR) - 2637;
		int m = cc.get(ChineseCalendar.MONTH) + 1;
		int d = cc.get(ChineseCalendar.DAY_OF_MONTH);
		StringBuffer ret = new StringBuffer();
		ret.append(String.format("%04d", y)).append("-");
		ret.append(String.format("%02d", m)).append("-");
		ret.append(String.format("%02d", d));
		
		String LunarDay = ret.toString(); //yyyy-MM-dd
		Date date = simpleDateFormat.parse(LunarDay);
		String mmdd = mmddFormat.format(date);

//		log.debug("@@@@2LunarDay = {}", LunarDay);
		switch (mmdd) {
		case "01-01":// 설날
		case "01-02":// ""
			
		case "04-08":// 석탄일
			
		case "08-14":// ""
		case "08-15":// 추석
		case "08-16":// ""
			return true;
		}
		return false;

	}

	public boolean isHoliday(String dateString) throws ParseException {
		return this.isWeekend(dateString) || this.isSolarDay(dateString) || isLunarDay(dateString);
	}

	public String getLastWorkDay(String dateString) throws ParseException {
//		if(this.isHoliday(dateString)) {
		// 1. 하루 전으로 이동
//		List<RegularPaymentDto> holidayList = new  ArrayList<>();
		Date date = simpleDateFormat.parse(dateString);
		calendar.setTime(date);
		calendar.add(Calendar.DATE, -1);
		Date yesterday = calendar.getTime();

		// 2. 검사
		String yesterdayString = simpleDateFormat.format(yesterday);
		boolean holiday = this.isHoliday(yesterdayString);

		// 3. 결과에 따른 처리
		if (holiday) {// 어제가 휴일이면 마지막 영업일이 아니니까 한 번 더!
//			holidayList.add(regularPaymentDto);
//			log.debug("holidayList = {}", holidayList );
			return this.getLastWorkDay(yesterdayString);
		} else {// 어제가 휴일이 아니면 어제가 마지막 영업일이므로 어제 날짜를 반환
			return yesterdayString;
		}
//		} 
//		return dateString;
	}
	
	public void getLastWorkDayInsert(String dateString) throws ParseException {
		// 1. 하루 전으로 이동
//		List<RegularPaymentDto> holidayList = new  ArrayList<>();
		Date date = simpleDateFormat.parse(dateString);
		calendar.setTime(date);
		calendar.add(Calendar.DATE, -1);
		Date yesterday = calendar.getTime();

		// 2. 검사
		String yesterdayString = simpleDateFormat.format(yesterday);
		boolean holiday = this.isHoliday(yesterdayString);

		// 3. 결과에 따른 처리
		if (holiday) {// 어제가 휴일이면 마지막 영업일이 아니니까 한 번 더!
//			holidayList.add(regularPaymentDto);
//			log.debug("holidayList = {}", holidayList );
			this.getLastWorkDayInsert(yesterdayString);
		}
		
	}
	
//	public Date getLastWorkDate (String dateString) throws ParseException {
//		// 1. 하루 전으로 이동
////		List<RegularPaymentDto> holidayList = new  ArrayList<>();
//		Date date = simpleDateFormat.parse(dateString);
//		calendar.setTime(date);
//		calendar.add(Calendar.DATE, +1);
//		Date yesterday = calendar.getTime();
//
//		// 2. 검사
//		boolean holiday = this.isHoliday(yesterday);
//
//		// 3. 결과에 따른 처리
//		if (holiday) {// 어제가 휴일이면 마지막 영업일이 아니니까 한 번 더!
////			holidayList.add(regularPaymentDto);
////			log.debug("holidayList = {}", holidayList );
//			return this.getLastWorkDate(yesterdayString);
//		} else {// 어제가 휴일이 아니면 어제가 마지막 영업일이므로 어제 날짜를 반환
//			return yesterdayString;
//		}
//	}
}