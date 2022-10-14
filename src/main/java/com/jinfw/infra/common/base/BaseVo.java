package com.jinfw.infra.common.base;

import com.jinfw.infra.common.constans.Constants;

public class BaseVo {

	// 날짜 검색
	private String shStartDate;
	private String shEndDate;
	private String shOptionDate;

	// 문자열 검색
	private String shValue;
	private String shOptionValue;

	// 삭제 여부
	private String shOptionDelNY;

	// 정렬 기준
	private String shOptionRows;
	private String shOptionSort;

	// paging
	private int thisPage = 1; // 현재 페이지
	private int rowNumToShow = Constants.ROW_NUM_TO_SHOW; // 화면에 보여줄 데이터 줄 갯수
	private int pageNumToShow = Constants.PAGE_NUM_TO_SHOW; // 화면에 보여줄 페이징 번호 갯수

	private int totalRows; // 전체 데이터 갯수
	private int totalPages; // 전체 페이지 번호
	private int startPage; // 시작 페이지 번호
	private int endPage; // 마지막 페이지 번호

	private int startRnumForOracle = 1; // 쿼리 시작 row
	private int endRnumForOracle; // 쿼리 끝 row
	private Integer RNUM;

	private int startRnumForMysql = 0; // 쿼리 시작 row

	public void setParamsPaging(int totalRows) {

		setTotalRows(totalRows);

		if (getTotalRows() == 0) {
			setTotalPages(1);
		} else {
			setTotalPages(getTotalRows() / getRowNumToShow());
		}

		if (getTotalRows() % getRowNumToShow() > 0) {
			setTotalPages(getTotalPages() + 1);
		}

		if (getTotalPages() < getThisPage()) {
			setThisPage(getTotalPages());
		}

		setStartPage(((getThisPage() - 1) / getPageNumToShow()) * getPageNumToShow() + 1);

		setEndPage(getStartPage() + getPageNumToShow() - 1);

		if (getEndPage() > getTotalPages()) {
			setEndPage(getTotalPages());
		}

		setEndRnumForOracle((getRowNumToShow() * getThisPage()));
		setStartRnumForOracle((getEndRnumForOracle() - getRowNumToShow()) + 1);
		if (getStartRnumForOracle() < 1)
			setStartRnumForOracle(1);

		if (getThisPage() == 1) {
			setStartRnumForMysql(0);
		} else {
			setStartRnumForMysql((getRowNumToShow() * (getThisPage() - 1)));
		}

		/*
		 * System.out.println("getThisPage():" + getThisPage());
		 * System.out.println("getTotalRows():" + getTotalRows());
		 * System.out.println("getRowNumToShow():" + getRowNumToShow());
		 * System.out.println("getTotalPages():" + getTotalPages());
		 * System.out.println("getStartPage():" + getStartPage());
		 * System.out.println("getEndPage():" + getEndPage());
		 * System.out.println("getStartRnumForOracle():" + getStartRnumForOracle());
		 * System.out.println("getEndRnumForOracle():" + getEndRnumForOracle());
		 * System.out.println("getStartRnumForMysql(): " + getStartRnumForMysql());
		 */

	}

	/* ############################## */

	public String getShStartDate() {
		return shStartDate;
	}

	public void setShStartDate(String shStartDate) {
		this.shStartDate = shStartDate;
	}

	public String getShEndDate() {
		return shEndDate;
	}

	public void setShEndDate(String shEndDate) {
		this.shEndDate = shEndDate;
	}

	public String getShOptionDate() {
		return shOptionDate;
	}

	public void setShOptionDate(String shOptionDate) {
		this.shOptionDate = shOptionDate;
	}

	public String getShValue() {
		return shValue;
	}

	public void setShValue(String shValue) {
		this.shValue = shValue;
	}

	public String getShOptionValue() {
		return shOptionValue;
	}

	public void setShOptionValue(String shOptionValue) {
		this.shOptionValue = shOptionValue;
	}

	public String getShOptionDelNY() {
		return shOptionDelNY;
	}

	public void setShOptionDelNY(String shOptionDelNY) {
		this.shOptionDelNY = shOptionDelNY;
	}

	public String getShOptionRows() {
		return shOptionRows;
	}

	public void setShOptionRows(String shOptionRows) {
		this.shOptionRows = shOptionRows;
	}

	public String getShOptionSort() {
		return shOptionSort;
	}

	public void setShOptionSort(String shOptionSort) {
		this.shOptionSort = shOptionSort;
	}

	public int getThisPage() {
		return thisPage;
	}

	public void setThisPage(int thisPage) {
		this.thisPage = thisPage;
	}

	public int getRowNumToShow() {
		return rowNumToShow;
	}

	public void setRowNumToShow(int rowNumToShow) {
		this.rowNumToShow = rowNumToShow;
	}

	public int getPageNumToShow() {
		return pageNumToShow;
	}

	public void setPageNumToShow(int pageNumToShow) {
		this.pageNumToShow = pageNumToShow;
	}

	public int getTotalRows() {
		return totalRows;
	}

	public void setTotalRows(int totalRows) {
		this.totalRows = totalRows;
	}

	public int getTotalPages() {
		return totalPages;
	}

	public void setTotalPages(int totalPages) {
		this.totalPages = totalPages;
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

	public int getStartRnumForOracle() {
		return startRnumForOracle;
	}

	public void setStartRnumForOracle(int startRnumForOracle) {
		this.startRnumForOracle = startRnumForOracle;
	}

	public int getEndRnumForOracle() {
		return endRnumForOracle;
	}

	public void setEndRnumForOracle(int endRnumForOracle) {
		this.endRnumForOracle = endRnumForOracle;
	}

	public Integer getRNUM() {
		return RNUM;
	}

	public void setRNUM(Integer rNUM) {
		RNUM = rNUM;
	}

	public int getStartRnumForMysql() {
		return startRnumForMysql;
	}

	public void setStartRnumForMysql(int startRnumForMysql) {
		this.startRnumForMysql = startRnumForMysql;
	}

}
