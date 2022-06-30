package com.kh.final6.repository;

import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class NoticeAttachDaoImpl implements NoticeAttachDao{

	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public void insert(int noticeNo, int attachmentNo) {
		Map<String,Object> param = new HashMap<>();
		param.put("noticeNo", noticeNo);
		param.put("attachmentNo", attachmentNo);
		
		sqlSession.insert("noticeAttach.insert",param);
	}

	@Override
	public int info(int noticeNo) {
		Integer attachmentNo = sqlSession.selectOne("noticeAttach.one",noticeNo);
		if(attachmentNo == null) {
			return 0;
		}
		else {
			return attachmentNo;
		}
	}

}
