package com.kh.final6.controller;

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
	public String list() {
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
