package com.kh.final6.reservation;

import java.text.ParseException;
import java.util.Calendar;
import java.util.Date;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;

import com.kh.final6.entity.ReservationDto;
import com.kh.final6.entity.SellerDto;
import com.kh.final6.repository.PaymentDao;
import com.kh.final6.repository.ReservationDao;
import com.kh.final6.repository.SellerDao;

import lombok.extern.slf4j.Slf4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {
		"file:src/main/webapp/WEB-INF/spring/root-context.xml",
		"file:src/main/webapp/WEB-INF/spring/appServlet/servlet-context.xml"
})
@WebAppConfiguration
@Slf4j
public class CancelTest {
	
	@Autowired
	private ReservationDao reservationDao;
	@Autowired
	private PaymentDao paymentDao;
	@Autowired
	private SellerDao sellerDao;

	@Test
	public void test() throws ParseException {
		int reservationNo = 6;
		ReservationDto reservationDto = reservationDao.one(reservationNo);
		
		log.error("@@@@ reservationDto = {}", reservationDto);
		
		Calendar getToday = Calendar.getInstance();
		getToday.setTime(new Date()); //금일 날짜
		
		
		Date date = reservationDto.getReservationDate();
		Calendar cmpDate = Calendar.getInstance();
		cmpDate.setTime(date); //특정 일자
		
		long diffSec = (cmpDate.getTimeInMillis() -getToday.getTimeInMillis()) / 1000;
		long diffDays = diffSec / (24*60*60); //일자수 차이
		
		System.out.println(getToday.getTimeInMillis());
		System.out.println(cmpDate.getTimeInMillis());
		
		System.out.println(diffSec);
		System.out.println(diffDays + "일 차이");

	}
//	@Test
	public void findSellerNo() {
		int paymentNo = 21;
		int sellerNo = paymentDao.findSellerNo(paymentNo);
		System.out.println("sellerNo : " + sellerNo);
	}
	
//	@Test
	public void addPont() {
		int sellerNo = 1;
		int price = 1;
		SellerDto sellerDto = sellerDao.one(sellerNo);
		sellerDao.addPoint(price, sellerNo);
		System.out.println("sellerPoint : " + sellerDto.getSellerPoint());
	}
}
