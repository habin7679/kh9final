package com.kh.final6.service;

import java.io.IOException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.kh.final6.entity.AttachmentDto;
import com.kh.final6.entity.NoticeAttachDto;
import com.kh.final6.entity.NoticeDto;
import com.kh.final6.repository.AttachmentDao;
import com.kh.final6.repository.NoticeAttachDao;
import com.kh.final6.repository.NoticeDao;

@Service
public class NoticeServiceImpl implements NoticeService{
	
	@Autowired
	private NoticeDao noticeDao;
	
	@Autowired
	private AttachmentDao attachmentDao;
	
	@Autowired
	private NoticeAttachDao noticeAttachDao;

	@Override
	public int save(NoticeDto noticeDto, MultipartFile noticeImg) throws IllegalStateException, IOException {
		int noticeNo = noticeDao.insert(noticeDto);
		
		if(!noticeImg.isEmpty()) {
			int attachmentNo = attachmentDao.save(noticeImg);
			noticeAttachDao.insert(noticeDto.getNoticeNo(), attachmentNo);
		}
		return noticeNo;
	}

	@Override
	public void edit(NoticeDto noticeDto, MultipartFile noticeImg) throws IllegalStateException, IOException {
		
		if(!noticeImg.isEmpty()) {
			int attachmentNo = attachmentDao.save(noticeImg);
			noticeAttachDao.insert(noticeDto.getNoticeNo(), attachmentNo);
		}
		
	}

}
