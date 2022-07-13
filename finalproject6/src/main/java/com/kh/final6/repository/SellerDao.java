package com.kh.final6.repository;

import java.util.List;

import com.kh.final6.entity.MemberDto;

import com.kh.final6.entity.SellerDto;
import com.kh.final6.vo.SellerInfoVO;

public interface SellerDao {

	void addPoint(int price, int sellerNo);

	SellerDto one (int sellerNo);

	int getSellerNo(int memberNo);
	
	void join(SellerDto sellerDto);

	List<SellerDto> list(int sellerNo);
	
	SellerInfoVO sellerMemberInfoVO(int sellerNo);
}
