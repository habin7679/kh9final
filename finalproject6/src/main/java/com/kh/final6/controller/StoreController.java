package com.kh.final6.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.final6.entity.StoreDto;
import com.kh.final6.repository.StoreDao;


@Controller
@RequestMapping("/store")
public class StoreController {
	@Autowired
	private StoreDao storeDao; 
	

	//insert
	@GetMapping("/insert")
	public String insert() {
		return "store/insert";
	}
	

	@PostMapping("/insert")
	public String insert(
			@ModelAttribute StoreDto storeDto
			) {
		storeDao.insert(storeDto);
		return "store/insert_finsh";
//		return "redirect:/regularPay/insert";
	
	}
	
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
	public String detail() {
		return "store/detail";
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
