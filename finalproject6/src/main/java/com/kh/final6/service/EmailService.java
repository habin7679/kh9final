package com.kh.final6.service;

import java.io.IOException;

import javax.mail.MessagingException;

import com.kh.final6.entity.MemberDto;
import com.kh.final6.vo.MyReservationVO;

public interface EmailService {
	void sendCertification(String email);
	void sendPasswordResetMail(MemberDto findDto) throws MessagingException;
	void sendReservationInfo(int paymentNo) throws MessagingException, IOException;
}