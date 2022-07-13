package com.kh.final6.repository;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
	public List<StoreDto> list(String type, String keyword, int p, int s) {
		Map<String,Object> param = new HashMap<>();
		param.put("type", type);
		param.put("keyword", keyword);

		int end = p *s;
		int begin = end - (s-1);

		param.put("begin", begin);
		param.put("end", end);
		return sqlSession.selectList("store.list",param);
		
	}
	//게시글 수 조회
		@Override
		public int count(String type, String keyword) {
	 		Map<String,Object> param = new HashMap<>();
	 		param.put("type", type);
	 		param.put("keyword", keyword);
	 		
	 		return sqlSession.selectOne("store.count",param);
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

	@Override
	public int selectReservationPrice(int storeNo) {
		return sqlSession.selectOne("store.price", storeNo);
		}
	}
