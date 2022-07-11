package com.kh.final6.repository;

import com.kh.final6.entity.MemberDto;
import com.kh.final6.entity.SellerDto;

public interface SellerDao {

	void addPoint(int price, int sellerNo);

	SellerDto one (int sellerNo);

	int getSellerNo(int memberNo);
	
	void join(SellerDto sellerDto);
	
	SellerDto sellerinfo(int sellerNo);
	
}
