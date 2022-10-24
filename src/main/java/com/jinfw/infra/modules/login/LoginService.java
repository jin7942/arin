package com.jinfw.infra.modules.login;

public interface LoginService {

	public Login selectOneId(Login dto) throws Exception;
	public String kakaoLogin(String code) throws Exception;
	
}
