package com.kh.final6.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.kh.final6.entity.MemberDto;
import com.kh.final6.entity.StoreDto;
import com.kh.final6.repository.MemberDao;
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
	public String insert(@ModelAttribute StoreDto storeDto) {
		storeDao.insert(storeDto);		
		return "store/insert_finsh";
	
	}
	

	@RequestMapping("/insert_finsh")
	public String insertFinsh() {
		return "store/insert_finsh";
	}
	
	
	
	
	@GetMapping("/list")
	public String list() {
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
