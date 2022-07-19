package com.kh.final6.rest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.kh.final6.repository.StoreDao;
import com.kh.final6.service.OffDayService;
import com.kh.final6.vo.BarRoomVO;

import lombok.extern.slf4j.Slf4j;

@RestController
@RequestMapping("/rest/barRoom")
@Slf4j
public class BarRoomRestController {

	@Autowired 
	private OffDayService offDayService;
	@Autowired
	private StoreDao storeDao;
	

	@GetMapping("/{reservationDate}/{storeNo}")
	private BarRoomVO barRoom(
			@PathVariable String reservationDate,
			@PathVariable int storeNo
			) {
		BarRoomVO barRoomVO = storeDao.cntBarRoom(reservationDate, storeNo);
		return barRoomVO;
	}
}
