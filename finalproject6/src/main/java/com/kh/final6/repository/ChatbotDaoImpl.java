package com.kh.final6.repository;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.final6.vo.ChatbotVO;

@Repository
public class ChatbotDaoImpl implements ChatbotDao{
	
	@Autowired
	private SqlSession sqlSession;

	@Override
	public List<ChatbotVO> firstMsg() {
		return sqlSession.selectList("chatbot.firstMsg");
	}

	@Override
	public List<ChatbotVO> answer(int superNo) {
		return sqlSession.selectList("chatbot.answer",superNo);
	}


}
