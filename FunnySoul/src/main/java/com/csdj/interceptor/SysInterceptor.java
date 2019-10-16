package com.csdj.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

/**
 * 拦截器
 * @author LinKai
 *
 */
public class SysInterceptor extends HandlerInterceptorAdapter{
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		HttpSession session = request.getSession();
		if (false) {
			//
			response.sendRedirect(request.getContextPath()+"/jsp/401.jsp");
			//拦截
			return false;
		}else {
			//不拦截
			return true;
		}
	}

}
