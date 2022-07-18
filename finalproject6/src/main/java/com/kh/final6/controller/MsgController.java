package com.kh.final6.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.final6.entity.MsgDto;
import com.kh.final6.repository.MsgDao;

import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/msg")
@Slf4j
public class MsgController {	
	
@Autowired
private MsgDao msgDao;

@GetMapping("/send")
public String send() {
	return "msg/send";
}
@PostMapping("/send")
public String send(	@ModelAttribute MsgDto msgDto
	) {
	
	return "/";
}
}

