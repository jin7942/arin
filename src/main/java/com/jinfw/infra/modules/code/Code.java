package com.jinfw.infra.modules.code;

import java.util.ArrayList;
import java.util.List;

public class Code {

    /** Code DTO */
    private String ifccSeq;
    private String ifccNameEng;
    private String ifccNameKor;
    private String ifccUseNY;
    private String ifccDelNY;
    private String ifccDescription;
    private String ifccRegDatetime;
    private String ifccModDatetime;
    private String infrCodeGroup_ifcgSeq;

    /** CodeGruop DTO */
    private String ifcgNameKor;
    private String ifcgSeq;

    /* item DTO */
    private String itemSeq;
    private String itemHeader;
    private String itemPrice;
    private String itemDescription;
    private String itemRegDatetime;
    private String itemModDatetime;
    private String itemPlace;
    private String member_seq;
    private String seller;
    private String itemDelNY;
    private String itemSaleNY;



    public static void setCachedCodeArrayList(List<Code> cachedCodeArrayList) {
        Code.cachedCodeArrayList = cachedCodeArrayList;
    }

    /* for cache */
    public static List<Code> cachedCodeArrayList = new ArrayList<Code>();

    // ########################################
    // Generate Getters and Setters
    public String getItemSaleNY() {
        return itemSaleNY;
    }
    
    public void setItemSaleNY(String itemSaleNY) {
        this.itemSaleNY = itemSaleNY;
    }
    public String getItemDelNY() {
        return itemDelNY;
    }
    
    public void setItemDelNY(String itemDelNY) {
        this.itemDelNY = itemDelNY;
    }
    public String getItemModDatetime() {
        return itemModDatetime;
    }
    
    public void setItemModDatetime(String itemModDatetime) {
        this.itemModDatetime = itemModDatetime;
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

    public static List<Code> getCachedCodeArrayList() {
        return cachedCodeArrayList;
    }

    public String getIfccSeq() {
        return ifccSeq;
    }

    public void setIfccSeq(String ifccSeq) {
        this.ifccSeq = ifccSeq;
    }

    public String getIfccNameEng() {
        return ifccNameEng;
    }

    public void setIfccNameEng(String ifccNameEng) {
        this.ifccNameEng = ifccNameEng;
    }

    public String getIfccNameKor() {
        return ifccNameKor;
    }

    public void setIfccNameKor(String ifccNameKor) {
        this.ifccNameKor = ifccNameKor;
    }

    public String getIfccUseNY() {
        return ifccUseNY;
    }

    public void setIfccUseNY(String ifccUseNY) {
        this.ifccUseNY = ifccUseNY;
    }

    public String getIfccDelNY() {
        return ifccDelNY;
    }

    public void setIfccDelNY(String ifccDelNY) {
        this.ifccDelNY = ifccDelNY;
    }

    public String getIfccDescription() {
        return ifccDescription;
    }

    public void setIfccDescription(String ifccDescription) {
        this.ifccDescription = ifccDescription;
    }

    public String getIfccRegDatetime() {
        return ifccRegDatetime;
    }

    public void setIfccRegDatetime(String ifccRegDatetime) {
        this.ifccRegDatetime = ifccRegDatetime;
    }

    public String getIfccModDatetime() {
        return ifccModDatetime;
    }

    public void setIfccModDatetime(String ifccModDatetime) {
        this.ifccModDatetime = ifccModDatetime;
    }

    public String getInfrCodeGroup_ifcgSeq() {
        return infrCodeGroup_ifcgSeq;
    }

    public void setInfrCodeGroup_ifcgSeq(String infrCodeGroup_ifcgSeq) {
        this.infrCodeGroup_ifcgSeq = infrCodeGroup_ifcgSeq;
    }

    public String getIfcgNameKor() {
        return ifcgNameKor;
    }

    public void setIfcgNameKor(String ifcgNameKor) {
        this.ifcgNameKor = ifcgNameKor;
    }

    public String getIfcgSeq() {
        return ifcgSeq;
    }

    public void setIfcgSeq(String ifcgSeq) {
        this.ifcgSeq = ifcgSeq;
    }

}
