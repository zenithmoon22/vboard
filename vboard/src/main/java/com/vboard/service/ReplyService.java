package com.vboard.service;

import java.util.HashMap;
import java.util.List;

import com.vboard.vo.ReplyVO;

public interface ReplyService {

	// 댓글 페이징 처리를 위한 메서드
	public List<ReplyVO> replyListPageCriteria(HashMap<String, Object> reply_params) throws Exception;

	// 전체 댓글 수를 구하는 메서드
	public Integer replyTotalCount(int b_num) throws Exception;

	// 댓글 쓰기 메서드
	public void replyWrite(HashMap<String, Object> params) throws Exception;

	// 댓글 삭제 메서드
	public void replyDelete(int reply_index) throws Exception;

	// 댓글 수정 메서드
	public void replyUpdate(HashMap<String, Object> params) throws Exception;

}
