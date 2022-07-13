package com.kh.final6.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.kh.final6.repository.ReplyDao;

@RestController
@RequestMapping("/rest/together")
public class TogetherReplyCountController {

	@Autowired
	private ReplyDao replyDao;
	
	@GetMapping("/{replyTarget}")
	public int replyCount(@PathVariable int replyTarget) {
		return replyDao.replyCount(replyTarget);
	}
}
