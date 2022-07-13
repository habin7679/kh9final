package com.kh.final6.service;

import java.io.IOException;

import org.springframework.web.multipart.MultipartFile;

import com.kh.final6.entity.SellerDto;

public interface SellerService {
		void join(SellerDto sellerDto, MultipartFile sellerProfile) throws IllegalStateException, IOException;
}


