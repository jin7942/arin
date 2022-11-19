package com.jinfw.infra.modules.login;

public interface LoginService {

	public Login selectOneId(Login dto) throws Exception;
	public Login snsLogin(Login code) throws Exception;
	public int snsInsert(Login dto) throws Exception;
	public int loginLogInsert(Login dto) throws Exception;
	public void logInsert(Login dto) throws Exception;
	
}
