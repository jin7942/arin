package com.jinfw.infra.modules.login;

public interface LoginService {

	public Login selectOneId(Login dto) throws Exception;
	public Login kakaoLogin(Login code) throws Exception;
	public int kakaoInsert(Login dto) throws Exception;
	
}
