package com.kh.final6.controller;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.final6.entity.MemberDto;
import com.kh.final6.repository.MemberDao;

@Controller
@RequestMapping("/member")
public class MemberController {

	@	Autowired
	private MemberDao memberDao; 
	
	//회원가입 
	@GetMapping("/join")
	public String join() {
		return "member/join"; 	
	}

	@PostMapping("/join")
	public String join(
			@ModelAttribute MemberDto memberDto) {
		
		memberDao.join(memberDto);
		
//		return "redirect:join_success";//상대
		return "redirect:/member/join_success";//절대
	}
	
	@RequestMapping("/join_success")
	public String joinSuccess() {
		return "member/join_success";
	}
	
//	로그인 처리
// 사용자 요청 헤더에 있는 Referer라는 값을 알아야 로그인 성공 후 다시 이동 시킬 수 있다 
// - @RequestHeader("헤더이름")
	@GetMapping("/login")
	public String login(
			@RequestHeader(value = "Referer", defaultValue="/") String referer,
				Model model
			) {  
		model.addAttribute("referer", referer);
		return "member/login"; 
	}	
	
	@PostMapping("/login")
	public String login(
			@RequestParam String  memberId,
			@RequestParam String memberPw,
			@RequestParam String referer, 
			@RequestParam (required=false) String remember, 
			HttpSession session,
			HttpServletResponse response ){
		MemberDto memberDto = memberDao.login(memberId, memberPw);
		if(memberDto != null) {//로그인 성공
			//세션
			session.setAttribute("login", memberDto.getMemberId());
			
			//쿠키
			if(remember != null) {//체크하고 로그인 했으면 -> 쿠키 발행
				Cookie ck = new Cookie("saveId", memberDto.getMemberId());
				ck.setMaxAge(4 * 7 * 24 * 60 * 60);//4주
				response.addCookie(ck);
			}
			else {//체크안하고 로그인 했으면 -> 쿠키 삭제
				Cookie ck = new Cookie("saveId", memberDto.getMemberId());
				ck.setMaxAge(0);
				response.addCookie(ck);
			}
			return "redirect:" + referer;
		}
		else {//로그인 실패
			return "redirect:login?error";
		}
	}
	
	@RequestMapping("/logout")
	public String logout(HttpSession session) {
		session.removeAttribute("login");
		session.removeAttribute("auth");
		return "redirect:/"; 
	
	}
	

}


