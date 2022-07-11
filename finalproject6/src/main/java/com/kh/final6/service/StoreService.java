package com.kh.final6.service;

import java.io.IOException;

import org.springframework.web.multipart.MultipartFile;

import com.kh.final6.entity.StoreDto;

public interface StoreService {
	int save(StoreDto storeDto, MultipartFile storeImg) throws IllegalStateException, IOException;
	
}
