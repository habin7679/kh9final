package com.kh.final6.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.final6.entity.MemberDto;
import com.kh.final6.entity.StoreDto;
import com.kh.final6.repository.MemberDao;
import com.kh.final6.repository.RegularPaymentDao;
import com.kh.final6.repository.StoreDao;
import com.kh.final6.service.KakaoPayRegularService;
import com.kh.final6.vo.StoreNameMemberNameVO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/regularPay")
public class RegularPayController {

	@Autowired
	private KakaoPayRegularService kakaoPayRegularService;
	@Autowired
	private RegularPaymentDao regularPaymentDao;
//	@Autowired
//	private SellerDao sellerDao;
	@Autowired
	private StoreDao storeDao;
	@Autowired
	private MemberDao memberDao;
	
	@GetMapping("/insert")
	public String insert(
			HttpSession session,
			Model model
			) {
		List<StoreNameMemberNameVO> list = regularPaymentDao.storeNameMemberName((int)session.getAttribute("no"));
//		SellerDto sellerDto = sellerDao.one(sellerStoreNoVO.getSellerNo());
		MemberDto memberDto = memberDao.oneNo((int)session.getAttribute("no"));
		
		model.addAttribute("memberDto", memberDto);
//		model.addAttribute("sellerDto", sellerDto);
		model.addAttribute("list", list);
		
		return "regularPay/insert";
	}
}
