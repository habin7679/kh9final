package com.kh.final6.repository;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.final6.entity.ReservationDto;
import com.kh.final6.error.CannotFindException;
import com.kh.final6.vo.MyReservationVO;
import com.kh.final6.vo.ReservationMemberCheckVO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Repository
public class ReservationDaoImpl implements ReservationDao {

	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public ReservationDto insert(ReservationDto reservationDto) {
		int reservationNo = sqlSession.selectOne("reservation.sequence");
		reservationDto.setReservationNo(reservationNo);
		System.out.println("테스트 = " +reservationDto);
		sqlSession.insert("reservation.insert", reservationDto);
		return  sqlSession.selectOne("reservation.one", reservationNo);
	}
	
	@Override
	public ReservationDto one(int reservationNo) {
		return sqlSession.selectOne("reservation.one", reservationNo);
	}
	
@Override
	public List<ReservationMemberCheckVO> listStoreNo(int storeNo) {
		return sqlSession.selectList("reservation.listStoreNo", storeNo);
	}
	@Override
	public void visitUpdate(int paymentNo) {
		int count = sqlSession.update("reservation.visitUpdate", paymentNo);
		if(count <= 0) {
			throw new CannotFindException();
		}
	}
	
	@Override
	public List<MyReservationVO> myReservation(int memberNo) {
		return sqlSession.selectList("reservation.myReservation", memberNo);
	}
	
}
