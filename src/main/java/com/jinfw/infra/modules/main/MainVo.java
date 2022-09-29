package com.jinfw.infra.modules.main;

import com.jinfw.infra.common.base.BaseVo;

public class MainVo extends BaseVo {

	/* MainVO vo */ 
	private String mainKey;
	private String itemSeq;

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
