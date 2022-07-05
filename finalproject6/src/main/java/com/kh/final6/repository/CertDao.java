package com.kh.final6.repository;

import com.kh.final6.entity.CertDto;

public interface CertDao {
	void insert(CertDto certDto);
	boolean check(CertDto certDto);
	void clear();
}