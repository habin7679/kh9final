package com.kh.final6.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;


import org.springframework.web.bind.annotation.DeleteMapping;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import org.springframework.web.bind.annotation.RequestParam;

import com.kh.final6.entity.StoreDto;

import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.final6.entity.AttachmentDto;
import com.kh.final6.entity.MemberDto;
import com.kh.final6.entity.NoticeDto;
import com.kh.final6.entity.ReviewDto;
import com.kh.final6.entity.RoomDto;
import com.kh.final6.entity.SellerDto;
import com.kh.final6.entity.StoreDto;
import com.kh.final6.repository.AttachmentDao;
import com.kh.final6.repository.MemberDao;
import com.kh.final6.repository.RoomDao;
import com.kh.final6.repository.SellerDao;
import com.kh.final6.repository.StoreAttachDao;

import com.kh.final6.repository.StoreDao;
import com.kh.final6.service.StoreService;


@Controller
@RequestMapping("/store")
public class StoreController {
	@Autowired
	private StoreDao storeDao; 
	
	@Autowired
	private StoreAttachDao storeAttachDao;
	
	@Autowired
	private StoreService storeService;
	
	@Autowired
	private MemberDao memberDao;
	
	@Autowired
	private SellerDao sellerDao;
	
	@Autowired
	private AttachmentDao attachmentDao;
	private AttachmentDto attachmentDto;
	

	//insert
	@GetMapping("/insert")
	public String insert() {
		return "store/insert";
	}
	
//	판매자 안될경우
	@PostMapping("/insert")
	public String insert(
			@ModelAttribute StoreDto storeDto
			) {
		storeDao.insert(storeDto);
		return "store/insert_finsh";
	//	return "redirect:/regularPay/insert";
	}
	
	
	
	
	
	
//	@PostMapping("/insert")
//	public String write(@ModelAttribute StoreDto storeDto,
//						@RequestParam MultipartFile storeImg,
//						HttpSession session,
//						RedirectAttributes attr) throws IllegalStateException, IOException {
//		int sellerNo= (Integer)session.getAttribute("no");
//		String memberId = (String)session.getAttribute("login");
//		MemberDto memberDto = memberDao.info(memberId);
//		storeDto.setSellerNo(sellerNo);
//		storeDto.setStoreNo(memberDto.getMemberNo());
//		
//		int storeNo = storeService.save(storeDto, storeImg);
//		
//		attr.addAttribute("storeNo",storeNo);
//		return "redirect:list";
//		
//	}
	
	

//
//	@RequestMapping("/insert_finsh")
//	public String insertFinsh() {
//		return "store/insert_finsh";
//	}
	
	
	
	
	//리스트
		@GetMapping("/list")
		public String list(
				@RequestParam (required = false) String type,
				@RequestParam (required = false) String keyword,
				@RequestParam (required = false, defaultValue = "1") int p,
				@RequestParam (required = false, defaultValue = "10") int s,
				Model model) {

			List<StoreDto> list =storeDao.list(type,keyword,p,s);
			model.addAttribute("list",list);

			boolean search = type !=null&&keyword != null;
			model.addAttribute("search",search);
			
			int count =storeDao.count(type,keyword);
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
			return "store/list";
		}
	
	@GetMapping("/detail")
	public String detail(@RequestParam int storeNo, Model model, HttpSession session, RedirectAttributes attr) {
		StoreDto storeDto = storeDao.one(storeNo);
		model.addAttribute("storeDto", storeDto);

		if (storeDto.getStoreNo() != 0) {
			MemberDto memberDto = memberDao.info(storeDto.getStoreName());
			model.addAttribute("memberDto", memberDto);
		}
		int attachmentNo = storeAttachDao.info(storeNo);
		AttachmentDto attachmentDto = attachmentDao.info(attachmentNo);

		if (attachmentDto != null) {
			String attachType = attachmentDto.getAttachmentType();
			boolean passImg = attachType == "image/jpeg" || attachType == "image/png"
					|| attachType == "image/gif" && attachType == "image/jpg";
			model.addAttribute("Img", passImg);
		}
		boolean storeAttach = attachmentNo == 0;
		model.addAttribute("storeAttach", storeAttach);
		model.addAttribute("storeImgUrl", "/attachment/download?attachmentNo=" + attachmentNo);

		String attachName = attachmentDao.name(attachmentNo);
		model.addAttribute("attachName", attachName);



		return "review/detail";
	}
	
	
	
	
	//@PutMapping("/addstore")
	//public StoreDto update(@RequestBody StoreDto storeDto) {
		//return storeDao.update(storeDto);
//	}
	//list
	//@GetMapping("/storeedit")
	//public List<StoreDto> list(){
	//	return storeDao.list();
	//}
	
	
	
	//@DeleteMapping("/{storeNo}")
	//@DeleteMapping("/delete")
	
	//public void delete(@PathVariable int storeNo) {
	//	storeDao.delete(storeNo);
	//}

}
