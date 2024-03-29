package com.kh.final6.reservation;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;

import com.kh.final6.service.OffDayService;

import lombok.extern.slf4j.Slf4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "file:src/main/webapp/WEB-INF/spring/root-context.xml",
		"file:src/main/webapp/WEB-INF/spring/appServlet/servlet-context.xml" })
@WebAppConfiguration
@Slf4j
public class OffDayTest {

	@Autowired
	private OffDayService offDayService;
	
	@Test
	public void test() {
		String[] days = offDayService.getDiffDays("2022-07-18", "2022-07-20");
		for(int i = 0;i<days.length;i++)
		{
			System.out.println(days[i]);
		}
	}
}
