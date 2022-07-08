package com.kh.final6.repository;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.final6.entity.ReplyDto;
import com.kh.final6.error.CannotFindException;

@Repository
public class ReplyDaoImpl implements ReplyDao{

	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public ReplyDto insert(ReplyDto replyDto) {
		int replyNo = sqlSession.selectOne("reply.sequence");
		replyDto.setReplyNo(replyNo);
		sqlSession.insert("reply.insert",replyDto);
		this.updateReplyCount(replyDto.getReplyTarget());
		return sqlSession.selectOne("reply.one",replyNo);
	}
	

	@Override
	public List<ReplyDto> list(int replyTarget) {
		return sqlSession.selectList("reply.list",replyTarget);
	}

	@Override
	public void delete(int replyNo) {
		ReplyDto replyDto = sqlSession.selectOne("reply.one",replyNo);
		int count = sqlSession.delete("reply.delete",replyNo);
		if(count==0) throw new CannotFindException();
		this.updateReplyCount(replyDto.getReplyTarget());
	}

	@Override
	public void updateReplyCount(int replyTarget) {
		sqlSession.update("reply.updateCount",replyTarget);
		
	}
	
	@Override
	public ReplyDto edit(ReplyDto replyDto) {
		int count = sqlSession.update("reply.edit",replyDto);
		if(count==0) throw new CannotFindException();
		return sqlSession.selectOne("reply.one",replyDto.getReplyNo());
	}

	@Override
	public int replyCount(int replyTarget) {
		return sqlSession.selectOne("reply.replyCount",replyTarget);
	}

	
}
