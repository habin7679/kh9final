package com.kh.final6.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.final6.entity.ReservationDto;
import com.kh.final6.entity.StoreDto;
import com.kh.final6.repository.ReservationDao;
import com.kh.final6.repository.StoreDao;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class ReservationServiceImpl implements ReservationService{

	@Autowired
	private StoreDao storeDao;
	@Autowired
	private ReservationDao reservationDao;
	
	@Override
	public ReservationDto insert(ReservationDto reservationDto) {
		StoreDto storeDto = storeDao.one(reservationDto.getStoreNo());
		int total = reservationDto.getReservationPeople() * storeDto.getStoreReservationPrice();
		reservationDto.setReservationPrice(total);
		return reservationDao.insert(reservationDto);
		
	}
	
}
