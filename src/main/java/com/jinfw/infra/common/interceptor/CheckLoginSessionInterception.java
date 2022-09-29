package com.jinfw.infra.common.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.jinfw.infra.common.constans.Constants;

public class CheckLoginSessionInterception extends HandlerInterceptorAdapter {
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {

		System.out.println("CheckLoginSessionInterception is running!");
		
		if (request.getSession().getAttribute("sessSeq") != null) {
			// by pass
		} else {
			
			if (request.getRequestURI().contains("main") || request.getRequestURI().contains("user")) {
				response.sendRedirect(Constants.URL_LOGINFORM_FOR_USER);
			} else {
				response.sendRedirect(Constants.URL_LOGINFORM_FOR_ADMIN);
			}
			
            return false;
		}
		
		
		return super.preHandle(request, response, handler);
	}

	
	
}
