package com.kh.final6.repository;

import java.util.List;

import com.kh.final6.entity.RegularPaymentDto;
import com.kh.final6.vo.KakaoPayRegularApproveResponseVO;
import com.kh.final6.vo.StoreNameMemberNameVO;

public interface RegularPaymentDao {

	List<StoreNameMemberNameVO> storeNameMemberName(int memberNo);
	int sequence();
	void insert(int regularpaymentNo, KakaoPayRegularApproveResponseVO responseVO, int sellerNo, int storeNo);
	
	List<RegularPaymentDto> list(String beforeHoliday, String today);
	
	void insertStorage(RegularPaymentDto regularPaymentDto);
}
