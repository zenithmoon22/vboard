package com.vboard.common.paging;

import org.springframework.web.util.UriComponents;
import org.springframework.web.util.UriComponentsBuilder;

public class ReplyPageMaker {
	private ReplyPageCriteria rpc;

	private int replyTotalCount;
	private int replyStartPage;
	private int replyEndPage;
	private boolean replyPrev;
	private boolean replyNext;

	private int replyDisplayPageNum = 10;
	private int replyTempEndPage;

	private void calcData() {
		replyEndPage = (int) (Math.ceil(rpc.getReplyPage() / (double) replyDisplayPageNum) * replyDisplayPageNum);
		replyStartPage = (replyEndPage - replyDisplayPageNum) + 1;
		int replyTempEndPage = (int) (Math.ceil(replyTotalCount / (double) rpc.getReplyPerPageNum()));
		this.replyTempEndPage = replyTempEndPage;

		if (replyEndPage > replyTempEndPage) {
			replyEndPage = replyTempEndPage;
		}

		replyPrev = replyStartPage == 1 ? false : true;
		replyNext = replyEndPage * rpc.getReplyPerPageNum() >= replyTotalCount ? false : true;

	}

	public String replyMakeQuery(int replyPage) {
		UriComponents uriComponents = UriComponentsBuilder.newInstance().queryParam("replyPage", replyPage)
				.queryParam("replyPerPageNum", rpc.getReplyPerPageNum()).build();

		return uriComponents.toUriString();
	}

	// 커스텀 getters or setters
	public void setReplyTotalCount(int replyTotalCount) {
		this.replyTotalCount = replyTotalCount;
		calcData();
	}

	// 자동 완성 getters or setters
	public ReplyPageCriteria getRpc() {
		return rpc;
	}

	public void setRpc(ReplyPageCriteria rpc) {
		this.rpc = rpc;
	}

	public int getReplyTotalCount() {
		return replyTotalCount;
	}

	public int getReplyStartPage() {
		return replyStartPage;
	}

	public void setReplyStartPage(int replyStartPage) {
		this.replyStartPage = replyStartPage;
	}

	public int getReplyEndPage() {
		return replyEndPage;
	}

	public void setReplyEndPage(int replyEndPage) {
		this.replyEndPage = replyEndPage;
	}

	public boolean isReplyPrev() {
		return replyPrev;
	}

	public void setReplyPrev(boolean replyPrev) {
		this.replyPrev = replyPrev;
	}

	public boolean isReplyNext() {
		return replyNext;
	}

	public void setReplyNext(boolean replyNext) {
		this.replyNext = replyNext;
	}

	public int getReplyDisplayPageNum() {
		return replyDisplayPageNum;
	}

	public void setReplyDisplayPageNum(int replyDisplayPageNum) {
		this.replyDisplayPageNum = replyDisplayPageNum;
	}

	public int getReplyTempEndPage() {
		return replyTempEndPage;
	}

	// public void setReplyTempEndPage(int replyTempEndPage) {
	// this.replyTempEndPage = replyTempEndPage;
	// }

}
