package com.kh.final6.repository;

import com.kh.final6.entity.MemberDto;


public interface MemberDao {

	void join(MemberDto memberDto);
	MemberDto login(String memberId, String memberPw);
	MemberDto info(String memberId);
	boolean changePassword(String memberId, String currentPw, String changePw);



	


	


}
