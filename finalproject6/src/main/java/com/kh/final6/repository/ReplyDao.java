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
}
