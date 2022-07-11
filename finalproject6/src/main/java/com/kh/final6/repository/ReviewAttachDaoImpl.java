package com.kh.final6.repository;

import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ReviewAttachDaoImpl implements ReviewAttachDao{

	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public void insert(int reviewNo, int attachmentNo) {
		Map<String,Object> param = new HashMap<>();
		param.put("reviewNo", reviewNo);
		param.put("attachmentNo", attachmentNo);
		
		sqlSession.insert("reviewAttach.insert",param);
	}

	@Override
	public int info(int reviewNo) {
		Integer attachmentNo = sqlSession.selectOne("reviewAttach.one",reviewNo);
		if(attachmentNo == null) {
			return 0;
		}
		else {
			return attachmentNo;
		}
		
	}

}