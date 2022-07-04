package com.kh.final6.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.final6.repository.RegularPaymentDao;
import com.kh.final6.service.KakaoPayRegularService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Configuration
@RequestMapping("/regularPay")
public class RegularPayController {

	@Autowired
	private KakaoPayRegularService kakaoPayRegularService;
	@Autowired
	private RegularPaymentDao regularPaymentDao;
	
	@GetMapping("/insert")
	public String insert() {
		
		return "regularPay/insert";
	}
}
