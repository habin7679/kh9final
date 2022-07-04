package com.kh.final6.repository;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class RegularPaymentDaoImpl implements RegularPaymentDao {

	@Autowired
	private SqlSession sqlSession;
	
}
