package com.kh.final6.repository;

import java.util.List;

import com.kh.final6.entity.NoticeDto;
import com.kh.final6.entity.ReviewDto;



public interface ReviewDao {
	List<ReviewDto> list(int reviewNo);
	int insert(ReviewDto reviewDto);
	ReviewDto detail(int reviewNo);
	ReviewDto one(int storeNo);
	boolean edit(ReviewDto reviewDto);
	boolean delete(int reviewNo);
	List<ReviewDto> list(String type, String keyword, int p, int s);
	
	//메인 리뷰 조회
	List<ReviewDto> list(int p, int s);
	

}