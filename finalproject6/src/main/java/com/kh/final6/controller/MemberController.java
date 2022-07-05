package com.kh.final6.controller;


import java.io.IOException;

import java.text.DecimalFormat;
import java.text.Format;
import java.util.Random;

import java.util.List;

import javax.mail.MessagingException;
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

 
import com.kh.final6.entity.CertDto;

import com.kh.final6.entity.AttachmentDto;

import com.kh.final6.entity.MemberDto;
import com.kh.final6.error.UnauthorizeException;
import com.kh.final6.repository.AttachmentDao;
import com.kh.final6.repository.CertDao;
import com.kh.final6.repository.MemberDao;
import com.kh.final6.repository.MemberProfileDao;
import com.kh.final6.service.EmailService;
import com.kh.final6.service.MemberService;

import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/member")
@Slf4j
public class MemberController {

	@	Autowired
	private MemberDao memberDao; 
	
	@Autowired
	private AttachmentDao attachmentDao;
	
	@Autowired
	private MemberProfileDao memberProfileDao;
	
	@Autowired
	private MemberService memberService;
	
	@Autowired
	private EmailService emailService;
	
	@Autowired 
	private CertDao certDao;
	
	//회원가입 
	@GetMapping("/join")
	public String join() {
		return "member/join"; 	
	}

	@PostMapping("/join")
	public String join(
			@ModelAttribute MemberDto memberDto,
			@RequestParam MultipartFile memberProfile) throws IllegalStateException, IOException {
		
		//Service 관리 
		memberService.join(memberDto, memberProfile);
		
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
	public String mypage(@RequestParam int memberNo, 
			HttpSession session, Model model) {
		
		MemberDto memberDto = memberDao.oneNo(memberNo);
		model.addAttribute("memberDto", memberDto);
		
		int attachmentNo = memberProfileDao.one(memberNo);
		

		if(attachmentNo == 0) {
			model.addAttribute("profileUrl", "/img/user.png");
		}
		else {
		model.addAttribute("profileUrl", "/attachment/download?attachmentNo=" + attachmentNo);
		}
		String attachName = attachmentDao.name(attachmentNo);
		model.addAttribute("attachName",attachName);
		
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
	

	@GetMapping("/find_pw")
	public String findPw() {
		return "member/find_pw";
	}
	
	@PostMapping("/find_pw")
	public String findPw(@ModelAttribute MemberDto memberDto) throws MessagingException {
		MemberDto findDto = memberDao.find(memberDto);
		if(findDto == null) {
			return "redirect:find_pw?error";
		}
		if(findDto.getMemberId() == null) {
			return "redirect:email_is_null";
		}
		
		//남은회원들(정보도 맞고 이메일도 있는 회원)에게 이메일 발송
		emailService.sendPasswordResetMail(findDto);
		return "redirect:find_pw_send_mail";
	}
	
	@GetMapping("/email_is_null")
	public String emailIsNull() {
		return "error/email_is_null";
	}
	
	private Random r = new Random();
	private Format f = new DecimalFormat("000000");
	
	@GetMapping("/reset")
	public String reset(
			@RequestParam String memberId, 
			@RequestParam String cert,
			Model model) {
		CertDto certDto = CertDto.builder().certTarget(memberId).certNumber(cert).build();
		boolean isOk = certDao.check(certDto);
		if(isOk) {

	
			
			//추가 인증번호 생성 및 페이지로 전달
			String newCert = f.format(r.nextInt(1000000));
			certDao.insert(CertDto.builder()
														.certTarget(memberId)
														.certNumber(newCert)
													.build());
			model.addAttribute("cert", newCert);//쿠키로 해도 됨
			
			return "member/reset";
		}
		else {
			throw new UnauthorizeException();//401 error
		}
	}
	
	@PostMapping("/reset")
	public String reset(
			@ModelAttribute MemberDto memberDto,
			@RequestParam String cert) {
		boolean isOk = certDao.check(CertDto.builder()
										.certTarget(memberDto.getMemberId())
										.certNumber(cert)
										.build());
		if(isOk) {
			boolean result = memberDao.changePassword(memberDto);
			if(result) {
				return "redirect:reset_success";
			}
		}
		throw new UnauthorizeException();//401
	}
		@GetMapping("/find_pw_send_mail")
		public String findPwSendMail() {
			return "member/find_pw_send_mail";
		}
		
		@GetMapping("/reset_success")                                        
		public String resetSuccess() {
			return "member/reset_success";
		}

  //리스트
	@GetMapping("/list")
	public String list(
			@RequestParam (required = false) String type,
			@RequestParam (required = false) String keyword,
			@RequestParam (required = false, defaultValue = "1") int p,
			@RequestParam (required = false, defaultValue = "10") int s,
			Model model) {

		List<MemberDto> list = memberDao.list(type,keyword,p,s);
		model.addAttribute("list",list);

		boolean search = type !=null&&keyword != null;
		model.addAttribute("search",search);
		
		int count = memberDao.count(type,keyword);
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
		return "member/list";
	}
}




