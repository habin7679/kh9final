package com.kh.final6.repository;


import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.kh.final6.entity.MemberDto;
import com.kh.final6.entity.MsgDto;
import com.kh.final6.vo.RecvMsgVO;
import com.kh.final6.vo.SendMsgVO;

@Repository
public class MsgDaoImpl implements MsgDao{
	
	@Autowired
	private SqlSession sqlSession;

	@Override
	@Transactional
	public void msg(MsgDto msgDto) {
		int msgNo = sqlSession.selectOne("msg.sequence");
		msgDto.setMsgNo(msgNo);
		sqlSession.insert("msg.msg",msgDto);
		sqlSession.insert("msg.send",msgDto);
		sqlSession.insert("msg.recv",msgDto);
	}
	@Override
	public List<SendMsgVO> sendBox(String type, String keyword, int p, int s, int memberNo){
		Map<String,Object> param = new HashMap<>();
		param.put("type",type);
		param.put("keyword", keyword);
		param.put("memberNo", memberNo);
		
		int end = p *s;
		int begin = end - (s-1);

		param.put("begin", begin);
		param.put("end", end);
		return sqlSession.selectList("msg.sendBox",param);

	}
	
	@Override
	public int count(String type, String keyword,int memberNo) {
		Map<String,Object> param = new HashMap<>();
 		param.put("type", type);
 		param.put("keyword", keyword);
 		param.put("memberNo", memberNo);
 		
 		return sqlSession.selectOne("msg.count",param);
		
	}
	@Override
	public boolean delete(int msgNo) {
		int count = sqlSession.delete("msg.delete",msgNo);
		return count>0;
	}
	@Override
	public List<RecvMsgVO> recvBox(String type, String keyword, int p, int s, int memberNo) {
		Map<String,Object> param = new HashMap<>();
		param.put("type",type);
		param.put("keyword", keyword);
		param.put("memberNo", memberNo);
		
		int end = p *s;
		int begin = end - (s-1);

		param.put("begin", begin);
		param.put("end", end);
		return sqlSession.selectList("msg.recvBox",param);
	}
	@Override
	public int count1(String type, String keyword, int memberNo) {
		Map<String,Object> param = new HashMap<>();
 		param.put("type", type);
 		param.put("keyword", keyword);
 		param.put("memberNo", memberNo);
 		
 		return sqlSession.selectOne("msg.count1",param);
	}
	@Override
	public boolean delete1(int msgNo) {
		int count = sqlSession.delete("msg.delete1",msgNo);
		return count>0;
	}
}
