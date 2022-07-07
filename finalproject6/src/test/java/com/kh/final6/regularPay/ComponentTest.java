package com.kh.final6.regularPay;

import java.text.ParseException;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;

import com.kh.final6.component.HolidayChecker;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {
	"file:src/main/webapp/WEB-INF/spring/root-context.xml",
	"file:src/main/webapp/WEB-INF/spring/appServlet/servlet-context.xml"
})
@WebAppConfiguration
public class ComponentTest {
	
	@Autowired
	private HolidayChecker holidayChecker;
	
//	@Test
	public void test2() throws ParseException {
		String date = "2022-12-26";
		
		//boolean result = holidayChecker.isWeekend(date);
		//log.debug("weekend = {}", result);
		
		//boolean result2 = holidayChecker.isSolarDay(date);
		//log.debug("soladay = {}", result2);
		
		//boolean result3 = holidayChecker.isHoliday(date);
		//log.debug("holiday = {}", result3);
		
//		String lastDay = holidayChecker.getLastWorkDay(date);
//		log.debug("lastDay = {}", lastDay);
	}
	
//	@Test
	public void test3() throws ParseException {
		String date = "2022-01-31";
//		
		boolean LunarDate = holidayChecker.isLunarDay(date);
		log.debug("LunarDate = {}", LunarDate);
	}
	
//	@Test
//	public void test4() throws ParseException {
//		String date = "2022-12-25";
//		String yesterdayString =  holidayChecker.getLastWorkDay(date);
//		
//		log.debug("yesterdayString = {}", yesterdayString);
//	}
//	
	
	

}
