package com.kh.final6.repository;

import com.kh.final6.entity.ReservationDto;

public interface ReservationDao {

	void insert(ReservationDto reservationDto);

	ReservationDto one(int reservationNo);

}
