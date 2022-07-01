package com.kh.final6.repository;

import java.util.List;

import com.kh.final6.entity.TogetherDto;

public interface TogetherDao {

	List<TogetherDto> selectList(String type, String keyword, int p, int s, String column, String order);
	int count(String type, String keyword);
	
	TogetherDto one(int togetherNo);
	
	int write(TogetherDto togetherDto);
	
	boolean delete(int togetherNo);
	
	boolean update(TogetherDto togetherDto);

}
