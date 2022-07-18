package com.kh.final6.repository;

import java.util.List;

import com.kh.final6.entity.MemberDto;
import com.kh.final6.entity.MsgDto;
import com.kh.final6.entity.SendDto;
import com.kh.final6.vo.RecvMsgVO;
import com.kh.final6.vo.SendMsgVO;

public interface MsgDao {

	void msg(MsgDto msgDto);

	List<SendMsgVO> sendBox(String type, String keyword, int p, int s, int memberNo);
	int count(String type, String keyword,int memberNo);

	boolean delete(int msgNo);

	List<RecvMsgVO> recvBox(String type, String keyword, int p, int s, int memberNo);

	int count1(String type, String keyword, int memberNo);

	boolean delete1(int msgNo);




	
}
