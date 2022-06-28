package com.kh.final6.repository;


import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.final6.entity.MemberDto;

	//@Repository
	@Service
	public class MemberDaoImpl implements MemberDao {

		@	Autowired
		private SqlSession sqlSession; 
		
		@Override
		public void join(MemberDto memberDto) {

			int memberNo = sqlSession.selectOne("member.sequence");

			memberDto.setMemberNo(memberNo);	
			sqlSession.insert("member.join", memberDto);
			}

		// String memberPw 는 사용자가 입력한 비밀번호 
		// memberDto 는 DB 데이터 
		
		@Override
			public MemberDto login(String memberId, String memberPw) {
				MemberDto memberDto = sqlSession.selectOne("member.one", memberId);
				if(memberDto == null) {
					return null;
				}
				
				boolean isPasswordMatch = memberDto.getMemberPw().equals(memberPw);
				if(isPasswordMatch) {
					return memberDto;
				}
				else {
					return null;
				}
				
			
		}

		@Override
		public MemberDto info(String memberId) {
			return sqlSession.selectOne("member.one", memberId); 
		}

		@Override
		public boolean changePassword(String memberId, String currentPw, String changePw) {
			MemberDto memberDto =  this.login(memberId,  currentPw);
			if(memberDto ==null) {
				return false;
			}
			 
			int count = sqlSession.update("member.changePassword", 
					MemberDto.builder().memberId(memberId).memberPw(changePw).build());
			
			return count > 0; 
					
		}
	}
	
	

