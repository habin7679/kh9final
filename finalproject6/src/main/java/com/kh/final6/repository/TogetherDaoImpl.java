package com.kh.final6.repository;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.final6.entity.TogetherDto;

@Repository
public class TogetherDaoImpl implements TogetherDao{

	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public List<TogetherDto> selectList(String type, String keyword, int p, int s, String column, String order) {
		Map<String,Object> param = new HashMap<>();
		param.put("type", type);
		param.put("keyword", keyword);
		param.put("column", column);
		param.put("order", order);
		
		int end = p * s;
		int begin = end - (s-1);
		param.put("begin", begin);
		param.put("end", end);
		return sqlSession.selectList("together.list",param);
	}

	@Override
	public int count(String type, String keyword) {
		Map<String,Object> param = new HashMap<>();
		param.put("type", type);
		param.put("keyword", keyword);
		
		return sqlSession.selectOne("together.count",param);
	}
	
	@Override
	public TogetherDto one(int togetherNo) {
		sqlSession.update("together.readcount",togetherNo);
		return sqlSession.selectOne("together.one",togetherNo);
	}
	
	@Override
	public int write(TogetherDto togetherDto) {
		int togetherNo = sqlSession.selectOne("together.sequence");
		togetherDto.setTogetherNo(togetherNo);
		sqlSession.insert("together.write",togetherDto);
		
		return togetherNo;
	}
	
	@Override
	public boolean delete(int togetherNo) {
		int count = sqlSession.delete("together.delete",togetherNo);
		return count > 0;
	}
	
	@Override
	public boolean update(TogetherDto togetherDto) {
		int count = sqlSession.update("together.edit",togetherDto);
		return count > 0;
	}
}
