package com.kh.final6.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.final6.entity.ReviewDto;
import com.kh.final6.entity.StoreDto;
import com.kh.final6.repository.AttachmentDao;
import com.kh.final6.repository.ReviewAttachDao;
import com.kh.final6.repository.ReviewDao;
import com.kh.final6.repository.StoreAttachDao;
import com.kh.final6.repository.StoreDao;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class HomeController {
	
	@Autowired
	private StoreDao storeDao;
	
	@Autowired
	private StoreAttachDao storeAttachDao;
	
	@Autowired
	private AttachmentDao attachmentDao;
	
	@Autowired
	private ReviewDao reviewDao;
	
	@Autowired
	private ReviewAttachDao reviewAttachDao;

@RequestMapping("/")
public String index(@RequestParam (required = false, defaultValue = "1") int p,
					@RequestParam (required = false, defaultValue = "6") int s,
					Model model) {
	//가게 좋아요순 조회
	//스시
	List<StoreDto> sList = storeDao.sList(p,s);
	model.addAttribute("sList",sList);
	
	//첨부파일
	List<Integer> sAttachList = new ArrayList<>();
	
	for(StoreDto storeDto : sList) {
			int attachmentNo = storeAttachDao.info(storeDto.getStoreNo());
			sAttachList.add(attachmentNo);
		};
		
		model.addAttribute("sAttachList",sAttachList);
		
		boolean sNoAttach = sList.isEmpty();
		model.addAttribute("sNoAttach",sNoAttach);
		
	//한우
	List<StoreDto> cList = storeDao.cList(p,s);
	model.addAttribute("cList",cList);
	
	List<Integer> cAttachList = new ArrayList<>();
	
	for(StoreDto storeDto : cList) {
		int attachmentNo = storeAttachDao.info(storeDto.getStoreNo());
		cAttachList.add(attachmentNo);
	};
	
	model.addAttribute("cAttachList",cAttachList);
	
	boolean cNoAttach = cList.isEmpty();
	model.addAttribute("cNoAttach",cNoAttach);
		
	//디저트
	List<StoreDto> dList = storeDao.dList(p,s);
	model.addAttribute("dList",dList);
	
	List<Integer> dAttachList = new ArrayList<>();
	
	for(StoreDto storeDto : dList) {
		int attachmentNo = storeAttachDao.info(storeDto.getStoreNo());
		dAttachList.add(attachmentNo);
	};
	
	model.addAttribute("dAttachList",dAttachList);
	
	boolean dNoAttach = dList.isEmpty();
	model.addAttribute("dNoAttach",dNoAttach);
		
	//꼬치
	List<StoreDto> kList = storeDao.kList(p,s);
	model.addAttribute("kList",kList);
	
	List<Integer> kAttachList = new ArrayList<>();
	
	for(StoreDto storeDto : kList) {
		int attachmentNo = storeAttachDao.info(storeDto.getStoreNo());
		kAttachList.add(attachmentNo);
	};
	
	model.addAttribute("kAttachList",kAttachList);
	
	boolean kNoAttach = kAttachList.isEmpty();
	model.addAttribute("kNoAttach",kNoAttach);
	
	
	
	//위치로 검색하기
	
	
	//가게 리뷰
	List<ReviewDto> reviewList = reviewDao.list(p, s);
	model.addAttribute("review",reviewList);
	
	List<Integer> reviewAttachList = new ArrayList<>();
	List<String> storeList = new ArrayList<>();
	
	for(ReviewDto reviewDto : reviewList) {
		int reviewAttachNo = reviewAttachDao.info(reviewDto.getReviewNo());
		String stName = storeDao.name(reviewDto.getStoreNo());
		reviewAttachList.add(reviewAttachNo);
		storeList.add(stName);
	}
	model.addAttribute("reviewAttach",reviewAttachList);
	model.addAttribute("store",storeList);
	
	return "index";
	}
}



