package com.jinfw.infra.modules.user;

import com.jinfw.infra.common.base.BaseVo;

public class UserVo extends BaseVo{

	/*	UserVo vo */
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
