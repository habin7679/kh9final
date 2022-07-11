package com.kh.final6.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/chatbot")
public class ChatbotController {

	@GetMapping("/")
	public String chatbot() {
		return "chatbot/chat";
	}
}
