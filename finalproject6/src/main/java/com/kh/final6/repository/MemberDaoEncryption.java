package com.kh.final6.repository;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Repository;

import com.kh.final6.entity.MemberDto;

@Repository
public class MemberDaoEncryption implements MemberDao{
	
	@Autowired
	private SqlSession sqlSession;
	
	@Autowired
	private PasswordEncoder passwordEncoder;

	@Override
	public void join(MemberDto memberDto) {
		
		//시퀀스 생성 
		int memberNo = sqlSession.selectOne("member.sequence");
		memberDto.setMemberNo(memberNo);	
		
		//비밀번호를 암호화하여 재설정한 뒤 등록
		String rawPassword = memberDto.getMemberPw();
		String encryptPassword = passwordEncoder.encode(rawPassword);
		memberDto.setMemberPw(encryptPassword);
		
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
	public MemberDto oneNo(int memberNo) {
		return sqlSession.selectOne("member.oneNo", memberNo);
	}

	@Override
	public boolean changePassword(String memberId, String currentPw, String changePw) {
		MemberDto memberDto = this.login(memberId, currentPw);//현재 정보로 검사
		if(memberDto == null) {
			return false;
		}
		
		//비밀번호 암호화 코드를 추가
		String encodePassword = passwordEncoder.encode(changePw);
		
		int count = sqlSession.update("member.changePassword", 
				MemberDto.builder().memberId(memberId).memberPw(encodePassword).build());
		
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




