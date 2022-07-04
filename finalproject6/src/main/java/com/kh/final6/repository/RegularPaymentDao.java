package com.kh.final6.repository;

import java.util.List;

import com.kh.final6.vo.StoreNameMemberNameVO;

public interface RegularPaymentDao {

	List<StoreNameMemberNameVO> storeNameMemberName(int memberNo);

}
