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
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.final6.entity.AttachmentDto;
import com.kh.final6.entity.BarRoomStoreDto;
import com.kh.final6.entity.MemberDto;
import com.kh.final6.entity.SellerDto;
import com.kh.final6.entity.StoreDto;
import com.kh.final6.repository.AttachmentDao;
import com.kh.final6.repository.MemberDao;
import com.kh.final6.repository.SellerDao;
import com.kh.final6.repository.StoreAttachDao;
import com.kh.final6.repository.StoreDao;
import com.kh.final6.service.BarRoomStoreService;
import com.kh.final6.service.StoreService;



@Controller
@RequestMapping("/store")
public class StoreController {
	@Autowired
	private StoreDao storeDao; 
	
	@Autowired
	private BarRoomStoreService barRoomStoreService;
	
	@Autowired
	private StoreAttachDao storeAttachDao;
	
	@Autowired
	private AttachmentDao attachmentDao;
	

	@GetMapping("/insert_Tos")
	public String insertTos() {
		return "store/insert_Tos";
	}
	
	@GetMapping("/storeedit")
	public String storeedit() {
		return "store/storeedit";
	}
	@GetMapping("/New")
	public String New() {
		return "store/New";
	}
	
	//insert
	@GetMapping("/insert")
	public String insert() {
		return "store/insert";
	}
	
	@PostMapping("/insert")
	public String insert(
			@ModelAttribute SellerDto sellerDto, 
			@ModelAttribute BarRoomStoreDto barRoomStoreDto,
			@RequestParam MultipartFile storeImg,
		//	@RequestParam List<MultipartFile> storeImg,
			HttpSession session,
			RedirectAttributes attr) throws IllegalStateException, IOException
			 {
		
		//int sellerNo = (Integer)session.getAttribute("sellerNo");
		//	판매자 안될경우
		int sellerNo1 = 66;
		barRoomStoreDto.setSellerNo(sellerNo1);
		
		//int storeNo = storeService.save(storeDto, storeImg);
		System.out.println(">> barRoomStoreDto" + barRoomStoreDto.toString());
		//int storeNo = barRoomStoreService.savelist(barRoomStoreDto, storeImg);
		int storeNo = barRoomStoreService.save(barRoomStoreDto, storeImg);
		attr.addAttribute("storeNo",storeNo);
		
	return "redirect:/regularPay/pay?"+storeNo;
	}
	
	
	@GetMapping("/room")
	public String room() {
		return"store/room";
	}
	

//	
//	@PostMapping("/insert")
//	public String write(@ModelAttribute StoreDto storeDto,
//						@RequestParam MultipartFile storeImg,
//						HttpSession session,
//						RedirectAttributes attr) throws IllegalStateException, IOException {
//		session.setAttribute("sellerNo",memberDto.getMemberNo());
//		int sellerNo=(Integer)session.getAttribute("sellerNo");
//		SellerDto sellerDto = sellerDao.one(sellerNo);
//		storeDto.setSellerNo(sellerDto.getSellerNo());
//		storeDto.setStoreNo(sellerDto.getSellerNo());
//		
//		int storeNo = storeService.save(storeDto, storeImg);
//		
//		attr.addAttribute("storeNo",storeNo);
//		return "redirect:list";
//		
//	}
	@GetMapping("/list")
	public String list() {
		return "store/list";
	}
	
	
	
	@GetMapping("/detail/{storeNo}")
	public String detail2(@PathVariable int storeNo, Model model,
			@RequestParam MultipartFile storeImg) {
		StoreDto storeDto = storeDao.one(storeNo);
		model.addAttribute("storeDto",storeDto);
		
		return "store/detail";
	}
		
	
	
	
	
	
	
	@GetMapping("/detail")
	public String detail(@RequestParam int storeNo, Model model, HttpSession session, RedirectAttributes attr) {
		StoreDto storeDto = storeDao.one(storeNo);
		model.addAttribute("storeDto", storeDto);

		
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

		return "store/detail";
	}

	
	
	
	
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