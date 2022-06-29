package com.kh.final6.notice;

import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;

import com.kh.final6.entity.NoticeDto;
import com.kh.final6.repository.NoticeDao;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {
		"file:src/main/webapp/WEB-INF/spring/root-context.xml",
		"file:src/main/webapp/WEB-INF/spring/appServlet/servlet-context.xml"
})
@WebAppConfiguration
public class NoticeWriteTest {

	
	@Autowired
	private NoticeDao noticeDao;
	
	private NoticeDto noticeDto;
	
	
	@Before
	public void data() {
		int noticeNo = noticeDao.getSequence();
		
		noticeDto = new NoticeDto();
		noticeDto.setNoticeNo(noticeNo);
		noticeDto.setMemberNo(0);
		noticeDto.setNoticeHead("이벤트");
		noticeDto.setNoticeTitle("첫번째 이벤트 입니다");
		noticeDto.setNoticeContent("이벤트 테스트");
		noticeDto.setNoticeWriter("닉네임");
	}
	
	@Test
	public void test() {
		noticeDao.insert(noticeDto);
	}
}
