package com.vboard.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.vboard.common.paging.PageCriteria;
import com.vboard.vo.BoardVO;

public interface BoardDao {

	// 전체 글 가져오기 및 페이징 처리를 위한 메서드
	public List<BoardVO> listPageCriteria(PageCriteria pc) throws Exception;

	// 전체 게시글 수를 구하는 메서드
	public Integer totalCount() throws Exception;

	// 게시글 내용을 보는 메서드
	public BoardVO boardRead(HashMap<String, Object> params) throws Exception;

	// 조회수 올리기 메서드
	public void countHit(int b_num) throws Exception;

	// 글쓰기 메서드
	public void boardWrite(BoardVO boardVO) throws Exception;
	
	// 파일 업로드
	public void insertFile(Map<String, Object> map) throws Exception;
	
	// 파일 조회
	public List<Map<String, Object>> selectFileList(int b_num) throws Exception;

	// 첨부파일 다운
	public Map<String, Object> downFile(Map<String, Object> map) throws Exception;
	
	// 첨부파일 수정
	public void updateFile(Map<String, Object> map) throws Exception;

	// 글수정 메서드
	public void boardUpdate(BoardVO boardVO) throws Exception;

	// 글삭제 메서드
	public void boardDelete(HashMap<String, Object> params) throws Exception;
	
	// 댓글 수 세기 메서드
	public void countReply(int b_num) throws Exception;
	
	// 검색 결과를 가져오는 메서드
	public List<BoardVO> searchBoard(HashMap<String, Object> search_params) throws Exception;
	
	// 검색 결과의 개수를 가져오는 메서드
	public Integer searchTotalCount(HashMap<String, Object> params) throws Exception;
	
	// 추천수 올리기 메서드
	public void countRecommned(HashMap<String, Object> params) throws Exception;
	
}
