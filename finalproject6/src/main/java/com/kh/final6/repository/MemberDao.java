package com.kh.final6.repository;

import java.util.List;

import com.kh.final6.entity.MemberDto;


public interface MemberDao {

	void join(MemberDto memberDto);
	MemberDto login(String memberId, String memberPw);
	MemberDto info(String memberId);
	MemberDto oneNo(int memberNo);
	boolean changePassword(String memberId, String currentPw, String changePw);
	boolean exit(String memberId, String memberPw);
	boolean changeInformation(MemberDto memberDto);
	String findId(MemberDto memberDto);

	MemberDto find(MemberDto memberDto);
	boolean changePassword(MemberDto memberDto);

	List<MemberDto> list(String type, String keyword, int p, int s);
	int count(String type, String keyword);




}