package com.kh.final6.interceptor;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import com.kh.final6.entity.QnaDto;
import com.kh.final6.repository.QnaDao;
@Component
public class QnaOwnerInterceptor implements HandlerInterceptor{
	
	@Autowired
	private QnaDao qnaDao;
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		String memberKind = (String)request.getSession().getAttribute("auth");
		int memberNo = (Integer)request.getSession().getAttribute("no");
		int qnaNo = Integer.parseInt(request.getParameter("qnaNo"));
		
		QnaDto qnaDto = qnaDao.one(qnaNo);
		List<Integer> list = qnaDao.reList(memberNo);
		
		if(memberKind.equals("관리자")|| memberNo == qnaDto.getMemberNo() || list.contains(qnaDto.getGroupNo())) {
			return true;
		}
		else {
			response.sendRedirect(request.getContextPath()+"/qna/error");
			return false;
		}
	}
}
