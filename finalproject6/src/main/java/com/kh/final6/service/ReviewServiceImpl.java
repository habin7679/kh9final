package com.kh.final6.service;

import java.io.IOException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.kh.final6.entity.ReviewDto;
import com.kh.final6.repository.AttachmentDao;
import com.kh.final6.repository.ReviewAttachDao;
import com.kh.final6.repository.ReviewDao;
@Service
public class ReviewServiceImpl implements ReviewService {

	@Autowired
	private ReviewDao reviewDao;
	
	@Autowired
	private AttachmentDao attachmentDao;
	
	@Autowired
	private ReviewAttachDao reviewAttachDao;

	@Override
	public int save(ReviewDto reviewDto, MultipartFile reviewImg) throws IllegalStateException, IOException {
		int reviewNo = reviewDao.insert(reviewDto);
		if(!reviewImg.isEmpty()) {
			int attachmentNo = attachmentDao.save(reviewImg);
			reviewAttachDao.insert(reviewDto.getReviewNo(), attachmentNo);
		}
		return reviewNo;
	}
}
