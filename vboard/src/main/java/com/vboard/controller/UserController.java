package com.vboard.controller;

import java.util.HashMap;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.swing.JOptionPane;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.vboard.common.mail.MailAuthKeyGenerator;
import com.vboard.common.mail.MailHandler;
import com.vboard.service.UserService;
import com.vboard.vo.UserVO;

@Controller
public class UserController {

	@Inject
	private JavaMailSender mailSender;

	@Autowired
	private UserService userService;

	// 회원가입 페이지로 이동
	@RequestMapping("/signUpForm")
	public String responseMoveSignUpForm() {
		// signUpForm.jsp로 이동
		return "signUpForm";
	}

	// 로그인 페이지로 이동
	@RequestMapping("/loginForm")
	public String responseMoveLoginForm() {
		// loginForm.jsp로 이동
		return "loginForm";
	}

	// 아이디 중복 확인 요청
	// paramId에 담기는 파라미터 id
	@RequestMapping(value = "signUpForm/idDupCheck", produces = "application/text; charset=utf8")
	public @ResponseBody String responseIdDupCheck(@RequestParam String paramId) throws Exception {
		int result = -1;
		String checkedId = "";
		// 검색 후, 0이면 사용가능, 1이면 중복, -1이면 메서드 작동X, -2이면 SQL 작동X
		result = userService.idDupCheck(paramId);
		if (result == 0) {
			checkedId = paramId;
		} else if (result == 1) {
			checkedId = "";
		} else {
			checkedId = "";
		}
		return checkedId;
	}

	// 이메일 인증 요청
	// paramEmail에 담기는 파라미터 email
	// ################# 이메일 발송 딜레이 고려하여 회원가입 버튼 누를 수 있게 하기 #################
	@RequestMapping("signUpForm/emailCertify")
	public @ResponseBody String responseEmailCertify(@RequestParam String paramEmail) throws Exception {
		System.out.println("인증메일 전송 주소: " + paramEmail);

		// 인증 키 생성
		String random_24_string = new MailAuthKeyGenerator().excuteGenerate();
		System.out.println("active_key 값: " + random_24_string);

		// 인증 키 유저에게 메일 보내기(get)
		MailHandler sendMail = new MailHandler(mailSender);
		sendMail.setSubject("[ CarHistory 회원가입 이메일 인증 메일입니다 ]");
		sendMail.setText(new StringBuffer().append("<h1>이메일 링크를 클릭 하시면 인증이됩니다</h1>").append("<h1><a href='http://localhost:8080/vboard/emailActivate?u_email=")
				.append(paramEmail).append("&u_email_active_key=").append(random_24_string).append("' target='_blank'>이메일 인증 링크입니다</a></h1>").toString());
		sendMail.setFrom("ynotder@gmail.com", "CarHistory 운영자");
		sendMail.setTo(paramEmail);
		sendMail.send();

		return random_24_string;
	}

	// 회원가입 요청
	// params에 담기는 파라미터: id, password, name, sex, birthday, email,
	// auth_key(hidden), phone
	@RequestMapping("signUpForm/signUp")
	public String responseSignUp(@RequestParam HashMap<String, Object> params) throws Exception {
		System.out.println("signUp");
		userService.signUp(params);

		JOptionPane.showMessageDialog(null, "<html>회원 가입을 축하합니다 <br> 이메일 인증 후 로그인 가능합니다.</html>");
		// "프로젝트명/signUpform/" 경로에 있기 때문에 "/"으로 상위 경로로 나간 후, index로 리다이렉트
		return "redirect:/index";

	}

	// 이메일 활성화 요청
	// params에 담기는 파라미터: email, active_key
	// 이메일 인증 후, active_key 값 "0"으로 수정
	@RequestMapping("emailActivate")
	public String responseEmailActivate(@RequestParam HashMap<String, Object> params) throws Exception {
		int result = -1;
		// update 시 수정한 개수를 결과로 리턴, 0인 경우 인증실패, 1인 경우 인증성공, -1인 경우 메서드 작동x
		result = userService.activateEmail(params);
		if (result == 1) {
			JOptionPane.showMessageDialog(null, "아이디 이용이 가능합니다");
		} else {
			JOptionPane.showMessageDialog(null, "이메일 인증 키가 소멸되었습니다");
		}
		return "redirect:index";
	}

	// 로그인 요청
	// params에 담기는 파라미터: u_id, u_pwd
	@RequestMapping(value = "loginForm/login", produces = "application/text; charset=utf8")
	public @ResponseBody String jsonLogin(@RequestParam HashMap<String, Object> params, HttpSession session, HttpServletRequest request) throws Exception {
		String result = "X";
		if (session.getAttribute("login_session") != null) {
			// 로그인 요청시, login_info 세션 값이 존재하면 삭제
			session.removeAttribute("login_session");
		}
		// 로그인 시도
		UserVO login_info = userService.login(params);
		// 로그인 성공시
		if (login_info != null) {
			// 로그인된 아이디가 활성화 상태인 경우(u_active_state = 1)
			if (login_info.getU_active_state() == 1) {
				// 1. 최근 로그인 시간 업데이트
				userService.loginLatestTimeUpdate(params);
				// 2. 세션 "login_session"에 조회된 유저 정보 저장
				session.setAttribute("login_session", login_info);
				// 로그인된 아이디 문자열값 반환
				result = login_info.getU_id();
			} else {
				result = "이메일 비활성화";
			}
		}
		// 로그인 유저 아이피 가져오기

		System.out.println("Session Valid Time: " + (session.getMaxInactiveInterval()+" seconds" ));
		// "X", "아이디", "이메일 비활성화" 3가지 경우의 수 반환
		return result;
	}

	// 로그아웃 요청
	@RequestMapping("logOut")
	public String responseLogOut(HttpSession session) {
		// 전체 세션 삭제
		session.invalidate();
		// 특정 세션 삭제
		// ex) session.removeAttribute("login_session");
		return "redirect:index";
	}
	


// 회원 탈퇴 get
	@RequestMapping(value="/delUserForm", method = RequestMethod.GET)
		public String memberDeleteView() throws Exception{
			return "delUserForm";
		}

// 회원 탈퇴 post
	@RequestMapping(value="/delUser", method = RequestMethod.POST)
		public String memberDelete(UserVO vo, HttpSession session, RedirectAttributes rttr) throws Exception{
		System.out.println("del");
		// 세션에 있는 member를 가져와 member변수에 넣어줍니다.
		UserVO member = (UserVO) session.getAttribute("login_session");
		// 세션에있는 비밀번호

		String sessionPw = member.getU_pwd();
		// vo로 들어오는 비밀번호
		
		String voPw = vo.getU_pwd();
	
		if(!(sessionPw.equals(voPw))) {
			rttr.addFlashAttribute("msg", false);
			return "redirect:delUserForm";
		}
		userService.delUser(vo);
		session.invalidate();
		return "redirect:index";
	}
}
