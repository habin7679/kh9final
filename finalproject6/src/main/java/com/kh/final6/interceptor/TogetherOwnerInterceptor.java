package com.kh.final6.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;

import com.kh.final6.entity.TogetherDto;
import com.kh.final6.repository.TogetherDao;

@Component
public class TogetherOwnerInterceptor implements HandlerInterceptor{
	
	@Autowired
	private TogetherDao togetherDao;
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		String memberKind = (String)request.getSession().getAttribute("auth");
		Integer memberNo = (Integer)request.getSession().getAttribute("no");
		int togetherNo = Integer.parseInt(request.getParameter("togetherNo"));
		
		TogetherDto togetherDto = togetherDao.one(togetherNo);
		
		if(memberNo == null || memberKind == null || !memberKind.equals("관리자")) {
			response.sendRedirect(request.getContextPath()+"/qna/error");
			return false;
		}
		else if(memberNo == togetherDto.getMemberNo()|| memberKind.equals("관리자")) {
			return true;
		}
		else {
			return true;
		}
	}
}
