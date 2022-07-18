package com.kh.final6.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.final6.entity.MemberDto;
import com.kh.final6.entity.MsgDto;
import com.kh.final6.error.CannotFindException;
import com.kh.final6.repository.MemberDao;
import com.kh.final6.repository.MsgDao;
import com.kh.final6.vo.RecvMsgVO;
import com.kh.final6.vo.SendMsgVO;

import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/msg")
@Slf4j
public class MsgController {	
	
@Autowired
private MsgDao msgDao;
@Autowired
private MemberDao memberDao;

@GetMapping("/send")
public String send(
		HttpSession session,
		Model model,
		@RequestParam int memberRecvNo
		) {
	int memberNo = (int)session.getAttribute("no");
	MemberDto memberDto = memberDao.oneNo(memberNo);
	MemberDto memberRecvDto = memberDao.oneNo(memberRecvNo);
	
	
	model.addAttribute("memberDto", memberDto); //내 DTO
	model.addAttribute("memberRecvDto", memberRecvDto); // 받는사람 DTO
	return "msg/send";
}
@PostMapping("/send")
public String send(	@ModelAttribute MsgDto msgDto
	) {
	msgDao.msg(msgDto);
	return "redirect:/";
}
@GetMapping("/sendBox")
public String sendBox(
		@RequestParam (required = false) String type,
		@RequestParam (required = false) String keyword,
		@RequestParam (required = false, defaultValue = "1") int p,
		@RequestParam (required = false, defaultValue = "10") int s,
		HttpSession session,
		Model model) {
	int memberNo = (Integer)session.getAttribute("no");
	
	List<SendMsgVO> sendBox = msgDao.sendBox(type,keyword,p,s,memberNo);
	model.addAttribute("sendBox",sendBox);
	
	boolean search = type !=null&&keyword != null;
	model.addAttribute("search",search);
	
	int count = msgDao.count(type,keyword,memberNo);
	int lastPage = (count + s - 1) /s;


	int blockSize = 10;
	int endBlock = (p+blockSize - 1) / blockSize * blockSize;
	int startBlock = endBlock - (blockSize - 1);
	if(endBlock > lastPage){
		endBlock = lastPage;
	}

	model.addAttribute("p",p);
	model.addAttribute("s",s);
	model.addAttribute("blockSize",blockSize);
	model.addAttribute("endBlock",endBlock);
	model.addAttribute("startBlock",startBlock);
	model.addAttribute("type",type);
	model.addAttribute("keyword",keyword);
	model.addAttribute("lastPage", lastPage);
	return "msg/sendBox";
}
		
@GetMapping("/delete")
public String delete(@RequestParam int msgNo ) {
	boolean success = msgDao.delete(msgNo);

	if(success) {
		return "redirect:sendBox";
	}
	else {
		throw new CannotFindException();
	}
}
@GetMapping("/recvBox")
public String recvBox(
		@RequestParam (required = false) String type,
		@RequestParam (required = false) String keyword,
		@RequestParam (required = false, defaultValue = "1") int p,
		@RequestParam (required = false, defaultValue = "10") int s,
		HttpSession session,
		Model model) {
	int memberNo = (Integer)session.getAttribute("no");
	
	List<RecvMsgVO> recvBox = msgDao.recvBox(type,keyword,p,s,memberNo);
	model.addAttribute("recvBox",recvBox);
	
	boolean search = type !=null&&keyword != null;
	model.addAttribute("search",search);
	
	int count1 = msgDao.count1(type,keyword,memberNo);
	int lastPage = (count1 + s - 1) /s;


	int blockSize = 10;
	int endBlock = (p+blockSize - 1) / blockSize * blockSize;
	int startBlock = endBlock - (blockSize - 1);
	if(endBlock > lastPage){
		endBlock = lastPage;
	}

	model.addAttribute("p",p);
	model.addAttribute("s",s);
	model.addAttribute("blockSize",blockSize);
	model.addAttribute("endBlock",endBlock);
	model.addAttribute("startBlock",startBlock);
	model.addAttribute("type",type);
	model.addAttribute("keyword",keyword);
	model.addAttribute("lastPage", lastPage);
	return "msg/recvBox";
}
@GetMapping("/delete1")
public String delete1(@RequestParam int msgNo ) {
	boolean success = msgDao.delete1(msgNo);

	if(success) {
		return "redirect:recvBox";
	}
	else {
		throw new CannotFindException();
	}
}


}





