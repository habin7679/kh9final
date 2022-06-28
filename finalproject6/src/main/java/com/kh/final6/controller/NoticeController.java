package com.kh.final6.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.final6.entity.NoticeDto;
import com.kh.final6.repository.NoticeDao;

@Controller
@RequestMapping("/notice")
public class NoticeController {
	
	@Autowired
	private NoticeDao noticeDao;
	

	@GetMapping("/list")
	public String list(
						@RequestParam (required = false) String type,
						@RequestParam (required = false) String keyword,
						@RequestParam (required = false, defaultValue = "1") int p,
						@RequestParam (required = false, defaultValue = "10") int s,
						Model model) {
		
		List<NoticeDto> list = noticeDao.list(type,keyword,p,s);
		model.addAttribute("list",list);
		
		boolean search = type != null && keyword != null;
		model.addAttribute("search",search);
		
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
		
		return "notice/list";
	}
	
	@GetMapping("/detail")
	public String detail(@RequestParam long noticeNo,
						Model model) {
		NoticeDto noticeDto = noticeDao.one(noticeNo);
		model.addAttribute("noticeDto",noticeDto);
		
		return "notice/detail";
	}
	
	//@GetMapping("/write")
	//@PostMapping("/write")
	//@GetMapping("/edit")
	//@PostMapping("/edit")
	//@GetMapping("/delete")
	
}
