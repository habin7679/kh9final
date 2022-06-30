package com.kh.final6.notice;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;

import com.kh.final6.entity.NoticeDto;


@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {
		"file:src/main/webapp/WEB-INF/spring/root-context.xml",
		"file:src/main/webapp/WEB-INF/spring/appServlet/servlet-context.xml"
})
@WebAppConfiguration
public class NoticeComplexSearchTest {

	@Autowired
	private SqlSession sqlSession;
	
	
	@Test
		public void complex02() {
			Map<String, Object> param = new HashMap<>();
			param.put("type", "notice_title");
			param.put("keyword", "공지");
			param.put("begin", "1");
			param.put("end", "5");
			param.put("column","notice_readcount");
			param.put("order", "desc");
			
			List<NoticeDto> list = sqlSession.selectList("notice.list",param);
			for(NoticeDto noticeDto : list) {
				System.out.println(noticeDto);
			}
		}
}
