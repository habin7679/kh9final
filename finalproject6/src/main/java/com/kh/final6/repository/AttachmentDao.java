package com.kh.final6.repository;

import java.io.IOException;
import java.util.List;

import org.springframework.core.io.ByteArrayResource;
import org.springframework.web.multipart.MultipartFile;

import com.kh.final6.entity.AttachmentDto;

public interface AttachmentDao {

	int save (MultipartFile storeImg) throws IllegalStateException, IOException;
	//int savelist(List<MultipartFile> storeImg) throws IllegalStateException, IOException;
	AttachmentDto info(int attachmentNo);
	ByteArrayResource load(String attachmentSavename) throws IOException;
	String name(int attachmentNo);
	void delete(int attachmentNo);
}
