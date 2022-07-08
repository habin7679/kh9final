package com.kh.final6.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.kh.final6.entity.MemberDto;
import com.kh.final6.entity.ReplyDto;
import com.kh.final6.repository.MemberDao;
import com.kh.final6.repository.ReplyDao;

import springfox.documentation.annotations.ApiIgnore;
@CrossOrigin(origins = {"*"}

)
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
		String memberId = (String)session.getAttribute("login");
		MemberDto memberDto = memberDao.info(memberId);
		
		replyDto.setReplyWriter(memberDto.getMemberNick());
		return replyDao.insert(replyDto);
	}
	
	@GetMapping("/{replyTarget}")
	public List<ReplyDto> list(@PathVariable int replyTarget){
		return replyDao.list(replyTarget);
	}
	
	@DeleteMapping("/{replyNo}")
	public void delete(@PathVariable int replyNo) {
		replyDao.delete(replyNo);
	}
	
	@PutMapping("/")
	public ReplyDto edit(@RequestBody ReplyDto replyDto) {
		return replyDao.edit(replyDto);
	}
	
}
