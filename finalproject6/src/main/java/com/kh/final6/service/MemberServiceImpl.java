package com.kh.final6.service;

import java.io.IOException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.kh.final6.entity.MemberDto;
import com.kh.final6.repository.AttachmentDao;
import com.kh.final6.repository.MemberDao;
import com.kh.final6.repository.MemberProfileDao;

@Service
public class MemberServiceImpl implements MemberService {
	
	@Autowired 
	private MemberDao memberDao;
	
	@Autowired
	private AttachmentDao attachmentDao;
	
	@Autowired 
	private MemberProfileDao memberProfileDao;

	@Override
	public void join(MemberDto memberDto, MultipartFile memberProfile) throws IllegalStateException, IOException {
	
		memberDao.join(memberDto);
		
		//프로필 등록(실제 저장 + DB) - Attachment, MemberProfile / Transaction 
		if(!memberProfile.isEmpty()) {
			int attachmentNo = attachmentDao.save(memberProfile);
			memberProfileDao.insert(memberDto.getMemberId(), attachmentNo);
			
		}
	} 
	
}
	
