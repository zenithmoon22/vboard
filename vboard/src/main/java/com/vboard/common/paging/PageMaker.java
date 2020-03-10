package com.vboard.common.paging;

import org.springframework.web.util.UriComponents;
import org.springframework.web.util.UriComponentsBuilder;


public class PageMaker {

	private PageCriteria pc; // page, perPageNum을 가지고 있다
	private int totalCount; // 전체 게시글의 수
	private int startPage; // 게시글 번호에 따라 보여지는 페이지의 시작 번호
	private int endPage; // 게시글 번호에 따라 보여지는 페이지의 마지막 번호
	private boolean prev; // 이전 버튼을 누를 수 있는 경우 분류를 위한 변수
	private boolean next; // 다음 버튼을 누를 수 있는 경우 분류를 위한 변수
	private int displayPageNum = 10; // 화면 하단에 보여지는 페이지의 개수
	private int tempEndPage;

	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
		calcData(); // 전체 필드 변수들 세팅
					// 전체 게시글 수의 setter가 호출될 때 전체 세팅되도록 함
	}
	// 전체 필드 변수 값들을 계산하는 메서드
	private void calcData() {
		endPage = (int) (Math.ceil(pc.getPage() / (double) displayPageNum) * displayPageNum);
		startPage = (endPage - displayPageNum) + 1;
		int tempEndPage = (int) (Math.ceil(totalCount / (double) pc.getPerPageNum()));
		this.tempEndPage = tempEndPage;

		if (endPage > tempEndPage) {
			endPage = tempEndPage;
		}

		// 1페이지인 경우 이전(false)
		prev = startPage == 1 ? false : true;
		next = endPage * pc.getPerPageNum() >= totalCount ? false : true;
	}
	// .jsp에서 페이징 처리를 할 때
	// 페이지에 따라 a태그를 이용해서 href 페이지를 띄우는 요청을 걸 때
	// 반복되는 작업을 처리하기위해 스프링에서 지원하는 "UriComppent"를 사용한다
	public String makeQuery(int page) {
		UriComponents uriComponents = UriComponentsBuilder.newInstance().queryParam("page", page)
				.queryParam("perPageNum", pc.getPerPageNum()).build();
		return uriComponents.toUriString();
	}

	// getter,setter
	public PageCriteria getPc() {
		return pc;
	}

	public int getTempEndPage() {
		return tempEndPage;
	}

	public void setPc(PageCriteria pc) {
		this.pc = pc;
	}

	public int getTotalCount() {
		return totalCount;
	}

	public int getStartPage() {
		return startPage;
	}

	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}

	public int getEndPage() {
		return endPage;
	}

	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}

	public boolean isPrev() {
		return prev;
	}

	public void setPrev(boolean prev) {
		this.prev = prev;
	}

	public boolean isNext() {
		return next;
	}

	public void setNext(boolean next) {
		this.next = next;
	}

	public int getDisplayPageNum() {
		return displayPageNum;
	}

	public void setDisplayPageNum(int displayPageNum) {
		this.displayPageNum = displayPageNum;
	}

}
