package com.kh.final6.repository;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.final6.entity.NoticeDto;

@Repository
public class NoticeDaoImpl implements NoticeDao{

	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public List<NoticeDto> selectList() {
		return sqlSession.selectList("notice.list");
	}

	@Override
	public NoticeDto one(long noticeNo) {
		return sqlSession.selectOne("notice.one",noticeNo);
	}

}
