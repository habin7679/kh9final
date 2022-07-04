package com.kh.final6.reservation;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;

import com.kh.final6.entity.ReservationDto;
import com.kh.final6.entity.StoreDto;
import com.kh.final6.repository.StoreDao;

import lombok.extern.slf4j.Slf4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {
		"file:src/main/webapp/WEB-INF/spring/root-context.xml",
		"file:src/main/webapp/WEB-INF/spring/appServlet/servlet-context.xml"
})
@WebAppConfiguration
@Slf4j
public class ReservationTest {

	@Autowired
	private StoreDao storeDao;
	
	//@Test
	public void test() {
		int storeNo = 1;
		StoreDto storeDto = storeDao.one(storeNo);
		log.debug("storeDto = {}", storeDto);
		
	}
	
	
}
