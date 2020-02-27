package com.vboard.common.paging;

public class ReplyPageCriteria {
	private int replyPage;
	private int replyPerPageNum;

	public int getReplyPageStart() {
		return (this.replyPage - 1) * this.replyPerPageNum;
	}

	// 생성자
	public ReplyPageCriteria() {
		this.replyPage = 1;
		this.replyPerPageNum = 5;
	}

	public int getReplyPage() {
		return replyPage;
	}

	// 시작 페이지 번호 1
	public void setReplyPage(int replyPage) {
		if (replyPage <= 0) {
			this.replyPage = 1;
		} else {
			this.replyPage = replyPage;
		}
	}

	public int getReplyPerPageNum() {
		return replyPerPageNum;
	}

	// 페이지당 설정, 0보다 작거나 100보다 크면, 10으로 초기화
	public void setReplyPerPageNum(int replyPerPageNum) {
		if (replyPerPageNum <= 0 || replyPerPageNum > 100) {
			this.replyPerPageNum = 10;
		} else {
			this.replyPerPageNum = replyPerPageNum;
		}

	}

	@Override
	public String toString() {
		return "ReplyPageCriteria [replyPage=" + replyPage + ", replyPerPageNum=" + replyPerPageNum + "]";
	}
}
