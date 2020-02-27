package com.vboard.common.paging;

/* 

	standard vs criterion(복수형, criteria)
	standard 대부분의 사람들이 생각하는 '기준'
	criterion 내가 사용하는 '기준'
	
	
	Criteria 클래스
	: 페이징 처리를 위해서 사용될 객체로 페이지 번호와 페이지당
		출력할 게시 글 수를 관리할 객체

*/
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
