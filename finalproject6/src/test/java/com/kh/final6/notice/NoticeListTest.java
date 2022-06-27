package com.kh.final6.notice;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;

import com.kh.final6.entity.NoticeDto;
import com.kh.final6.repository.NoticeDao;

import lombok.extern.slf4j.Slf4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {
		"file:src/main/webapp/WEB-INF/spring/root-context.xml",
		"file:src/main/webapp/WEB-INF/spring/appServlet/servlet-context.xml"
})
@WebAppConfiguration
@Slf4j
public class NoticeListTest {
	
	@Autowired
	private NoticeDao noticeDao;
	
	@Test
	public void test() {
		List<NoticeDto> list = noticeDao.selectList();
		for(NoticeDto noticeDto : list) {
			log.info("list ={}",noticeDto);
		}
	}
}
