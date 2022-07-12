package com.kh.final6.service;

import java.io.IOException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.kh.final6.entity.SellerDto;
import com.kh.final6.repository.AttachmentDao;
import com.kh.final6.repository.SellerDao;
import com.kh.final6.repository.SellerProfileDao;

@Service
public class SellerServiceImpl implements SellerService {

	@Autowired 
	private SellerDao sellerDao;
	
	@Autowired
	private AttachmentDao attachmentDao;
	
	@Autowired
	private SellerProfileDao sellerProfileDao;
	
	
	@Override
	public void join(SellerDto sellerDto, MultipartFile sellerProfile) throws IllegalStateException, IOException {
		
		sellerDao.join(sellerDto);
		
		//사업자 등록(실제 저장 + DB) - Attachment, SellerProfile / Transaction 
		if(!sellerProfile.isEmpty()) {
			int attachmentNo = attachmentDao.save(sellerProfile);
			sellerProfileDao.insert(sellerDto.getSellerNo(), attachmentNo);
		}
	}
}
