package com.kh.final6.service;

import java.io.IOException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.kh.final6.entity.StoreDto;
import com.kh.final6.repository.AttachmentDao;
import com.kh.final6.repository.StoreAttachDao;
import com.kh.final6.repository.StoreDao;

@Service
public class StoreServiceImpl implements StoreService{
	@Autowired
	private StoreDao storeDao;
	
	@Autowired
	private AttachmentDao attachmentDao;
	
	@Autowired
	private StoreAttachDao storeAttachDao;


	@Override
	public int save(StoreDto storeDto, MultipartFile storeImg) throws IllegalStateException, IOException {
		int storeNo = storeDao.insert(storeDto);
		if(!storeImg.isEmpty()) {
			int attachmentNo = attachmentDao.save(storeImg);
			storeAttachDao.insert(storeDto.getStoreNo(), attachmentNo);
		}
		return storeNo;
	}
}
