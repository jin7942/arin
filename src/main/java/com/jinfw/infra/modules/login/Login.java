package com.jinfw.infra.modules.login;

public class Login {
	
	/*Login dto*/
	private String seq;
	private String memberID;
	private String memberPW;
	private String memberName;
	private String memberPlace;
	private String memberMailName;
	private String memberMailDomain;
	
    //	Login with Kakao
	private String id;
	private String email;
	
	public String getMemberMailName() {
	    return memberMailName;
	}
	public void setMemberMailName(String memberMailName) {
	    this.memberMailName = memberMailName;
	}
	public String getMemberMailDomain() {
	    return memberMailDomain;
	}
	public void setMemberMailDomain(String memberMailDomain) {
	    this.memberMailDomain = memberMailDomain;
	}
	public String getMemberPlace() {
	    return memberPlace;
	}
	public void setMemberPlace(String memberPlace) {
	    this.memberPlace = memberPlace;
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
    public String getMemberName() {
        return memberName;
    }
    public void setMemberName(String memberName) {
        this.memberName = memberName;
    }
    public String getId() {
        return id;
    }
    public void setId(String id) {
        this.id = id;
    }
    public String getEmail() {
        return email;
    }
    public void setEmail(String email) {
        this.email = email;
    }
	
    /*####################*/
	
	
}
