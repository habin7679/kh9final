package com.kh.final6.repository;

import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class MemberProfileDaoImpl implements MemberProfileDao{

	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public void insert(int memberNo, int attachmentNo) {
		Map<String, Object> param = new HashMap<>();
		param.put("memberNo", memberNo);
		param.put("attachmentNo", attachmentNo);
		sqlSession.insert("memberAttachment.insert", param);
	}
	
	@Override
	public int oneNo(int memberNo) {
		Integer attachmentNo = sqlSession.selectOne("memberAttachment.one", memberNo);
		if(attachmentNo == null) {
			return 0;
		}
		else {
			return attachmentNo;
		}
	}

}