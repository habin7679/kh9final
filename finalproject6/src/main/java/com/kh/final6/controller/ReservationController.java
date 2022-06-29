package com.kh.final6.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.final6.entity.ReservationDto;
import com.kh.final6.entity.StoreDto;
import com.kh.final6.repository.ReservationDao;
import com.kh.final6.repository.StoreDao;
import com.kh.final6.service.ReservationService;

@Controller
@RequestMapping("/reservation")
public class ReservationController {

	@Autowired
	private StoreDao storeDao;
	@Autowired
	private ReservationService reservationService;
	
	@GetMapping("/")
	public String reservation(
			@RequestParam int storeNo,
			HttpSession session,
			Model model
			) {
		model.addAttribute("storeDto", storeDao.one(storeNo));
		int memberNo = (int)session.getAttribute("login");
		model.addAttribute("memberNo", memberNo);
		return "reservation/reservation";
	}
	
	@PostMapping("/pay")
	public String pay(
			@ModelAttribute ReservationDto reservationDto
			) {
			reservationService.insert(reservationDto);
		
		return "reservation/reservation";
	}
}
