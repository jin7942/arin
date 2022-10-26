package com.jinfw.infra.modules.main;

import org.springframework.web.multipart.MultipartFile;

public class Main {

	/*item DTO*/
	private String itemSeq;
	private String itemHeader;
	private String itemPrice;
	private String itemDescription;
	private String itemRegDatetime;
	private String itemPlace;
	private String member_seq;
	private String seller;
	
	/*member DTO*/
	private String seq;
	private String memberID;
	private String memberPW;
	private String memberName;
	private String memberMobile;
	private String memberMailName;
	private String memberMailDomain;
	private String memberPlace;
	
    /* memberReview DTO */
	private String memberReviewComment;

	/* upload DTO */
	private Integer defaultNy;
	private Integer sort;
	private String path;
	private String originalName;
	private String uuidName;
	private String ext;
	private Integer type;
	private long size;
	private Integer delNy;
	private String pseq;
	private MultipartFile[] uploadedImage;
	private String itemImgThumbNail;
	
	public String getMemberReviewComment() {
	    return memberReviewComment;
	}
	public void setMemberReviewComment(String memberReviewComment) {
	    this.memberReviewComment = memberReviewComment;
	}
	public String getItemImgThumbNail() {
		return itemImgThumbNail;
	}
	public void setItemImgThumbNail(String itemImgThumbNail) {
		this.itemImgThumbNail = itemImgThumbNail;
	}
	public String getItemSeq() {
		return itemSeq;
	}
	public void setItemSeq(String itemSeq) {
		this.itemSeq = itemSeq;
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
	public String getItemDescription() {
		return itemDescription;
	}
	public void setItemDescription(String itemDescription) {
		this.itemDescription = itemDescription;
	}
	public String getItemRegDatetime() {
		return itemRegDatetime;
	}
	public void setItemRegDatetime(String itemRegDatetime) {
		this.itemRegDatetime = itemRegDatetime;
	}
	public String getItemPlace() {
		return itemPlace;
	}
	public void setItemPlace(String itemPlace) {
		this.itemPlace = itemPlace;
	}
	public String getMember_seq() {
		return member_seq;
	}
	public void setMember_seq(String member_seq) {
		this.member_seq = member_seq;
	}
	public String getSeller() {
		return seller;
	}
	public void setSeller(String seller) {
		this.seller = seller;
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
	public Integer getDefaultNy() {
		return defaultNy;
	}
	public void setDefaultNy(Integer defaultNy) {
		this.defaultNy = defaultNy;
	}
	public Integer getSort() {
		return sort;
	}
	public void setSort(Integer sort) {
		this.sort = sort;
	}
	public String getPath() {
		return path;
	}
	public void setPath(String path) {
		this.path = path;
	}
	public String getOriginalName() {
		return originalName;
	}
	public void setOriginalName(String originalName) {
		this.originalName = originalName;
	}
	public String getUuidName() {
		return uuidName;
	}
	public void setUuidName(String uuidName) {
		this.uuidName = uuidName;
	}
	public String getExt() {
		return ext;
	}
	public void setExt(String ext) {
		this.ext = ext;
	}
	public Integer getType() {
		return type;
	}
	public void setType(Integer type) {
		this.type = type;
	}
	public long getSize() {
		return size;
	}
	public void setSize(long size) {
		this.size = size;
	}
	public Integer getDelNy() {
		return delNy;
	}
	public void setDelNy(Integer delNy) {
		this.delNy = delNy;
	}
	public String getPseq() {
		return pseq;
	}
	public void setPseq(String pseq) {
		this.pseq = pseq;
	}
	public MultipartFile[] getUploadedImage() {  
		return uploadedImage;
	}
	public void setUploadedImage(MultipartFile[] uploadedImage) {
		this.uploadedImage = uploadedImage;
	}
	
	
	
	/*################################*/

	
}
