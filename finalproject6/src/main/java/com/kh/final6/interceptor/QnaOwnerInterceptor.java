package com.kh.final6.interceptor;

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
		int memberNo = (int)request.getSession().getAttribute("no");
		
		if(memberKind == null || !memberKind.equals("관리자")) {
			response.sendRedirect(request.getContextPath()+"/qna/error");
			return false;
		}
		else if(memberKind.equals("관리자")) {
			return true;
		}
		else {
			return true;
		}
	}
}
