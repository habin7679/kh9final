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

import com.kh.final6.entity.SellerDto;
import com.kh.final6.repository.AttachmentDao;
import com.kh.final6.repository.MemberDao;
import com.kh.final6.repository.SellerDao;
import com.kh.final6.repository.SellerProfileDao;
import com.kh.final6.service.SellerService;
import com.kh.final6.vo.SellerInfoVO;
import com.kh.final6.vo.SellerMemberVO;

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

	@GetMapping("/pointToMoney")
	public String pointToMoney(
			HttpSession session,
			Model model,
			@RequestParam int sellerNo
			){
		SellerInfoVO sellerInfoVO = sellerDao.sellerMemberInfoVO(sellerNo);
		
		model.addAttribute("sellerInfoVO", sellerInfoVO);
		
		return "seller/pointToMoney";

	}
	@GetMapping("/adminlist")
	public String adminlist(
			@RequestParam (required = false) String type,
			@RequestParam (required = false) String keyword,
			@RequestParam (required = false, defaultValue = "1") int p,
			@RequestParam (required = false, defaultValue = "10") int s,
			Model model) {

		List<SellerMemberVO> adminlist = sellerDao.adminlist(type,keyword,p,s);
		model.addAttribute("adminlist",adminlist);

		boolean search = type !=null&&keyword != null;
		model.addAttribute("search",search);
		
		int count =sellerDao.count(type,keyword);
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
		return "seller/adminlist";
		
		
	
		
	}
	@GetMapping("/detail")
	public String detail(@RequestParam int sellerNo,
			Model model,
			HttpSession session,
			RedirectAttributes attr) {
		SellerDto sellerDto = sellerDao.one(sellerNo);
		model.addAttribute("sellerDto",sellerDto);
		
		int attachmentNo = sellerProfileDao.one(sellerNo);
		
		if(attachmentNo == 0) {
			model.addAttribute("profileUrl","/img/user.png");
		}
		else {
			model.addAttribute("profileUrl", "/attachment/download?attachmentNo=" + attachmentNo);
			}
			String attachName = attachmentDao.name(attachmentNo);
			model.addAttribute("attachName",attachName);
			
			return "seller/detail";
		
	}
	@GetMapping("/gradeEdit")
	public String gradeEdit(@RequestParam int sellerNo
			) {
		
		sellerDao.gradeEdit(sellerNo); // 판매자신청  완료
		
		int memberNo = sellerDao.sellerMemberNo(sellerNo); // 판매자 번호로 memberNo
		
		sellerDao.gradeMemberEdit(memberNo); // memberNo로 등급을 판매자로
		
		return "redirect:detail?sellerNo="+sellerNo;
	}
	@GetMapping("/gradeCancel")
	public String gradeCancel(@RequestParam int sellerNo
			) {
		sellerDao.gradeCancel(sellerNo);
		return "redirect:detail?sellerNo="+sellerNo;
	}
	
	
}




