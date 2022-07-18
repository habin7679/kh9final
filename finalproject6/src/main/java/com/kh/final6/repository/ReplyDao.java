package com.kh.final6.repository;

import java.util.List;

import com.kh.final6.entity.ReplyDto;

public interface ReplyDao {

	ReplyDto insert(ReplyDto replyDto);

	List<ReplyDto> list(int replyTarget);

	void delete(int replyNo);

	void updateReplyCount(int replyTarget);

	ReplyDto edit(ReplyDto replyDto);

	int replyCount(int replyTarget);

	List<ReplyDto> ownerList(int p, int s, String type, String keyword, int memberNo);
	
	int count(String type, String keyword,int memberNo);

	int rdelelte(int replyNo);

	
}
