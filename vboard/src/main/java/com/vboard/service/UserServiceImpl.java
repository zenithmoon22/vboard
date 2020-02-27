package com.vboard.service;

import java.sql.Timestamp;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.vboard.dao.UserDao;
import com.vboard.vo.UserVO;

// 단순한 서비스를 위한 클래스
@Service("UserService")
public class UserServiceImpl implements UserService {
	@Autowired
	private UserDao userDao;
	
	@Override
	public int idDupCheck(String checkId) throws Exception {
		int check = -2;
		check = userDao.idDupCheck(checkId);
		return check;
	}
	
	@Override
	public void signUp(HashMap<String, Object> params) throws Exception {
		userDao.signUp(params);
	}
	
	@Override
	public int activateEmail(HashMap<String, Object> params) throws Exception {
		return userDao.activateEmail(params);
	}
	
	@Override
	public UserVO login(HashMap<String, Object> params) throws Exception {
		return userDao.login(params);
	}
	
	@Override
	public void loginLatestTimeUpdate(HashMap<String, Object> params) throws Exception {
		userDao.loginLatestTimeUpdate(params);
	}
	
	@Override
	public void updateRecommendActiveTime(String u_id) throws Exception {
		userDao.updateRecommendActiveTime(u_id);
	}
	
	@Override
	public Timestamp checkRecommendActiveTime(String u_id) throws Exception {
		return userDao.checkRecommendActiveTime(u_id);
	}
	
	@Override
	public void delUser(UserVO vo) throws Exception{
		userDao.delUser(vo);
	}
}
