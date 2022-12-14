package com.jinfw.infra.modules.user;

public class User {
	
	/** Member DTO */
	private String seq;
	private String memberID;
	private String memberName;
	private String memberMobile;
	private String memberMailName;
	private String memberMailDomain;
	private String memberPlace;

	/*Item DTO*/
	private String member_seq1;
	private String itemSeq;
	private String itemHeader;
	private String itemPrice;
	private String itemBuyDatetime;
	private String itemRegDatetime;
	private String itemSaleNY;
	
	/* itemCart DTO */
	private String member_seq;
	private String item_seq;
	private String path;
	private String uuidName;

	// ########################################
	// Generate Getters and Setters
	public String getPath() {
		return path;
	}
	public void setPath(String path) {
		this.path = path;
	}
	public String getUuidName() {
		return uuidName;
	}
	public void setUuidName(String uuidName) {
		this.uuidName = uuidName;
	}
	public String getMember_seq() {
		return member_seq;
	}
	public void setMember_seq(String member_seq) {
		this.member_seq = member_seq;
	}
	public String getItem_seq() {
		return item_seq;
	}
	public void setItem_seq(String item_seq) {
		this.item_seq = item_seq;
	}
	public String getItemSeq() {
		return itemSeq;
	}
	public void setItemSeq(String itemSeq) {
		this.itemSeq = itemSeq;
	}
	public String getItemSaleNY() {
		return itemSaleNY;
	}
	public void setItemSaleNY(String itemSaleNY) {
		this.itemSaleNY = itemSaleNY;
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
	public String getMemberName() {
		return memberName;
	}
	public void setMemberName(String memberName) {
		this.memberName = memberName;
	}
	public String getMemberMobile() {
		return memberMobile;
	}
	public void setMemberMobile(String memberMobile) {
		this.memberMobile = memberMobile;
	}
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
	public String getMember_seq1() {
		return member_seq1;
	}
	public void setMember_seq1(String member_seq1) {
		this.member_seq1 = member_seq1;
	}
	public String getItemHeader() {
		return itemHeader;
	}
	public void setItemHeader(String itemHeader) {
		this.itemHeader = itemHeader;
	}
	public String getItemPrice() {
		return itemPrice;
	}
	public void setItemPrice(String itemPrice) {
		this.itemPrice = itemPrice;
	}
	public String getItemBuyDatetime() {
		return itemBuyDatetime;
	}
	public void setItemBuyDatetime(String itemBuyDatetime) {
		this.itemBuyDatetime = itemBuyDatetime;
	}
	public String getItemRegDatetime() {
		return itemRegDatetime;
	}
	public void setItemRegDatetime(String itemRegDatetime) {
		this.itemRegDatetime = itemRegDatetime;
	}
	
	// ########################################
	// Generate Getters and Setters
	
	
}
