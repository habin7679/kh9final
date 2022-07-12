package com.kh.final6.repository;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.final6.entity.ChatbotDto;
import com.kh.final6.error.CannotFindException;
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

	@Override
	public List<ChatbotDto> list() {
		return sqlSession.selectList("chatbot.list");
	}

	@Override
	public ChatbotDto insert(ChatbotDto chatbotDto) {
		int chatbotNo = sqlSession.selectOne("chatbot.sequence");
		chatbotDto.setChatbotNo(chatbotNo);
		sqlSession.insert("chatbot.insert",chatbotDto);
		return sqlSession.selectOne("chatbot.one",chatbotDto.getChatbotNo());
	}

	@Override
	public ChatbotDto edit(ChatbotDto chatbotDto) {
		int count = sqlSession.update("chatbot.edit",chatbotDto);
		if(count==0) throw new CannotFindException();
		return sqlSession.selectOne("chatbot.one",chatbotDto.getChatbotNo());
	}

	@Override
	public void delete(int chatbotNo) {
		int count = sqlSession.delete("chatbot.delete",chatbotNo);
		if(count==0) throw new CannotFindException();
	}


}
