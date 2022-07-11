package com.kh.final6.repository;

import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class SellerProfileDaoImpl implements SellerProfileDao {

	@Autowired 
	private SqlSession sqlSession; 
	
	@Autowired
	private AttachmentDao attachmentDao;
	
	@Autowired
	private SellerDao sellerDao;
	
	@Autowired
	private SellerProfileDao sellerProfileDao;
	
	@Override
	public void insert(int sellerNo, int attachmentNo) {
		Map<String, Object> param = new HashMap<>();
		param.put("sellerNo", sellerNo);
		param.put("attachmentNo", attachmentNo);
		sqlSession.insert("sellerAttachment.insert", param);
	}
}
