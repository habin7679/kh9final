package com.kh.final6.service;

import javax.mail.MessagingException;

import com.kh.final6.entity.MemberDto;

public interface EmailService {
	void sendCertification(String email);
	void sendPasswordResetMail(MemberDto findDto) throws MessagingException;
}