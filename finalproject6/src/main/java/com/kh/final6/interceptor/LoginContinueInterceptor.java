package com.kh.final6.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.HandlerInterceptor;

public class LoginContinueInterceptor implements HandlerInterceptor {

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {


		//개발시 로그인계속 유지 하는 인터셉터입니다.!
		// 오류나면 주석처리 해주세요
//
//		request.getSession().setAttribute("no", 0);
//		request.getSession().setAttribute("login", "testuser@email.com");
//		request.getSession().setAttribute("auth", "관리자");

		
		return true;
	}
}
