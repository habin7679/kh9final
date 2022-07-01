package com.kh.final6.service;

import java.io.IOException;

import org.springframework.web.multipart.MultipartFile;

import com.kh.final6.entity.MemberDto;

public interface MemberService {
	void join(MemberDto memberDto, MultipartFile memberProfile) throws IllegalStateException, IOException;

}
