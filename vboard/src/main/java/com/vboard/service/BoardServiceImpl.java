package com.vboard.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.vboard.common.paging.PageCriteria;
import com.vboard.dao.BoardDao;
import com.vboard.util.FileUtils;
import com.vboard.vo.BoardVO;

// @Service: 해당 서비스 객체가 자동으로 생성
// @Repository, @Component등과 유사하다
@Service("BoardService")
public class BoardServiceImpl implements BoardService {
	
	@Resource(name="fileUtils")
	private FileUtils fileUtils;
	
	@Autowired
	private BoardDao boardDao;

	@Override
	public List<BoardVO> listPageCriteria(PageCriteria pc) throws Exception {
		return boardDao.listPageCriteria(pc);
	}
	@Override
	public Integer totalCount() throws Exception {
		return boardDao.totalCount();
	}
	@Override
	public BoardVO boardRead(HashMap<String, Object> params) throws Exception {
		return boardDao.boardRead(params);
	}
	@Override
	public void countHit(int b_num) throws Exception {
		boardDao.countHit(b_num);
	}
	@Override
	public void boardWrite(BoardVO boardVO, MultipartHttpServletRequest mpRequest) throws Exception {
		boardDao.boardWrite(boardVO);
		
		List<Map<String,Object>> list = fileUtils.parseInsertFileInfo(boardVO, mpRequest); 
		int size = list.size();
		for(int i=0; i<size; i++){ 
			boardDao.insertFile(list.get(i)); 
		}
	}
	
	@Override
	public List<Map<String, Object>> selectFileList(int b_num) throws Exception {
		return boardDao.selectFileList(b_num);
	}
	
	// 첨부파일 다운로드
	@Override
	public Map<String, Object> downFile(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		return boardDao.downFile(map);
	}
	
	@Override
	public void boardUpdate(BoardVO boardVO, String[] files, String[] fileNames, MultipartHttpServletRequest mpRequest) throws Exception {
		boardDao.boardUpdate(boardVO);
		
		List<Map<String, Object>> list = fileUtils.parseUpdateFileInfo(boardVO, files, fileNames, mpRequest);
		Map<String, Object> tempMap = null;
		int size = list.size();
		for(int i = 0; i<size; i++) {
			tempMap = list.get(i);
			if(tempMap.get("IS_NEW").equals("Y")) {
				boardDao.insertFile(tempMap);
			}else {
				boardDao.updateFile(tempMap);
			}
		}
	}
	@Override
	public void boardDelete(HashMap<String, Object> params) throws Exception {
		boardDao.boardDelete(params);
	}
	@Override
	public void countReply(int b_num) throws Exception {
		boardDao.countReply(b_num);
	}
	@Override
	public List<BoardVO> searchBoard(HashMap<String, Object> search_params) throws Exception {
		return boardDao.searchBoard(search_params);
	}
	@Override
	public Integer searchTotalCount(HashMap<String, Object> params) throws Exception {
		return boardDao.searchTotalCount(params);
	}
	@Override
	public void countRecommned(HashMap<String, Object> params) throws Exception {
		boardDao.countRecommned(params);
	}
}
