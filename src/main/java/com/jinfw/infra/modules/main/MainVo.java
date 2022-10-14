package com.jinfw.infra.modules.main;

import com.jinfw.infra.common.base.BaseVo;

public class MainVo extends BaseVo {
	
	private int rowNumToShowForScroll = 9;
	
	@Override
	public void setParamsPaging(int totalRows) {

		setTotalRows(totalRows);

		if (getTotalRows() == 0) {
			setTotalPages(1);
		} else {
			setTotalPages(getTotalRows() / getRowNumToShowForScroll());
		}

		if (getTotalRows() % getRowNumToShowForScroll() > 0) {
			setTotalPages(getTotalPages() + 1);
		}

		setStartPage(((getThisPage() - 1) / getPageNumToShow()) * getPageNumToShow() + 1);

		setEndPage(getStartPage() + getPageNumToShow() - 1);

		if (getEndPage() > getTotalPages()) {
			setEndPage(getTotalPages());
		}

		if (getThisPage() == 1) {
			setStartRnumForMysql(0);
		} else {
			setStartRnumForMysql((getRowNumToShowForScroll() * (getThisPage() - 1)));
		}

		/*
		 * System.out.println("getThisPage():" + getThisPage());
		 * System.out.println("getTotalRows():" + getTotalRows());
		 * System.out.println("getrowNumToShowForScroll():" + getrowNumToShowForScroll());
		 * System.out.println("getTotalPages():" + getTotalPages());
		 * System.out.println("getStartPage():" + getStartPage());
		 * System.out.println("getEndPage():" + getEndPage());
		 * System.out.println("getStartRnumForOracle():" + getStartRnumForOracle());
		 * System.out.println("getEndRnumForOracle():" + getEndRnumForOracle());
		 * System.out.println("getStartRnumForMysql(): " + getStartRnumForMysql());
		 */
		
	}

	/* MainVO vo */ 
	private String mainKey;
	private String itemSeq;

	public int getRowNumToShowForScroll() {
		return rowNumToShowForScroll;
	}
	
	public void setRowNumToShowForScroll(int rowNumToShowForScroll) {
		this.rowNumToShowForScroll = rowNumToShowForScroll;
	}
	public String getItemSeq() {
		return itemSeq;
	}

	public void setItemSeq(String itemSeq) {
		this.itemSeq = itemSeq;
	}

	public String getMainKey() {
		return mainKey;
	}

	public void setMainKey(String mainKey) {
		this.mainKey = mainKey;
	}
	
}
