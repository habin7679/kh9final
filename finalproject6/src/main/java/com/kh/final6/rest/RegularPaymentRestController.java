package com.kh.final6.rest;

import java.net.URISyntaxException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.kh.final6.entity.RegularPaymentDto;
import com.kh.final6.repository.RegularPaymentDao;
import com.kh.final6.service.KakaoPayRegularService;
import com.kh.final6.vo.KakaoPayRegularCancelRequestVO;
import com.kh.final6.vo.KakaoPayRegularCancelResponseVO;
import com.kh.final6.vo.KakaoPayRegularReadyRequestVO;
import com.kh.final6.vo.KakaoPayRegularReadyResponseVO;

import lombok.extern.slf4j.Slf4j;

@RestController
@RequestMapping("/rest/regularPayment")
@Slf4j
@CrossOrigin(origins = "*")
public class RegularPaymentRestController {
	
	@Autowired
	private RegularPaymentDao regularPaymentDao;
	
	@Autowired
	private KakaoPayRegularService kakaoPayRegularService;

	@GetMapping("/list/{sellerNo}")
	public List<RegularPaymentDto> list(
			@PathVariable int sellerNo
			){
		return regularPaymentDao.listSellerNo(sellerNo);
	}
	
	@DeleteMapping("/delete/{regularPaymentNo}")
	public void delete(
			@PathVariable int regularPaymentNo
			) throws URISyntaxException {
		
		RegularPaymentDto regularPaymentDto = regularPaymentDao.listAll(regularPaymentNo);
		KakaoPayRegularCancelRequestVO requestVO=
														KakaoPayRegularCancelRequestVO.builder()
															.sid(regularPaymentDto.getRegularPaymentSid())
														.build();
		KakaoPayRegularCancelResponseVO responseVO = 
				kakaoPayRegularService.cancel(requestVO);
		
		regularPaymentDao.delete(regularPaymentNo);
		

	}
	

	
}
