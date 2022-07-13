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

import com.kh.final6.entity.SellerDto;
import com.kh.final6.repository.AttachmentDao;
import com.kh.final6.repository.MemberDao;
import com.kh.final6.repository.SellerDao;
import com.kh.final6.repository.SellerProfileDao;
import com.kh.final6.service.SellerService;

import lombok.extern.slf4j.Slf4j;


@Controller
@RequestMapping("/seller")
@Slf4j
public class SellerController {
	
	@	Autowired
	private SellerDao sellerDao; 
	
	@Autowired
	private AttachmentDao attachmentDao;
	
	@Autowired
	private MemberDao memberDao;
	
	@Autowired
	private SellerService sellerService;
	
	@Autowired
	private SellerProfileDao sellerProfileDao;

	
	
	@GetMapping("/join")
	public String join() {
		return "seller/join"; 	
	}

	@PostMapping("/join")
	public String join(
			@ModelAttribute SellerDto sellerDto,
			@RequestParam MultipartFile sellerProfile,
			Model model,
			HttpSession session) throws IllegalStateException, IOException {
			
			Integer memberNo = (Integer) session.getAttribute("no");
			sellerDto.setMemberNo(memberNo);
		
		
			sellerService.join(sellerDto, sellerProfile);
			
			return "seller/join_success";
		
	}
	
@GetMapping("/mypage")
	public String mypage(HttpSession session, Model model) {
		int sellerNo = (int) session.getAttribute("no");
		int memberNo = (int)session.getAttribute("no");
		
		SellerDto sellerDto = sellerDao.one(sellerNo);
		model.addAttribute("sellerDto", sellerDto);
		
		System.out.println("console : mypage()");
		
		int attachmentNo = sellerProfileDao.one(sellerNo); 
		
		
		if(attachmentNo == 0) {
			model.addAttribute("profileUrl", "/img/user.png");
		}
		else {
		model.addAttribute("profileUrl", "/attachment/download?attachmentNo=" + attachmentNo);
		}
		String attachName = attachmentDao.name(attachmentNo);
		model.addAttribute("attachName",attachName);
		
		return "seller/mypage";
	
	}

	@GetMapping("/info")
	public String infoGet(
			HttpSession session, Model model) {

       int sellerNo = (Integer) session.getAttribute("no");
		List<SellerDto> list = sellerDao.list(sellerNo);
		// log.debug("sellseNo = {}",list);

		model.addAttribute("list", list);
	
		return "seller/info";
		
	}
}






