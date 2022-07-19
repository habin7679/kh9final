package com.kh.final6.repository;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.kh.final6.entity.QnaDto;

@Repository
public class QnaDaoImpl implements QnaDao{

	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public List<QnaDto> selectList(String type, String keyword, int p, int s, String column, String order) {
		Map<String,Object> param = new HashMap<>();
		param.put("type", type);
		param.put("keyword", keyword);
		param.put("p", p);
		param.put("s", s);
		param.put("column", column);
		param.put("order", order);
		
		int end = p * s;
		int begin = end - (s-1);
		param.put("begin", begin);
		param.put("end", end);
		
		return sqlSession.selectList("qna.list",param);
	}

	@Override
	public int count(String type, String keyword) {
		Map<String,Object> param = new HashMap<>();
		param.put("type", type);
		param.put("keyword", keyword);
		
		return sqlSession.selectOne("qna.count",param);
	}

	@Override
	public QnaDto one(int qnaNo) {
		sqlSession.update("qna.readcount",qnaNo);
		return sqlSession.selectOne("qna.one",qnaNo);
	}

	@Override
	public int write(QnaDto qnaDto) {
		int qnaNo = sqlSession.selectOne("qna.sequence");
		qnaDto.setQnaNo(qnaNo);
		
		if(qnaDto.getSuperNo() == 0) {
			qnaDto.setGroupNo(qnaNo);
		}
		else {
			QnaDto originDto = sqlSession.selectOne("qna.one",qnaDto.getSuperNo());
			qnaDto.setGroupNo(originDto.getGroupNo());
			qnaDto.setDepth(originDto.getDepth()+1);
		}
		sqlSession.insert("qna.insert",qnaDto);
		return qnaNo;
	}
	
	@Override
	public boolean update(QnaDto qnaDto) {
		int count = sqlSession.update("qna.update",qnaDto);
		return count > 0;
		
	}
	
	@Override
	public boolean delete(int qnaNo) {
		int count = sqlSession.delete("qna.delete",qnaNo);
		return count > 0;
	}
	
	@Override
	public List<Integer> reList(int memberNo) {
		return sqlSession.selectList("qna.reOne",memberNo);
	}

}
