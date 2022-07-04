package com.kh.final6.repository;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.final6.entity.StoreDto;
import com.kh.final6.error.CannotFindException;


@Repository
public class StoreDaoImpl implements StoreDao {

	@Autowired
	private SqlSession sqlSession;
	
	@Override
		public StoreDto one(int storeNo) {
			return sqlSession.selectOne("store.one", storeNo);
	}

	@Override
		public List<StoreDto> list() {
			return sqlSession.selectList("store.list");
	}

	@Override
	public void insert(StoreDto storeDto) {
		int storeNo = sqlSession.selectOne("store.sequence");
		storeDto.setStoreNo(storeNo);
		sqlSession.insert("store.insert", storeDto);
		
	}

	@Override
	public void delete(int storeNo) {
		int count = sqlSession.delete("store.delete",storeNo);
		if(count == 0) {
			throw new CannotFindException();
	
	}	
}
	@Override
	public StoreDto update(StoreDto storeDto) {
		int count = sqlSession.update("store.update", storeDto);
		if(count == 0) throw new CannotFindException();
		return sqlSession.selectOne("store.one", storeDto.getStoreNo());
		}
	}
