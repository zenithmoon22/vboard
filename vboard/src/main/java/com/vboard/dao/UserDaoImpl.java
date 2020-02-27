package com.vboard.dao;

import java.sql.Timestamp;
import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.vboard.vo.UserVO;

// Data Access Object로 DB에 직접 접근하는 처리를 담당하는 클래스
@Repository("UserDao")
public class UserDaoImpl implements UserDao {

	@Autowired
	private SqlSessionTemplate sqlSession;

	final static String NAMESPACE_USER = "com.vboard.mapper.user_mapper";

	@Override
	public int idDupCheck(String checkId) throws Exception {
		return sqlSession.selectOne(NAMESPACE_USER + ".idDupCheck", checkId);
	}

	@Override
	public void signUp(HashMap<String, Object> params) throws Exception {
		sqlSession.insert(NAMESPACE_USER + ".signUp", params);
	}

	@Override
	public int activateEmail(HashMap<String, Object> params) throws Exception {
		return sqlSession.update(NAMESPACE_USER + ".activateEmail", params);
	}

	@Override
	public UserVO login(HashMap<String, Object> params) throws Exception {
		return sqlSession.selectOne(NAMESPACE_USER + ".login", params);
	}

	@Override
	public void loginLatestTimeUpdate(HashMap<String, Object> params) throws Exception {
		sqlSession.update(NAMESPACE_USER + ".loginLatestTimeUpdate", params);
	}

	@Override
	public void updateRecommendActiveTime(String u_id) throws Exception {
		sqlSession.update(NAMESPACE_USER + ".updateRecommendActiveTime", u_id);
	}

	@Override
	public Timestamp checkRecommendActiveTime(String u_id) throws Exception {
		return sqlSession.selectOne(NAMESPACE_USER + ".checkRecommendActiveTime", u_id);
	}
	
	@Override
	public void delUser(UserVO vo) throws Exception{
		sqlSession.delete(NAMESPACE_USER + ".delUser", vo);
	}
}
