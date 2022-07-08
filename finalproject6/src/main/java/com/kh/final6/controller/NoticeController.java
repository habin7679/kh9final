package com.kh.final6.controller;

import java.io.IOException;
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
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.final6.entity.AttachmentDto;
import com.kh.final6.entity.MemberDto;
import com.kh.final6.entity.NoticeDto;
import com.kh.final6.error.CannotFindException;
import com.kh.final6.repository.AttachmentDao;
import com.kh.final6.repository.MemberDao;
import com.kh.final6.repository.NoticeAttachDao;
import com.kh.final6.repository.NoticeDao;
import com.kh.final6.service.NoticeService;


@Controller
@RequestMapping("/notice")
public class NoticeController {
	
	@Autowired
	private NoticeDao noticeDao;
	
	@Autowired
	private MemberDao memberDao;
	
	@Autowired
	private NoticeAttachDao noticeAttachDao;
	
	@Autowired
	private NoticeService noticeService;
	
	@Autowired
	private AttachmentDao attachmentDao;
	
	@GetMapping("/list")
	public String list(
						@RequestParam (required = false) String type,
						@RequestParam (required = false) String keyword,
						@RequestParam (required = false, defaultValue = "1") int p,
						@RequestParam (required = false, defaultValue = "10") int s,
						@RequestParam (required = false) String column,
						@RequestParam (required = false) String order,
						Model model) {
		
		List<NoticeDto> list = noticeDao.list(type,keyword,p,s, column, order);
		model.addAttribute("list",list);
		
		boolean search = type != null && keyword != null;
		model.addAttribute("search",search);
		
		boolean readcountSearch = column == "notice_readcount" && order == "desc";
		boolean noDescSearch = column == "notice_no" && order == "desc";
		boolean noAscSearch = column == "notice_no" && order == "asc";
		model.addAttribute("readcountSearch",readcountSearch);
		model.addAttribute("noDescSearch",noDescSearch);
		model.addAttribute("noAscSearch",noAscSearch);
		
		int count = noticeDao.count(type,keyword);
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
		model.addAttribute("lastPage",lastPage);
		
		return "notice/list";
	}
	

//	@GetMapping("/list")
//	public String list(
//						@RequestParam (required = false) String type,
//						@RequestParam (required = false) String keyword,
//						@RequestParam (required = false, defaultValue = "1") int p,
//						@RequestParam (required = false, defaultValue = "10") int s,
//						Model model) {
//		
//		List<NoticeDto> list = noticeDao.list(type,keyword,p,s);
//		model.addAttribute("list",list);
//		
//		boolean search = type != null && keyword != null;
//		model.addAttribute("search",search);
//		
//		
//		
//		int count = noticeDao.count(type,keyword);
//		int lastPage = (count + s - 1) /s;
//		
//		int blockSize = 10;
//		int endBlock = (p + blockSize - 1) / blockSize * blockSize;
//		int startBlock = endBlock - (blockSize - 1);
//		if(endBlock > lastPage){
//			endBlock = lastPage;
//		}
//		model.addAttribute("p",p); 
//		model.addAttribute("s",s);
//		model.addAttribute("blockSize",blockSize);
//		model.addAttribute("endBlock",endBlock);
//		model.addAttribute("startBlock",startBlock);
//		model.addAttribute("type",type);
//		model.addAttribute("keyword",keyword);
//		model.addAttribute("lastPage",lastPage);
//		
//		return "notice/list";
//	}
	
	@GetMapping("/detail")
	public String detail(@RequestParam int noticeNo,
						Model model,
						HttpSession session,
						RedirectAttributes attr) {
		NoticeDto noticeDto = noticeDao.one(noticeNo);
		model.addAttribute("noticeDto",noticeDto);
		
		if(noticeDto.getNoticeNo() != 0) {
			MemberDto memberDto = memberDao.info(noticeDto.getNoticeWriter());
			model.addAttribute("memberDto",memberDto);
		}
		int attachmentNo = noticeAttachDao.info(noticeNo);
		AttachmentDto attachmentDto = attachmentDao.info(attachmentNo);
		
		if(attachmentDto != null) {
			String attachType = attachmentDto.getAttachmentType();
			boolean passImg = attachType == "image/jpeg" || attachType == "image/png" || attachType == "image/gif" && attachType == "image/jpg";
			model.addAttribute("Img",passImg);
		}
		boolean noAttach = attachmentNo == 0;
		model.addAttribute("noAttach",noAttach);
		model.addAttribute("noticeImgUrl","/attachment/download?attachmentNo="+attachmentNo);
		
		String attachName = attachmentDao.name(attachmentNo);
		model.addAttribute("attachName",attachName);
		
		
		//내 글 여부 확인
		Integer memberNo = (Integer)session.getAttribute("no");
		boolean isLogin = memberNo != null; 
		boolean isOwner = isLogin && memberNo.equals(noticeDto.getMemberNo());
		model.addAttribute("isLogin",isLogin);
		model.addAttribute("isOwner",isOwner);
		
		//관리자 여부 확인
		String memberKind = (String)session.getAttribute("auth");
		boolean isAdmin = isLogin && memberKind.equals("관리자"); 
		model.addAttribute("isAdmin",isAdmin);
		
		attr.addAttribute("noticeNo",noticeNo);
		
		return "notice/detail";
	}
	
	@GetMapping("/write")
	public String write() {
		return "notice/write";
	}
	
	@PostMapping("/write")
	public String write(@ModelAttribute NoticeDto noticeDto,
						@RequestParam MultipartFile noticeImg,
						HttpSession session,
						RedirectAttributes attr) throws IllegalStateException, IOException {
		int memberNo= (Integer)session.getAttribute("no");
		String memberId = (String)session.getAttribute("login");
		MemberDto memberDto = memberDao.info(memberId);
		noticeDto.setMemberNo(memberNo);
		noticeDto.setNoticeWriter(memberDto.getMemberNick());
		
		int noticeNo = noticeService.save(noticeDto, noticeImg);
		
		attr.addAttribute("noticeNo",noticeNo);
		return "redirect:detail";
		
	}
	
	@GetMapping("/delete")
	public String delete(@RequestParam int noticeNo) {
		boolean success = noticeDao.delete(noticeNo);
		
		if(success) {
			return "redirect:list";
		}
		else {
			throw new CannotFindException();
		}
	}
	
	@GetMapping("/edit")
	public String edit(@RequestParam int noticeNo,
						Model model) {
		NoticeDto noticeDto = noticeDao.one(noticeNo);
		model.addAttribute(noticeDto);
		return "notice/edit";
	}
	
	@PostMapping("/edit")
	public String edit(@ModelAttribute NoticeDto noticeDto,
						RedirectAttributes attr) {
		boolean success = noticeDao.update(noticeDto);
		if(success) {
			attr.addAttribute("noticeNo",noticeDto.getNoticeNo());
			return "redirect:detail";
		}
		else {
			throw new CannotFindException();
		}
	}
	@GetMapping("/error")
	public String error() {
		return "error/notaAdmin";
	}
}
