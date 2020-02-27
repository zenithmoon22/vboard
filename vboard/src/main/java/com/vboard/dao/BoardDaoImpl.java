package com.vboard.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.vboard.common.paging.PageCriteria;
import com.vboard.vo.BoardVO;

// @Repository: 자동 객체 생성, Dao를 뜻한다
// 자동으로 생성되기 위해 <context:component-scan> 지정이 필요하다
@Repository("BoardDao")
public class BoardDaoImpl implements BoardDao {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	private final static String namespace = "com.vboard.dao.BoardDao";

	@Override
	public List<BoardVO> listPageCriteria(PageCriteria pc) throws Exception {
		return sqlSession.selectList(namespace + ".listPageCriteria", pc);
	}
	@Override
	public Integer totalCount() throws Exception {
		return sqlSession.selectOne(namespace + ".totalCount");
	}
	@Override
	public BoardVO boardRead(HashMap<String, Object> params) throws Exception {
		return sqlSession.selectOne(namespace + ".boardRead", params);
	}
	@Override
	public void countHit(int b_num) throws Exception {
		sqlSession.update(namespace + ".countHit", b_num);
	}
	@Override
	public void boardWrite(BoardVO boardVO) throws Exception {
		sqlSession.insert(namespace + ".boardWrite", boardVO);
	}
	
	@Override
	public void insertFile(Map<String, Object> map) throws Exception {
		sqlSession.insert(namespace + ".insertFile", map);
	}

	// 파일 조회
	@Override
	public List<Map<String, Object>> selectFileList(int b_num) throws Exception {
		return sqlSession.selectList(namespace +".selectFileList", b_num);
	}
	
	// 첨부파일 다운로드
	@Override
	public Map<String, Object> downFile(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(namespace +".downFile", map);
	}
	
	// 첨부파일 수정
	@Override
	public void updateFile(Map<String, Object> map) throws Exception {
		sqlSession.update(namespace + ".updateFile", map);
	}
	
	@Override
	public void boardUpdate(BoardVO boardVO) throws Exception {
		sqlSession.update(namespace + ".boardUpdate", boardVO);
	}
	@Override
	public void boardDelete(HashMap<String, Object> params) throws Exception {
		sqlSession.delete(namespace + ".boardDelete", params);
	}
	@Override
	public void countReply(int b_num) throws Exception {
		sqlSession.update(namespace + ".countReply", b_num);
	}
	@Override
	public List<BoardVO> searchBoard(HashMap<String, Object> search_params) throws Exception {
		return sqlSession.selectList(namespace + ".searchBoard", search_params);
	}
	@Override
	public Integer searchTotalCount(HashMap<String, Object> params) throws Exception {
		return sqlSession.selectOne(namespace + ".searchTotalCount", params);
	}
	@Override
	public void countRecommned(HashMap<String, Object> params) throws Exception {
		sqlSession.update(namespace + ".countRecommend", params);
	}
}
