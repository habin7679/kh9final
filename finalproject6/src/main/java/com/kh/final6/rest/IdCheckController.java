package com.kh.final6.rest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.kh.final6.entity.MemberDto;
import com.kh.final6.repository.MemberDao;

import lombok.extern.slf4j.Slf4j;

@RestController
@Slf4j
@RequestMapping("/rest/member")
@CrossOrigin("*")
public class IdCheckController {

	@Autowired
	private MemberDao memberDao;
	
	@GetMapping("/idcheck/{memberId}")
	public String idCheck(@PathVariable String memberId) {
		
	MemberDto memberDto = memberDao.idcheck(memberId);
	
	if(memberDto == null) {
		return "111";
	}
	return "000"; 
}

	@GetMapping("/nickcheck/{memberNick}")
	public String  nickCheck(@PathVariable String memberNick) {
		
	MemberDto memberDto = memberDao.nickcheck(memberNick);
	
	if(memberDto == null){
		return "2222";
	}
		return "3333";
		
	}


}
