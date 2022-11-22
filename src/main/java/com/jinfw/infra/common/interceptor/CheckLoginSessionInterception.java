package com.jinfw.infra.common.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.jinfw.infra.common.constans.Constants;
import com.jinfw.infra.common.utill.UtilClient;

public class CheckLoginSessionInterception extends HandlerInterceptorAdapter {
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {

		System.out.println("CheckLoginSessionInterception is running!");
		System.out.println("Client Ip : " + UtilClient.getClientIp(request));
		System.out.println("Client Device : " + UtilClient.getClientDevice(request));
		System.out.println("Client RequestURI : " + request.getRequestURI());
		
		if (request.getSession().getAttribute("sessSeq") != null) {
			// by pass
			System.out.println("Member Name : " + request.getSession().getAttribute("sessName").toString());
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
