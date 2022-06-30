package com.kh.final6.repository;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.kh.final6.entity.PaymentDto;
import com.kh.final6.error.CannotFindException;

@Repository
public class PaymentDaoImpl implements PaymentDao {

	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public int sequence() {
		return sqlSession.selectOne("payment.sequence");
	}
	
	@Override
	@Transactional
	public void insertPayment(PaymentDto paymentDto) {
		if(paymentDto == null) throw new CannotFindException();
		sqlSession.insert("payment.insert", paymentDto);
		int count = sqlSession.update("reservation.status",paymentDto.getReservationNo());
		if(count < 0) throw new CannotFindException();
	}
	
	@Override
	public PaymentDto one(int paymentNo) {
		return sqlSession.selectOne("payment.one", paymentNo);
	}
	
	@Override
	@Transactional
	public void cancel(PaymentDto paymentDto) {
		int countPay = sqlSession.update("payment.cancel", paymentDto.getPaymentNo());
		int countReservation = sqlSession.update("reservation.cancel", paymentDto.getReservationNo());
		if(countPay < 0 && countReservation < 0) {
			throw new CannotFindException();
		}
	}
}
