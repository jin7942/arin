package com.jinfw.infra.modules.login;

public class Login {
	
	/*Login dto*/
	private String seq;
	private String memberID;
	private String memberPW;
	private String memberName;
	
	/*####################*/
	public String getMemberName() {
		return memberName;
	}
	public void setMemberName(String memberName) {
		this.memberName = memberName;
	}
	public String getSeq() {
		return seq;
	}
	public void setSeq(String seq) {
		this.seq = seq;
	}
	public String getMemberID() {
		return memberID;
	}
	public void setMemberID(String memberID) {
		this.memberID = memberID;
	}
	public String getMemberPW() {
		return memberPW;
	}
	public void setMemberPW(String memberPW) {
		this.memberPW = memberPW;
	}
	public String getMemberPlace() {
		return memberPlace;
	}
	public void setMemberPlace(String memberPlace) {
		this.memberPlace = memberPlace;
	}
	private String memberPlace;
	
}
