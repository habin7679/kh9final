package com.kh.final6.repository;


import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.final6.entity.ReviewDto;


@Repository
public class ReviewDaoImpl implements ReviewDao {

@Autowired
private SqlSession sqlSession;
	

@Override
public ReviewDto one(int reviewNo) {
	return sqlSession.selectOne("review.one", reviewNo);
}


	@Override
	public int insert(ReviewDto reviewDto) {
		int reviewNo = sqlSession.selectOne("review.sequence");
		reviewDto.setReviewNo(reviewNo);
		return sqlSession.insert("review.insert", reviewDto);
		
	}


	@Override
	public boolean edit(ReviewDto reviewDto) {
		int count = sqlSession.update("review.edit",reviewDto);
		return count > 0;
		
	}


	


	@Override
	public boolean delete(int reviewNo) {
		int count = sqlSession.delete("review.delete",reviewNo);
		return count > 0;
	}

	//리뷰목록
	

	
	
	@Override
	public List<ReviewDto> list(String type, String keyword, int page, int size) {
		Map<String,Object> param = new HashMap<>();
		param.put("type", type);
		param.put("keyword", keyword);
		
		int end = page * size;
		int begin = end - (size-1);
		
		param.put("begin", begin);
		param.put("end", end);
		return sqlSession.selectList("review.list",param);
	}



}
