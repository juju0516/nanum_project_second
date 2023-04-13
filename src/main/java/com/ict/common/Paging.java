package com.ict.common;

import org.springframework.stereotype.Service;

//페이지 기법 : 전체 정보에서 원하는 일부의 정보를 가져오기
// 해당 페이지에서 시작번호와 끝번호 구하기
// 시작블록과 끝블록 구하기
@Service
public class Paging {
	private int nowPage = 1; // 현재 페이지
	private int nowBlock = 1; // 현재 블록
	private int totalRecord = 0; // 전체 게시글의 수
	private int totalPage = 0; // 전체 페이지의 수
	private int totalBlock = 0; // 전체 블록의 수
	private int numPerPage = 6; // 한페이지 안에 존재하는 원글(게시글)의 수
	private int pagePerBlock = 2; // 한 블록 안에 존재하는 페이지의 수

	// 실제로 사용되는 변수
	private int begin = 0; // 시작 번호
	private int end = 0; // 끝 번호
	private int beginBlock = 0; // 시작 블록
	private int endBlock = 0; // 끝 블록

	public int getNowPage() {
		return nowPage;
	}

	public void setNowPage(int nowPage) {
		this.nowPage = nowPage;
	}

	public int getNowBlock() {
		return nowBlock;
	}

	public void setNowBlock(int nowBlock) {
		this.nowBlock = nowBlock;
	}

	public int getTotalRecord() {
		return totalRecord;
	}

	public void setTotalRecord(int totalRecord) {
		this.totalRecord = totalRecord;
	}

	public int getTotalPage() {
		return totalPage;
	}

	public void setTotalPage(int totalPage) {
		this.totalPage = totalPage;
	}

	public int getTotalBlock() {
		return totalBlock;
	}

	public void setTotalBlock(int totalBlock) {
		this.totalBlock = totalBlock;
	}

	public int getNumPerPage() {
		return numPerPage;
	}

	public void setNumPerPage(int numPerPage) {
		this.numPerPage = numPerPage;
	}

	public int getPagePerBlock() {
		return pagePerBlock;
	}

	public void setPagePerBlock(int pagePerBlock) {
		this.pagePerBlock = pagePerBlock;
	}

	public int getBegin() {
		return begin;
	}

	public void setBegin(int begin) {
		this.begin = begin;
	}

	public int getEnd() {
		return end;
	}

	public void setEnd(int end) {
		this.end = end;
	}

	public int getBeginBlock() {
		return beginBlock;
	}

	public void setBeginBlock(int beginBlock) {
		this.beginBlock = beginBlock;
	}

	public int getEndBlock() {
		return endBlock;
	}

	public void setEndBlock(int endBlock) {
		this.endBlock = endBlock;
	}

	public void init(int numPerPage, int blockPerPage) {
		nowPage = 1;
		nowBlock = 1;
		totalRecord = 0; // 전체 게시글의 수
		totalPage = 0; // 전체 페이지의 수
		totalBlock = 0; // 전체 블록의 수
		this.numPerPage = numPerPage; // 한페이지 안에 존재하는 원글(게시글)의 수
		pagePerBlock = blockPerPage; // 한 페이지에서 표시되는 블록의 수

		// 실제로 사용되는 변수
		begin = 0; // 시작 번호
		end = 0; // 끝 번호
		beginBlock = 0; // 시작 블록
		endBlock = 0; // 끝 블록
	}

}