package com.kh.final6.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.kh.final6.repository.ReplyDao;

@RestController
@RequestMapping("/rest/reply")
public class ReplyController {
	
	//@Autowired
	private ReplyDao replyDao;
	
	//@PostMapping("/")
}
