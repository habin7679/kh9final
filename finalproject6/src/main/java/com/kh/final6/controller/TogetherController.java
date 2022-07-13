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
import com.kh.final6.entity.TogetherDto;
import com.kh.final6.error.CannotFindException;
import com.kh.final6.repository.MemberDao;
import com.kh.final6.repository.TogetherDao;

@Controller
@RequestMapping("/together")
public class TogetherController {
	
	@Autowired
	private TogetherDao togetherDao;
	
	@Autowired
	private MemberDao memberDao;

	@GetMapping("/list")
	public String list(@RequestParam (required = false) String type,
						@RequestParam (required = false) String keyword,
						@RequestParam (required = false, defaultValue = "1") int p,
						@RequestParam (required = false, defaultValue = "10") int s,
						@RequestParam (required = false) String column,
						@RequestParam (required = false) String order,
						Model model) {
		List<TogetherDto> list = togetherDao.selectList(type, keyword, p,s ,column, order);
		model.addAttribute("list",list);
		
		boolean search = type != null && keyword != null;
		model.addAttribute("search",search);
		
		boolean readcountSearch = column == "together_readcount" && order == "desc";
		boolean noDescSearch = column == "together_no" && order == "desc";
		boolean noAscSearch = column == "together_no" && order == "asc";
		model.addAttribute("readcountSearch",readcountSearch);
		model.addAttribute("noDescSearch",noDescSearch);
		model.addAttribute("noAscSearch",noAscSearch);
		
		int count = togetherDao.count(type,keyword);
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
		model.addAttribute("startBlock",startBlock);
		model.addAttribute("endBlock",endBlock);
		model.addAttribute("type",type);
		model.addAttribute("keyword",keyword);
		model.addAttribute("lastPage",lastPage);
		
		return "together/list";
	}
	
	@GetMapping("/detail")
	public String detail(@RequestParam int togetherNo,
						HttpSession session,
						Model model) {
		TogetherDto togetherDto = togetherDao.one(togetherNo);
		model.addAttribute("togetherDto",togetherDto);
		
		if(togetherDto.getTogetherWriter() != null) {
			MemberDto memberDto = memberDao.info(togetherDto.getTogetherWriter());
			model.addAttribute("memberDto",memberDto);
		}
		
		//내 글인지 판정
		Integer memberNo = (Integer)session.getAttribute("no");
		boolean isLogin = memberNo != null;
		boolean isOwner = isLogin && memberNo.equals(togetherDto.getMemberNo());
		model.addAttribute("isLogin",isLogin);
		model.addAttribute("isOwner",isOwner);
		
		//관리자인지 판정
		String memberKind = (String)session.getAttribute("auth");
		boolean isAdmin = isLogin && memberKind.equals("관리자");
		model.addAttribute("isAdmin",isAdmin);
		
		return "together/detail";
	}
	
	@GetMapping("/write")
	public String write() {
		return "together/write";
	}
	
	@PostMapping("/write")
	public String write(@ModelAttribute TogetherDto togetherDto,
						HttpSession session,
						RedirectAttributes attr) {
		int memberNo = (Integer)session.getAttribute("no");
		String memberId = (String)session.getAttribute("login");
		MemberDto memberDto = memberDao.info(memberId);
		togetherDto.setMemberNo(memberNo);
		togetherDto.setTogetherWriter(memberDto.getMemberNick());
		
		int togetherNo = togetherDao.write(togetherDto);
		
		attr.addAttribute("togetherNo",togetherNo);
		return "redirect:detail";
	}
	
	@GetMapping("/delete")
	public String delete(@RequestParam int togetherNo) {
		boolean success = togetherDao.delete(togetherNo);
		if(success) {
			return "redirect:list";
		}
		else {
			throw new CannotFindException();
		}
	}
	
	@GetMapping("/edit")
	public String edit(@RequestParam int togetherNo,
						Model model) {
		TogetherDto togetherDto = togetherDao.one(togetherNo);
		model.addAttribute("togetherDto",togetherDto);
		return "together/edit";
	}
	
	@PostMapping("/edit")
	public String edit(@ModelAttribute TogetherDto togetherDto,
						RedirectAttributes attr) {
		boolean success = togetherDao.update(togetherDto);
		if(success) {
			attr.addAttribute("togetherNo",togetherDto.getTogetherNo());
			return "redirect:detail";
		}
		else {
			throw new CannotFindException();
		}
	}
	
	@GetMapping("/error")
	public String error() {
		return "error/notAdmin";
	}
}
