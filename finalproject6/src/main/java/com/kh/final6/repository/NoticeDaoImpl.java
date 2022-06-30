package com.kh.final6.repository;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.final6.entity.NoticeDto;

@Repository
public class NoticeDaoImpl implements NoticeDao{

	@Autowired
	private SqlSession sqlSession;
	
	//목록 조회
	@Override
	public List<NoticeDto> list(String type,String keyword, int p, int s) {
		Map<String,Object> param = new HashMap<>();
		param.put("type", type);
		param.put("keyword", keyword);
		
		int end = p * s;
		int begin = end - (s-1);
		
		param.put("begin", begin);
		param.put("end", end);
		return sqlSession.selectList("notice.list",param);
	}
	//게시글 수 조회
	@Override
	public int count(String type, String keyword) {
 		Map<String,Object> param = new HashMap<>();
 		param.put("type", type);
 		param.put("keyword", keyword);
 		
 		return sqlSession.selectOne("notice.count",param);
	}
	//게시글 상세조회
	@Override
	public NoticeDto one(int noticeNo) {
		sqlSession.update("notice.readcount",noticeNo);
		return sqlSession.selectOne("notice.one",noticeNo);
	}
	//게시글 번호(시퀀스) 조회
	@Override
	public int getSequence() {
		return sqlSession.selectOne("notice.sequence");
	}
	//게시글 작성
	@Override
	public int insert(NoticeDto noticeDto) {
		int noticeNo = sqlSession.selectOne("notice.sequence");
		noticeDto.setNoticeNo(noticeNo);
		
		sqlSession.insert("notice.write",noticeDto);
		return noticeNo;
	}
	//게시글 삭제
	@Override
	public boolean delete(int noticeNo) {
		int count = sqlSession.delete("notice.delete",noticeNo);
		return count > 0;
	}
	//게시글 수정
	@Override
	public boolean update(NoticeDto noticeDto) {
		int count = sqlSession.update("notice.edit",noticeDto);
		return count > 0;
	}


}
