package com.kh.final6.service;

import com.kh.final6.entity.ReservationDto;
import com.kh.final6.vo.BarRoomVO;

public interface ReservationService {

	ReservationDto insert(ReservationDto reservationDto, BarRoomVO barRoomVO);

}
