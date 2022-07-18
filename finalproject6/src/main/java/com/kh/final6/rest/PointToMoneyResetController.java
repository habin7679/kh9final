package com.kh.final6.rest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.kh.final6.entity.MemberDto;
import com.kh.final6.repository.MemberDao;

import lombok.extern.slf4j.Slf4j;

@RestController
@Slf4j
@RequestMapping("/rest/payToMoney")
public class PointToMoneyResetController {

	@Autowired
	private MemberDao memberDao;
	
	@GetMapping("/memberId/{memberId}/memberPw/{memberPw}")
	public String passwordCheck(@PathVariable String memberId, @PathVariable String memberPw) {
		
		MemberDto memberDto = memberDao.login(memberId, memberPw);
		
		if(memberDto != null) {
			return "111111";
		}
		return "000000";
		
	}
}
