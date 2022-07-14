package com.kh.final6.repository;

import java.util.List;

import com.kh.final6.entity.ReservationDto;
import com.kh.final6.vo.MyReservationVO;
import com.kh.final6.vo.ReservationMemberCheckVO;

public interface ReservationDao {

	ReservationDto insert(ReservationDto reservationDto);

	ReservationDto one(int reservationNo);

	List<ReservationMemberCheckVO> listStoreNo(int storeNo);
	
	void visitUpdate(int paymentNo);

	List<MyReservationVO> myReservation(int memberNo);

	
}
