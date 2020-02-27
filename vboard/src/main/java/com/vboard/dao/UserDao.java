package com.vboard.dao;

import java.sql.Timestamp;
import java.util.HashMap;

import com.vboard.vo.UserVO;

public interface UserDao {

	// 아이디 중복 확인을 위한 메서드
	public int idDupCheck(String checkId) throws Exception;

	// 회원 가입을 위한 메서드
	public void signUp(HashMap<String, Object> params) throws Exception;

	// 회원 메일에서 아이디 활성화 요청을 위한 메서드
	public int activateEmail(HashMap<String, Object> params) throws Exception;

	// 회원 로그인을 위한 메서드
	public UserVO login(HashMap<String, Object> params) throws Exception;

	// 로그인시 최근 로그인 시간 업데이트
	public void loginLatestTimeUpdate(HashMap<String, Object> params) throws Exception;

	// 추천 후, 추천 활성화 시간 업데이트
	public void updateRecommendActiveTime(String u_id) throws Exception;
	
	// 추천 활성화 시간 조회
	public Timestamp checkRecommendActiveTime(String u_id) throws Exception;
	
	// 회원 탈퇴
	public void delUser(UserVO vo) throws Exception;

}
