package com.kh.final6.repository;

import java.util.List;

import com.kh.final6.vo.ChatbotVO;

public interface ChatbotDao {
	List<ChatbotVO> firstMsg();
	List<ChatbotVO> answer(int superNo);
}
