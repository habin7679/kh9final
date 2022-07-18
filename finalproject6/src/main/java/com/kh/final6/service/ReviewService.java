package com.kh.final6.service;

import java.io.IOException;

import org.springframework.web.multipart.MultipartFile;

import com.kh.final6.entity.ReviewDto;

public interface ReviewService {
	int save(ReviewDto reviewDto, MultipartFile reviewImg) throws IllegalStateException, IOException;

	void edit(ReviewDto reviewDto, MultipartFile reviewImg)throws IllegalStateException, IOException;
}

