package com.kh.final6.service;

import java.io.IOException;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import com.kh.final6.entity.BarRoomStoreDto;

public interface BarRoomStoreService {
	int save(BarRoomStoreDto barRoomStoreDto, MultipartFile storeImg) throws IllegalStateException, IOException;
	//int savelist(BarRoomStoreDto barRoomStoreDto,  List<MultipartFile> storeImg) throws IllegalStateException, IOException;
	
	int save1(BarRoomStoreDto barRoomStoreDto) throws IllegalStateException, IOException;		
}

