package com.jinfw.infra.modules.member;

public class MemberVo {
	
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
	
	
	// ########################################
	// Generate Getters and Setters

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

}
