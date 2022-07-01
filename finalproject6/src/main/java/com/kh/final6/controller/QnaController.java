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
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.final6.entity.MemberDto;
import com.kh.final6.entity.QnaDto;
import com.kh.final6.error.CannotFindException;
import com.kh.final6.repository.MemberDao;
import com.kh.final6.repository.QnaDao;

@Controller
@RequestMapping("/qna")
public class QnaController {
	
	@Autowired
	private QnaDao qnaDao;
	
	@Autowired
	private MemberDao memberDao;

	@GetMapping("/list")
	public String list(@RequestParam (required = false) String type,
						@RequestParam (required = false) String keyword,
						@RequestParam (required = false, defaultValue = "1") int p,
						@RequestParam (required = false, defaultValue = "10")int s,
						@RequestParam (required = false) String column,
						@RequestParam (required = false) String order,
						Model model) {
		
		List<QnaDto> list = qnaDao.selectList(type, keyword, p, s, column, order);
		model.addAttribute("list",list);
		
		boolean search = type != null && keyword != null;
		model.addAttribute("search",search);
		
		boolean readcountSearch = column == "notice_readcount" && order == "desc";
		boolean noDescSearch = column == "notice_no" && order == "desc";
		boolean noAscSearch = column == "notice_no" && order == "asc";
		model.addAttribute("readcountSearch",readcountSearch);
		model.addAttribute("noDescSearch",noDescSearch);
		model.addAttribute("noAscSearch",noAscSearch);
		
		int count = qnaDao.count(type,keyword);
		int lastPage = (count + s - 1) /s;
		
		int blockSize = 10;
		int endBlock = (p + blockSize - 1) / blockSize * blockSize;
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
		
		return "qna/list";
	}
	
	@GetMapping("/detail")
	public String detail(@RequestParam int qnaNo,
						HttpSession session,
						Model model) {
		QnaDto qnaDto = qnaDao.one(qnaNo);
		model.addAttribute("qnaDto",qnaDto);
		
		if(qnaDto.getQnaNo() != 0) {
			MemberDto memberDto = memberDao.info(qnaDto.getQnaWriter());
			model.addAttribute("memberDto",memberDto);
		}
		
		//내 글 여부 확인
		Integer memberNo = (Integer)session.getAttribute("no");
		boolean isLogin = memberNo != null;
		boolean isOwner = isLogin && memberNo.equals(qnaDto.getMemberNo());
		model.addAttribute("isLogin",isLogin);
		model.addAttribute("isOwner",isOwner);
		
		//관리자 확인
		String memberGrade = (String)session.getAttribute("auth");
		boolean isAdmin = isLogin && memberGrade.equals("관리자");
		model.addAttribute("isAdmin",isAdmin);
		
		return "qna/detail";
	}
	
	@GetMapping("/write")
	public String write(@RequestParam (required = false, defaultValue = "0") int superNo,
									Model model) {
		if(superNo > 0) {
			model.addAttribute("superNo",superNo);
		}
		return "qna/write";
	}
	
	@PostMapping("/write")
	public String write(@ModelAttribute QnaDto qnaDto,
						HttpSession session,
						RedirectAttributes attr) {
		int memberNo = (Integer)session.getAttribute("no");
		String memberId = (String)session.getAttribute("login");
		MemberDto memberDto = memberDao.info(memberId);
		qnaDto.setMemberNo(memberNo);
		qnaDto.setQnaWriter(memberDto.getMemberNick());
		
		int qnaNo = qnaDao.write(qnaDto);
		attr.addAttribute("qnaNo",qnaNo);
		
		return "redirect:detail";
	}
	
	@GetMapping("/edit")
	public String edit(@RequestParam int qnaNo, Model model) {
		QnaDto qnaDto = qnaDao.one(qnaNo);
		model.addAttribute(qnaDto);
		return "qna/edit";
	}
	
	@PostMapping("/edit")
	public String edit(@ModelAttribute QnaDto qnaDto,
						RedirectAttributes attr) {
		boolean success = qnaDao.update(qnaDto);
		if(success) {
			attr.addAttribute("qnaNo",qnaDto.getQnaNo());
			return "redirect:detail";
		}
		else {
			throw new CannotFindException();
		}
	}
	
	@GetMapping("/delete")
	public String delete(@RequestParam int qnaNo) {
		boolean success = qnaDao.delete(qnaNo);
		if(success) {
			return "redirect:list";
		}
		else {
			throw new CannotFindException();
		}
	}
}
