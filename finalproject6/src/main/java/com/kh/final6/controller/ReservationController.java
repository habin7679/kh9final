package com.kh.final6.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping("/reservation")
public class ReservationController {

	@GetMapping("/")
	public String reservation(
			@RequestParam int storeNo,
			Model model,
			HttpSession session
			) {
		model.addAttribute("storeNo", storeNo);
		
		return "reservation/reservation";
	}
}
