package com.kh.final6.rest;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.kh.final6.entity.ReplyDto;
import com.kh.final6.repository.ReplyDao;


@RestController
@RequestMapping("/ajax")
public class ReplyManageRestController {
	
	@Autowired
	private ReplyDao replyDao;
	
	@PostMapping("/")
	public void delete(@RequestParam (value = "dataList[]") String[] dataList) {
		for(String data : dataList) {
			int replyNo = Integer.parseInt(data);
			replyDao.delete(replyNo);
		};
	}
	
	@PostMapping("/list")
	public List<ReplyDto> list (@RequestParam int memberNo,
								@RequestParam int p,
								@RequestParam int s,
								@RequestParam (required = false) String type,
								@RequestParam (required = false) String keyword){
		return replyDao.ownerList(p,s, type, keyword,memberNo);
	}
}
