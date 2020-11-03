package com.edu.mvc.common;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class Interceptor extends HandlerInterceptorAdapter{

	private Logger logger = LoggerFactory.getLogger(Interceptor.class);
	//컨트롤러에 들어가기 전 실행됨.
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		System.out.println("=======================================================================================");
		logger.info("[interceptor] : preHandle");
		response.setHeader("Cache-Control","no-store");  
		response.setHeader("Pragma","no-cache");  
		response.setDateHeader("Expires",0);  
		
		
		
		//로그인페이지, 회원가입페이지, index페이지
		 if (request.getRequestURI().contains("/register.do") ||  request.getRequestURI().contains("/login.do") || 
		  request.getSession().getAttribute("logindto") != null || request.getRequestURI().contains("/regchk.do") ||
		 request.getRequestURI().contains("/ajaxRegister.do") || request.getRequestURI().contains("/ajaxLogin.do") ||
		 (request.getRequestURI().contains("/logind.do")  )||  request.getRequestURI().contains("/memberidchk.do") ||
		 request.getRequestURI().contains("/idfind.do") || request.getRequestURI().contains("/memberpwchk.do") ||
		 request.getRequestURI().contains("/pwchange.do") || request.getRequestURI().contains("/ajaxemailchk.do")){
			 return true; 
		 }else {
			 if(request.getSession().getAttribute("logindto") == null) {
				 response.sendRedirect("login.do");
					return false;
			 }
			 return false; 
		 }
		
	}

	// view 에서 forward 되기전에 수행
	// 컨트롤러에서 에러 발생시 해당 메소드는 수행 되지 않는다.
	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		logger.info("[interceptor] : postHandle");
		
		System.out.println("---------------------------------------------------------------------------------------");
	}

	// view 까지 처리가 끝난후에 처리됨
	@Override
	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex)
			throws Exception {
		logger.info("[interceptor] : afterComletion");
		
		System.out.println("=======================================================================================");
		
	}

	
	
}
