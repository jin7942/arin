package com.jinfw.infra.modules.login;

public class Login {
	
	/*Login dto*/
	private String seq;
	private String memberID;
	private String memberPW;
	private String memberName;
	
//	Login with Kakao
	private String code;
	private String id;
	private String email;
	private String nickName;
	
    /*####################*/
	public String getCode() {
        return code;
    }
    public void setCode(String code) {
        this.code = code;
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
    public String getNickName() {
        return nickName;
    }
    public void setNickName(String nickName) {
        this.nickName = nickName;
    }
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
