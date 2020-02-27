package com.vboard.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.vboard.dao.ReplyDao;
import com.vboard.vo.ReplyVO;

@Service("ReplyService")
public class ReplyServiceImpl implements ReplyService {

	@Autowired
	private ReplyDao replyDao;

	@Override
	public List<ReplyVO> replyListPageCriteria(HashMap<String, Object> reply_params) throws Exception {
		return replyDao.replyListPageCriteria(reply_params);
	}

	@Override
	public Integer replyTotalCount(int b_num) throws Exception {
		return replyDao.replyTotalCount(b_num);
	}

	@Override
	public void replyWrite(HashMap<String, Object> params) throws Exception {
		replyDao.replyWrite(params);
	}

	@Override
	public void replyDelete(int reply_index) throws Exception {
		replyDao.replyDelete(reply_index);
	}

	@Override
	public void replyUpdate(HashMap<String, Object> params) throws Exception {
		replyDao.replyUpdate(params);
	}
}
