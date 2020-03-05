package com.vboard.common.paging;

public class PageCriteria {
	private int page; // 현재 페이지를 나타낼 변수
	private int perPageNum; // 페이지당 표시할 게시글의 수

	// limit구문에서 시작 부분에 필요한 값을 반환(Mybatis)
	public int getPageStart() {
		return (this.page - 1) * this.perPageNum;
	}
	// 최초 default 생성자
	// 기본 객체 생성시 초기값을 지정한다(1페이지에 10개)
	public PageCriteria() {
		this.page = 1; // 사용자가 정의하지 않으면 1
		this.perPageNum = 10; // 페이지당 10개씩 출력
	}
	// getter, setter
	public int getPage() {
		return page;
	}
	public void setPage(int page) {
		// 시작 페이지는 1로 설정
		if (page <= 0) {
			this.page = 1;
		} else {
			this.page = page;
		}
	}
	public int getPerPageNum() {
		return perPageNum;
	}
	// 페이지당 설정, 100이상 넘어갈 수 없다
	public void setPerPageNum(int perPageNum) {
		if (perPageNum <= 0 || perPageNum > 100) {
			this.perPageNum = 10;
		} else {
			this.perPageNum = perPageNum;
		}
	}

	@Override
	public String toString() {
		return "PageCriteria [page=" + page + ", perPageNum=" + perPageNum + "]";
	}

}
