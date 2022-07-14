package com.kh.final6.repository;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.final6.entity.MsgDto;

@Repository
public class MsgDaoImpl implements MsgDao{
	
	@Autowired
	private SqlSession sqlSession;

	@Override
	public void send(MsgDto msgDto) {
		int sendNo = sqlSession.selectOne("msg.sequence");
		msgDto.setSendNo(sendNo);
		
		sqlSession.insert("msg.send",msgDto);
	}
}
