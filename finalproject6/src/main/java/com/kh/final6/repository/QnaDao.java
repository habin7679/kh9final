package com.kh.final6.repository;

import java.util.List;

import com.kh.final6.entity.QnaDto;

public interface QnaDao {

	List<QnaDto> selectList(String type, String keyword, int p, int s,String column, String order);
	int count(String type, String keyword);

	QnaDto one(int qnaNo);
	
	int write(QnaDto qnaDto);
	
	boolean update(QnaDto qnaDto);
	
	boolean delete(int qnaNo);

}
