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
import com.kh.final6.entity.QnaDto;
import com.kh.final6.entity.ReviewDto;
import com.kh.final6.error.CannotFindException;
import com.kh.final6.repository.AttachmentDao;
import com.kh.final6.repository.MemberDao;
import com.kh.final6.repository.ReviewAttachDao;
import com.kh.final6.repository.ReviewDao;
import com.kh.final6.service.ReviewService;

@Controller
@RequestMapping("/review")
public class ReviewController {
	@Autowired
	private ReviewDao reviewDao;
	
	@Autowired
	private MemberDao memberdao;
	
	
	@Autowired
	private ReviewAttachDao reviewAttachDao;
	
	@Autowired
	private ReviewService reviewService;
	
	@Autowired
	private AttachmentDao attachmentDao;
	private AttachmentDto attachmentDto;
	
	@GetMapping("/insert")
	public String insert() {
		return "review/insert";
	}
	
	@PostMapping("/insert")
	public String insert(
			@ModelAttribute ReviewDto reviewDto,
			@RequestParam MultipartFile reviewImg,
			HttpSession session,
			RedirectAttributes attr) throws IllegalStateException, IOException {
		int memberNo = (Integer)session.getAttribute("no");
		String memberId = (String)session.getAttribute("login");
		MemberDto memberDto = memberdao.info(memberId);
		reviewDto.setMemberNo(memberNo);
		System.out.println("멤버no"+memberNo);
		System.out.println("리뷰디티오"+reviewDto);
		reviewDto.setReviewWriter(memberDto.getMemberNick());
		
		int reviewNo = reviewService.save(reviewDto, reviewImg);
		
		attr.addAttribute("reviewNo",reviewNo);
		
		return "redirect:/review/list";
	}
	

	@GetMapping("/edit")
	public String edit(@RequestParam int reviewNo,Model model) {
		ReviewDto reviewDto = reviewDao.one(reviewNo);
		model.addAttribute(reviewDto);
		return "review/edit";
	}
	
	
	
	@PostMapping("/edit")
	public String edit(@ModelAttribute ReviewDto reviewDto,
						RedirectAttributes attr) {
		boolean success = reviewDao.update(reviewDto);
		if(success) {
			attr.addAttribute("reviewNo",reviewDto.getReviewNo());
			return "redirect:detail";
		}
		else {
			throw new CannotFindException();
		}
	}
	
	
	@GetMapping("/delete")
	public String delete(@RequestParam int reviewNo) {
		boolean success = reviewDao.delete(reviewNo);
		
		if(success) {
			return "redirect:/review/list";
		}
		else {
			throw new CannotFindException();
		}
	}
	
	
	@GetMapping("/detail")
	public String detail(@RequestParam int reviewNo, Model model, HttpSession session, RedirectAttributes attr) {
		ReviewDto reviewDto = reviewDao.one(reviewNo);
		model.addAttribute("reviewDto", reviewDto);

		if (reviewDto.getReviewNo() != 0) {
			MemberDto memberDto = memberdao.info(reviewDto.getReviewWriter());
			model.addAttribute("memberDto", memberDto);
		}
		int attachmentNo = reviewAttachDao.info(reviewNo);
		AttachmentDto attachmentDto = attachmentDao.info(attachmentNo);

		if (attachmentDto != null) {
			String attachType = attachmentDto.getAttachmentType();
			boolean passImg = attachType == "image/jpeg" || attachType == "image/png"
					|| attachType == "image/gif" && attachType == "image/jpg";
			model.addAttribute("Img", passImg);
		}
		boolean reviewAttach = attachmentNo == 0;
		model.addAttribute("reviewAttach", reviewAttach);
		model.addAttribute("reviewImgUrl", "/attachment/download?attachmentNo=" + attachmentNo);

		String attachName = attachmentDao.name(attachmentNo);
		model.addAttribute("attachName", attachName);

//내 글 여부 확인
		Integer memberNo = (Integer) session.getAttribute("no");
		boolean isLogin = memberNo != null;
		boolean isOwner = isLogin && memberNo.equals(reviewDto.getMemberNo());
		model.addAttribute(isLogin);
		model.addAttribute(isOwner);

//관리자 여부 확인
		String memberGrade = (String) session.getAttribute("auth");
		boolean isAdmin = isLogin && memberGrade.equals("관리자");
		model.addAttribute(isAdmin);

		attr.addAttribute("reviewNo", reviewNo);

		return "review/detail";
	}
	
	
	
	@GetMapping("/list")
	public String list(@RequestParam (required = false) String type,
			@RequestParam (required = false) String keyword,
			@RequestParam (required = false, defaultValue = "1") int p,
			@RequestParam (required = false, defaultValue = "10") int s,
			Model model) {
		
		List<ReviewDto> list = reviewDao.list(type,keyword,p,s);
		model.addAttribute("list",list);
		
		
		return "review/list";
	}
	
	
}

