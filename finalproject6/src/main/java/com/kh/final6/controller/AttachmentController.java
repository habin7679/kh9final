package com.kh.final6.controller;

import java.io.IOException;
import java.nio.charset.StandardCharsets;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.ByteArrayResource;
import org.springframework.http.ContentDisposition;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.kh.final6.entity.AttachmentDto;
import com.kh.final6.error.CannotFindException;
import com.kh.final6.repository.AttachmentDao;

@RestController
@RequestMapping("/attachment")
public class AttachmentController {

	@Autowired
	private AttachmentDao attachmentDao;
	
	@GetMapping("/download")
	public ResponseEntity<ByteArrayResource> download(
					@RequestParam int attachmentNo) throws IOException{
		AttachmentDto attachmentDto = attachmentDao.info(attachmentNo);
		if(attachmentDto == null) {
			throw new CannotFindException();
		}
		
		ByteArrayResource resource = attachmentDao.load(attachmentDto.getAttachmentSavename());
		
		return ResponseEntity.ok()
						.contentType(MediaType.APPLICATION_OCTET_STREAM)
						.contentLength(attachmentDto.getAttachmentSize())
						.header(HttpHeaders.CONTENT_ENCODING, StandardCharsets.UTF_8.name())
						.header(HttpHeaders.CONTENT_DISPOSITION, 
								ContentDisposition.attachment()
							.filename(attachmentDto.getAttachmentUploadname(),StandardCharsets.UTF_8)
							.build()
							.toString()
				)
			.body(resource);
	}
}
