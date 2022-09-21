package com.jinfw.infra.common.utill;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

public class FileUploadVo {

	private String nmae;
	private MultipartFile file;
	private List<FileUploadVo> list;
	
	public String getNmae() {
		return nmae;
	}
	public void setNmae(String nmae) {
		this.nmae = nmae;
	}
	public MultipartFile getFile() {
		return file;
	}
	public void setFile(MultipartFile file) {
		this.file = file;
	}
	public List<FileUploadVo> getList() {
		return list;
	}
	public void setList(List<FileUploadVo> list) {
		this.list = list;
	}


	
}
