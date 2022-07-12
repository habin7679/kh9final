package com.kh.final6.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.kh.final6.entity.ChatbotDto;
import com.kh.final6.repository.ChatbotDao;
import com.kh.final6.vo.ChatbotVO;
@CrossOrigin(origins = {"http://127.0.0.1:5500"}
//,methods = {
//		RequestMethod.GET,RequestMethod.POST,
//		RequestMethod.PUT,RequestMethod.DELETE
//},
//maxAge = 3600L
)
@RestController
@RequestMapping("/admin/chat")
public class AdminChatManageController {

	@Autowired
	private ChatbotDao chatbotDao;
	
	@GetMapping("/")
	public List<ChatbotDto> list() {
		return chatbotDao.list();
	}
	@PostMapping("/")
	public ChatbotDto insert(@RequestBody ChatbotDto chatbotDto) {
		return chatbotDao.insert(chatbotDto);
	}
	@PutMapping("/")
	public ChatbotDto edit(@RequestBody ChatbotDto chatbotDto) {
		return chatbotDao.edit(chatbotDto);
	}
	@DeleteMapping("/{chatbotNo}")
	public void delete(@PathVariable int chatbotNo) {
		chatbotDao.delete(chatbotNo);
	}
}
