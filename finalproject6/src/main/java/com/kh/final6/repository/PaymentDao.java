package com.kh.final6.repository;

import com.kh.final6.entity.PaymentDto;

public interface PaymentDao {

	int sequence();

	void insertPayment(PaymentDto paymentDto);

	PaymentDto one(int paymentNo);

	void cancel(PaymentDto paymentDto);

	int findSellerNo(int paymentNo);

}
