package com.kh.final6.ws;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.kh.final6.repository.ChatbotDao;
import com.kh.final6.vo.ChatbotVO;

public class ChatbotWebsocketServer extends TextWebSocketHandler{
	
	@Autowired
	private ChatbotDao chatbotDao;

	private ObjectMapper mapper = new ObjectMapper();
	
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		List<ChatbotVO> list = chatbotDao.firstMsg();
		String json = mapper.writeValueAsString(list);
		session.sendMessage(new TextMessage(json));
	}
	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		int chatbotNo = Integer.parseInt(message.getPayload());
		if(chatbotNo == 0) {
			List<ChatbotVO> list = chatbotDao.firstMsg();
			String json = mapper.writeValueAsString(list);
			session.sendMessage(new TextMessage(json));
		}
		else {
			List<ChatbotVO> answer = chatbotDao.answer(chatbotNo);
			String json = mapper.writeValueAsString(answer);
			session.sendMessage(new TextMessage(json));
		}
	}
}
