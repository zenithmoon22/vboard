package com.vboard.common.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.swing.JOptionPane;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

// http://rongscodinghistory.tistory.com/2?category=693395 참조
// 인터셉터란?
// 특정 URI로 요청시 컨트롤러로 가는 요청을 가로채는 역할을 한다
// 로그인 처리를 담당하는 인터셉터 클래스
// servlet-context.xml에 인터셉터 설정 정보 등록이 필요하다
public class InterceptorIndex extends HandlerInterceptorAdapter {

	// preHandle(): 컨트롤러보다 먼저 수행되는 메서드
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
		// session 객체를 가져온다
		HttpSession session = request.getSession();
		Object obj = session.getAttribute("login_session");
		System.out.println("prehandle = "+obj);
		if (obj == null) {
			JOptionPane.showMessageDialog(null, "로그인 후 게시판 이용 가능합니다.\n 로그인 페이지로 이동합니다.");
			response.sendRedirect("/vboard/loginForm");
			// 더 이상 컨트롤러 요청으로 가지 않도록 false 반환
			return false;
		}

		return true;
	}

	// postHandle(): 컨트롤러가 수행되고 화면이 보여지기 직전에 수행되는 메서드
	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modelAndView)
			throws Exception {
		super.postHandle(request, response, handler, modelAndView);
	}

}