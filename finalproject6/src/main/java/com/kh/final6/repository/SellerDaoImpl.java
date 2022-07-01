package com.kh.final6.repository;

import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.final6.entity.SellerDto;
import com.kh.final6.error.CannotFindException;

@Repository
public class SellerDaoImpl implements SellerDao{

	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public void addPoint(int price, int sellerNo) {
		Map<String, Object> param = new HashMap<>();
		param.put("price", price);
		param.put("sellerNo", sellerNo);
		int count = sqlSession.update("seller.addPoint", param);
		if(count < 0) {
			throw new CannotFindException();
		}
	}
	
	@Override
	public SellerDto one(int sellerNo) {
		return sqlSession.selectOne("seller.one", sellerNo);
	}
}
