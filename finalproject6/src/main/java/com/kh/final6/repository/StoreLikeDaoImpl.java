package com.kh.final6.repository;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.final6.entity.StoreLikeDto;
import com.kh.final6.error.CannotFindException;

@Repository
public class StoreLikeDaoImpl implements StoreLikeDao {
	@Autowired
	private SqlSession sqlSession;

	@Override
	public int insert(StoreLikeDto storelikeDto) {
		return sqlSession.insert("storelike.likeUp", storelikeDto);
	}

	@Override
	public void delete(StoreLikeDto storeLikeDto) {
		sqlSession.delete("storelike.likeDown", storeLikeDto);
	}	


	@Override
	public int findLike(StoreLikeDto storelikeDto) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("storelike.findLike", storelikeDto);
	}

	@Override
	public int likemax() {
		return sqlSession.selectOne("storelike.likemax");
	}

	
	
	
	
	
	
}
