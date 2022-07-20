package com.kh.final6.service;

import java.io.IOException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.kh.final6.entity.BarRoomStoreDto;
import com.kh.final6.repository.AttachmentDao;
import com.kh.final6.repository.BarRoomStoreDao;
import com.kh.final6.repository.StoreAttachDao;

@Service
public class BarRoomStoreServiceImpl implements BarRoomStoreService{
	@Autowired
	private BarRoomStoreDao barRoomStoreDao;
	
	
	@Autowired
	private AttachmentDao attachmentDao;
	
	@Autowired
	private StoreAttachDao storeAttachDao;


	@Override
	public int save(BarRoomStoreDto barRoomStoreDto, MultipartFile storeImg) throws IllegalStateException, IOException {
		int storeNo = barRoomStoreDao.save(barRoomStoreDto);
		
		System.out.println("스토어넘버"+storeNo);
		if(!storeImg.isEmpty()) {
			int attachmentNo = attachmentDao.save(storeImg);
			storeAttachDao.insert(barRoomStoreDto.getStoreNo(), attachmentNo);
		}
		
		int result1 = barRoomStoreDao.saveRoom(barRoomStoreDto);
		int result2 = barRoomStoreDao.saveBar(barRoomStoreDto);
		int result3 = barRoomStoreDao.saveOff(barRoomStoreDto);
		System.out.println("룸"+result1);
		System.out.println("바"+result2);
		System.out.println("휴무"+result3);
		return storeNo;
	}


	@Override
	public int save1(BarRoomStoreDto barRoomStoreDto) throws IllegalStateException, IOException {
		int storeNo = barRoomStoreDao.save(barRoomStoreDto);
		
		System.out.println("스토어넘버"+storeNo);
		int result1 = barRoomStoreDao.saveRoom(barRoomStoreDto);
		int result2 = barRoomStoreDao.saveBar(barRoomStoreDto);
		int result3 = barRoomStoreDao.saveOff(barRoomStoreDto);
		System.out.println("룸"+result1);
		System.out.println("바"+result2);
		System.out.println("휴무"+result3);
		return storeNo;
	}


	@Override
	public int savelist(BarRoomStoreDto barRoomStoreDto, List<MultipartFile> storeImg) throws IllegalStateException, IOException {
		int storeNo = barRoomStoreDao.save(barRoomStoreDto);
		
		if(!storeImg.isEmpty()) {
			for(MultipartFile list :storeImg) {
			int attachmentNo = attachmentDao.savelist(list);
			storeAttachDao.insert(storeNo, attachmentNo);
		}
		}
		
		int result1 = barRoomStoreDao.saveRoom(barRoomStoreDto);
		int result2 = barRoomStoreDao.saveBar(barRoomStoreDto);
		int result3 = barRoomStoreDao.saveOff(barRoomStoreDto);
		System.out.println("룸"+result1);
		System.out.println("바"+result2);
		System.out.println("휴무"+result3);
		return storeNo;
	}


	@Override
	public int edit(BarRoomStoreDto barRoomStoreDto) {
			int storeNo = barRoomStoreDao.edit(barRoomStoreDto);
			int result1 = barRoomStoreDao.editRoom(barRoomStoreDto);
			int result2 = barRoomStoreDao.editBar(barRoomStoreDto);
			int result3 = barRoomStoreDao.editOff(barRoomStoreDto);
			System.out.println("룸"+result1);
			System.out.println("바"+result2);
			System.out.println("휴무"+result3);
			return storeNo;
		
	}
}
