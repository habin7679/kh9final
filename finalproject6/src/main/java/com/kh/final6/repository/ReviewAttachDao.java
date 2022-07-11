package com.kh.final6.repository;

public interface ReviewAttachDao {
 void insert(int reviewNo, int attachmentNo);
 int info(int reviewNo);
 
}
