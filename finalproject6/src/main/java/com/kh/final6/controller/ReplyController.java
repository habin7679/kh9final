package com.kh.final6.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.kh.final6.entity.MemberDto;
import com.kh.final6.entity.ReplyDto;
import com.kh.final6.repository.MemberDao;
import com.kh.final6.repository.ReplyDao;

@RestController
@RequestMapping("/rest/reply")
public class ReplyController {
	
	@Autowired
	private ReplyDao replyDao;
	
	@Autowired
	private MemberDao memberDao;
	
	@PostMapping("/")
	public ReplyDto insert(@RequestBody ReplyDto replyDto,
						HttpSession session) {
		int memberNo = (Integer)session.getAttribute("no");
		String memberId = (String)session.getAttribute("login");
		MemberDto memberDto = memberDao.info(memberId);
		
		replyDto.setReplyWriter(memberDto.getMemberNick());
		return replyDao.insert(replyDto);
	}
}
