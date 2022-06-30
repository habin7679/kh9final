package com.kh.final6.controller;


import java.io.IOException;
import java.util.List;

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
import org.springframework.web.multipart.MultipartFile;

import com.kh.final6.entity.MemberDto;
import com.kh.final6.repository.AttachmentDao;
import com.kh.final6.repository.MemberDao;
import com.kh.final6.repository.MemberProfileDao;

@Controller
@RequestMapping("/member")
public class MemberController {

	@	Autowired
	private MemberDao memberDao; 
	
	@Autowired
	private AttachmentDao attachmentDao;
	
	@Autowired
	private MemberProfileDao memberProfileDao;
	
	//회원가입 
	@GetMapping("/join")
	public String join() {
		return "member/join"; 	
	}

	@PostMapping("/join")
	public String join(
			@ModelAttribute MemberDto memberDto,
			@RequestParam MultipartFile memberProfile) throws IllegalStateException, IOException {
		
		memberDao.join(memberDto);
		
		//프로필 등록(실제 저장 + DB) - Attachment, MemberProfile
		if(!memberProfile.isEmpty()) {
			int attachmentNo = attachmentDao.save(memberProfile);
			memberProfileDao.insert(memberDto.getMemberId(), attachmentNo);
			
		}
//		return "redirect:join_success";//상대
		return "redirect:/member/join_success";//절대
	}
	
	@RequestMapping("/join_success")
	public String joinSuccess() {
		return "member/join_success";
	}
	
//	로그인 처리
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
			
			@RequestParam String memberId, 
			@RequestParam String memberPw,
			@RequestParam String referer,
			@RequestParam(required=false) String remember,
			HttpSession session, 
			HttpServletResponse response) {
		MemberDto memberDto = memberDao.login( memberId, memberPw);
		if(memberDto != null) {//로그인 성공
			//세션
			
			session.setAttribute("no", memberDto.getMemberNo());
			session.setAttribute("login", memberDto.getMemberId());
			session.setAttribute("auth", memberDto.getMemberKind());
		
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
		session.removeAttribute("no");
		session.removeAttribute("login");
		session.removeAttribute("auth");
		return "redirect:/";
	}
	
	//MyPage 구현 
	
	@GetMapping("/mypage")
	public String mypage(HttpSession session, Model model) {
		String memberId = String.valueOf(session.getAttribute("login"));
		
		MemberDto memberDto = memberDao.info(memberId);
		model.addAttribute("memberDto", memberDto);
		return "member/mypage"; 
	}
	
	/// 비밀번호 변경 
	@GetMapping("/password")
	public String password() { 
	return "member/password"; 
}
	
	@PostMapping("/password")
	public String password(
			@RequestParam String currentPw,
			@RequestParam String changePw,
			HttpSession session 
			){
			String memberId = String.valueOf(session.getAttribute("login"));
			boolean success = memberDao.changePassword(memberId, currentPw, changePw);
			if(success) {
				return "redirect:mypage";
			}
			else {
				return "redirect:password?error"; 
			}
	}
	
	//아이디 찾기
	
	@GetMapping("/find_id")
	public String findId() {
		return "member/find_id";
	}
	
	@PostMapping("/find_id")
	public String findId(
			@ModelAttribute MemberDto memberDto,
			HttpSession session,
			Model model) {
		String memberId = memberDao.findId(memberDto);
		if(memberId == null) {
			return "redirect:find_id?error";
		}
		else {
			model.addAttribute("findUserId", memberId);
			return "member/find_id_result";
		}
	}
	
	//탈퇴 
	@GetMapping("/exit")
	public String exit() {
		return "member/exit"; 
	}
	
	@PostMapping("/exit")
	public String exit(@RequestParam String memberPw, HttpSession session) {
	
	String memberId = String.valueOf(session.getAttribute("login"));
	boolean success =  memberDao.exit(memberId, memberPw);
	
	if(success) {
		session.removeAttribute("login");
		session.removeAttribute("autth");
		return "redirect:exit_finish"; 
	}
	else {
		return "redirect:exit?error"; 
	}
}

	@GetMapping("/exit_finish")
	public String exitFinish() {
		return "member/exit_finish"; 
	}

	//개인정보 변경 
	@GetMapping("/information")
	public String information(HttpSession session, Model model) {
		String memberId = String.valueOf( session.getAttribute("login"));
		MemberDto memberDto = memberDao.info(memberId); 
		model.addAttribute("memberDto", memberDto);
		return "member/information";
	}
	
	@PostMapping("/information")
	public String information(HttpSession session, @ModelAttribute MemberDto memberDto) {
		String memberId = String.valueOf(session.getAttribute("login"));
		memberDto.setMemberId(memberId);

		boolean success = memberDao.changeInformation(memberDto);
		if(success) {
			return"redirect:mypage"; 
		}
		else {
			return "redirect:information?error"; 
		}
	}
	
////	//리스트
////			@GetMapping("/list")
////			public String list(
////					@RequestParam (required = false) String type,
////					@RequestParam (required = false) String keyword,
////					@RequestParam (required = false, defaultValue = "1") int p,
////					@RequestParam (required = false, defaultValue = "10") int s,
////					Model model) {
//				
//				List<MemberDto> list = memberDao.list(type,keyword,p,s);
//				model.addAttribute("list",list);
//				
//				boolean search = type !=null&&keyword != null;
//				model.addAttribute("search",search);
//				
//				
//				
//				int blockSize = 10;
//				int endBlock = (p+blockSize - 1) / blockSize * blockSize;
//				int startBlock = endBlock - (blockSize - 1);
//				
//				model.addAttribute("p",p);
//				model.addAttribute("s",s);
//				model.addAttribute("blockSize",blockSize);
//				model.addAttribute("endBlock",endBlock);
//				model.addAttribute("startBlock",startBlock);
//				model.addAttribute("type",type);
//				model.addAttribute("keyword",keyword);
//				return "member/list";
			
}



