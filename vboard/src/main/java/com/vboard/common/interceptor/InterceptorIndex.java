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
			// 로그인이 되어 있지 않은 상태, 즉 login_session 값이 null인 경우
			// /board/... 에서 인터셉트 하기 때문에 "../" 상위 경로로 나간 후 login폼으로 이동
			JOptionPane.showMessageDialog(null, "로그인이 필요합니다.\n 로그인 페이지로 이동합니다.");
			response.sendRedirect("/vboard/loginForm");
			// 더 이상 컨트롤러 요청으로 가지 않도록 false 반환
			// 로그인이 안된 상태에서 게시판 기능 요청으로 보내지 않기 위함
			return false;
		}

		// preHandle()의 return은 컨트롤러 요청이 URI로 가도 되냐 안되냐를 허가하는 의미
		// 따라서 true인 경우 컨트롤러 URI로 가게 된다
		return true;
	}

	// postHandle(): 컨트롤러가 수행되고 화면이 보여지기 직전에 수행되는 메서드
	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modelAndView)
			throws Exception {
		super.postHandle(request, response, handler, modelAndView);
	}

}