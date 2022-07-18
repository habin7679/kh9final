package com.kh.final6.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;
@Component
public class SellerInterceptor implements HandlerInterceptor{

	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		String memberKind = (String)request.getSession().getAttribute("auth");
		
		
		if(memberKind.equals("판매자")) {
			response.sendRedirect(request.getContextPath()+"/together/sellerError");
			return false;
		}
		else {
			return true;
		}
	}
}
