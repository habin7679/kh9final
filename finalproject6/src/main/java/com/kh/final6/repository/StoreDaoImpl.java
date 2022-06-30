package com.kh.final6.repository;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.final6.entity.StoreDto;

@Repository
public class StoreDaoImpl implements StoreDao {

	@Autowired
	private SqlSession sqlSession;
	
	@Override
		public StoreDto one(int storeNo) {
			return sqlSession.selectOne("store.one", storeNo);
	}	
	
	@Override
	public int selectReservationPrice(int storeNo) {
		return sqlSession.selectOne("store.price", storeNo);
	}
}
