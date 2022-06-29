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
import com.kh.final6.repository.MemberDao;
import com.kh.final6.repository.ReservationDao;
import com.kh.final6.repository.StoreDao;
import com.kh.final6.service.ReservationService;
import com.kh.final6.vo.PaymentNoVO;

@Controller
@RequestMapping("/reservation")
public class ReservationController {

	@Autowired
	private StoreDao storeDao;
	@Autowired
	private ReservationService reservationService;
	@Autowired
	private ReservationDao reservationDao;
	@Autowired
	private MemberDao memberDao;

	
	@GetMapping("/")
	public String reservation(
			@RequestParam int storeNo,
			HttpSession session,
			Model model
			) {
		model.addAttribute("storeDto", storeDao.one(storeNo));
		int memberNo = (int)session.getAttribute("no");
		model.addAttribute("memberNo", memberNo);
		return "reservation/reservation";
	}
	
	@PostMapping("/insert")
	public String insert(
			@ModelAttribute ReservationDto reservationDto,
			Model model,
			HttpSession session
			) {
			reservationService.insert(reservationDto);
			ReservationDto reservationNewDto = reservationDao.one(reservationDto.getReservationNo());
			model.addAttribute("reservationDto", reservationNewDto);
			String memberId = (String)session.getAttribute("login");
			model.addAttribute("memberDto", memberDao.info(memberId));
			model.addAttribute("storeDto", storeDao.one(reservationNewDto.getStoreNo()));
			
		
		return "reservation/reservationCheck";
	}
	
	@PostMapping("/pay")
	public String pay(
			@ModelAttribute PaymentNoVO paymentNoVO,
			HttpSession session
			) {
		
		
		
		return null;
//		return "redirect:"+responseVO.getNext_redirect_pc_url();
	}
}
