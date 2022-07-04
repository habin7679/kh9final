
package com.kh.final6.rest;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import com.kh.final6.entity.StoreDto;
import com.kh.final6.repository.StoreDao;

@RestController
@RequestMapping("/rest/store")

public class StroeRestContoller {
	@Autowired
	private StoreDao storeDao;
	
	
	
	@GetMapping("/")
	public List<StoreDto> list(){
		return storeDao.list();
	}
}
