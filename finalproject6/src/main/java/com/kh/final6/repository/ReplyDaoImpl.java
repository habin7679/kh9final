package com.kh.final6.repository;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.final6.entity.ReplyDto;

@Repository
public class ReplyDaoImpl implements ReplyDao{

	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public ReplyDto insert(ReplyDto replyDto) {
		int replyNo = sqlSession.selectOne("reply.sequence");
		replyDto.setReplyNo(replyNo);
		sqlSession.insert("reply.insert",replyDto);
		return sqlSession.selectOne("reply.one",replyNo);
	}

	@Override
	public List<ReplyDto> list(int replyTarget) {
		return sqlSession.selectList("reply.list",replyTarget);
	}


}
