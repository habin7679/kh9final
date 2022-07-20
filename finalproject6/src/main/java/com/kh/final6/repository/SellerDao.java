package com.kh.final6.repository;

import java.util.List;

import com.kh.final6.entity.SellerDto;
import com.kh.final6.vo.SellerInfoVO;
import com.kh.final6.vo.SellerMemberVO;

public interface SellerDao {

	void addPoint(int price, int sellerNo);

	SellerDto one (int sellerNo);

	int getSellerNo(int storeNo);
	
	int getSellerNo2(int memberNo);
	
	void join(SellerDto sellerDto);

	List<SellerDto> list(int sellerNo);
	
	SellerInfoVO sellerMemberInfoVO(int sellerNo);
	List<SellerMemberVO> adminlist(String type, String keyword, int p, int s);
	int count(String type, String keyword);

	void gradeEdit(int sellerNo);

	
	int sellerMemberNo(int sellerNo);

	void gradeMemberEdit(int memberNo);

	void gradeCancel(int sellerNo);

	void removePoint(int sellerNo);

	
	
}
