package com.kh.final6.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.HandlerInterceptor;

	public class NonMemberInterceptor implements HandlerInterceptor{
		
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
				throws Exception{
	
		String memberId = (String) request.getSession().getAttribute("login");
		if(memberId != null) {
			response.sendRedirect(request.getContextPath());
			return false;
		}
		else {
			return true; 
		}
	}
}
