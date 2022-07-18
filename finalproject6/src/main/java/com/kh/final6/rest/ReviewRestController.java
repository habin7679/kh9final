package com.kh.final6.rest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.kh.final6.entity.AttachmentDto;
import com.kh.final6.repository.AttachmentDao;

@RestController
@RequestMapping("/rest/reviewAttach")
public class ReviewRestController {
	@Autowired
	private AttachmentDao attachmentDao;
	
	@DeleteMapping("/{attachmentNo}")
	public void delete(@PathVariable int attachmentNo) {
		attachmentDao.delete(attachmentNo);
	}
	
	@GetMapping("/{attachmentNo}")
	public AttachmentDto one(@PathVariable int attachmentNo) {
		return attachmentDao.info(attachmentNo);
	}
	
	

}
