package com.kh.final6.repository;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.final6.entity.StoreAttachDto;

@Repository
public class StoreAttachDaoImpl implements StoreAttachDao{
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public void insert(int storeNo, int attachmentNo) {
		Map<String,Object> param = new HashMap<>();
		param.put("storeNo", storeNo);
		param.put("attachmentNo", attachmentNo);
		
		sqlSession.insert("storeAttach.insert",param);
	}

	@Override
	public List<StoreAttachDto> infolist(int storeNo) {
	//	Integer attachmentNo = sqlSession.selectOne("storeAttach.one",storeNo);
		List<StoreAttachDto> attachmentNoList = sqlSession.selectList("storeAttach.one",storeNo);
	
		System.out.println(">> " + attachmentNoList);
		 
		if(attachmentNoList.size() < 0) {
			return null;
		}
		else {
			return attachmentNoList;
		}
		 
	}
	   @Override
	   public int info(int storeNo) {
	      Integer attachmentNo = sqlSession.selectOne("storeAttach.oneNo",storeNo);
	      if(attachmentNo == null) {
	         return 0;
	      }
	      else {
	         return attachmentNo;
	      }
	      
	   }

}
