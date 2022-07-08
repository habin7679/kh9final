package com.kh.final6.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;
@Component
public class AdminInterceptor implements HandlerInterceptor{
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		String memberKind = (String)request.getSession().getAttribute("auth");
		if(!memberKind.equals("관리자") || memberKind == null) {
			response.sendRedirect(request.getContextPath()+"/notice/error");
			return false;
		}
		else {
			return true;
		}
		}
}
