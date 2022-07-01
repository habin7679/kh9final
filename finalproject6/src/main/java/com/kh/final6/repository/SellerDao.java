package com.kh.final6.repository;

import com.kh.final6.entity.SellerDto;

public interface SellerDao {

	void addPoint(int price, int sellerNo);

	SellerDto one (int sellerNo);
}
