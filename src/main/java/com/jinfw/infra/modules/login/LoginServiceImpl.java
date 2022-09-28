package com.jinfw.infra.modules.login;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jinfw.infra.common.utill.UtilSecurity;

@Service
public class LoginServiceImpl implements LoginService {

	@Autowired
	LoginDao dao;
	
	/**
	 * 로그인
	 */
	@Override
	public Login selectOneId(Login dto) throws Exception {
		dto.setMemberPW(UtilSecurity.encryptSha256(dto.getMemberPW()));
		
		return dao.selectOneId(dto);
	}
	
	
}
