package com.kh.final6.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.final6.repository.StoreDao;

@Controller
@RequestMapping("/reservation")
public class ReservationController {

	@Autowired
	private StoreDao storeDao;
	
	@GetMapping("/")
	public String reservation(
			@RequestParam int storeNo,
			Model model
			) {
		model.addAttribute("storeDto", storeDao.one(storeNo));

		return "reservation/reservation";
	}
}
