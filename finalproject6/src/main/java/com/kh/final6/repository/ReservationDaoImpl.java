package com.kh.final6.repository;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.final6.entity.ReservationDto;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Repository
public class ReservationDaoImpl implements ReservationDao {

	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public void insert(ReservationDto reservationDto) {
		int reservationNo = sqlSession.selectOne("reservation.sequence");
		reservationDto.setReservationNo(reservationNo);
		System.out.println("테스트 = " +reservationDto);
		sqlSession.insert("reservation.insert", reservationDto);
	}
	
	@Override
	public ReservationDto one(int reservationNo) {
		return sqlSession.selectOne("reservation.one", reservationNo);
	}
	
}
