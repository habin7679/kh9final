package com.kh.final6.repository;


import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import com.kh.final6.entity.MemberDto;

	//@Repository // 암호화 페이지꺼 사용  
	public class MemberDaoImpl implements MemberDao {

		@	Autowired
		private SqlSession sqlSession; 
		
		@Override
		public void join(MemberDto memberDto) {

			int memberNo = sqlSession.selectOne("member.sequence");

			memberDto.setMemberNo(memberNo);	
			sqlSession.insert("member.join", memberDto);
			}

		
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

		@Override
		public boolean exit(String memberId, String memberPw) {
			MemberDto memberDto = this.login(memberId, memberPw);
			if(memberDto == null) {
			return false;
			}
			else { 
				int count = sqlSession.delete("member.exit", memberId);
				return count > 0;
			}
			
		}

		@Override
		public boolean changeInformation(MemberDto memberDto) {
			MemberDto findDto = this.login(memberDto.getMemberId(), memberDto.getMemberPw());
			if(findDto == null) {
				return false;
			}
			else {
			int count = sqlSession.update("member.changeInformation", memberDto); 
			return count > 0; 
			}
			
		}

			@Override
			public String findId(MemberDto memberDto) {
				return sqlSession.selectOne("member.findId", memberDto);
			}

		
	}
	
	

