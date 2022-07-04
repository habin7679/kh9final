package com.kh.final6.repository;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.final6.vo.StoreNameMemberNameVO;

@Repository
public class RegularPaymentDaoImpl implements RegularPaymentDao {

	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public List<StoreNameMemberNameVO> storeNameMemberName(int memberNo) {
		return sqlSession.selectList("regularPayment.storeNameMemberName", memberNo);
	}
}
