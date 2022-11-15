package com.jinfw.infra.modules.login;

import javax.annotation.Resource;
import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Repository
public class LoginDao {
	
	@Inject
	@Resource(name = "sqlSession")
	private SqlSession sqlSession;
	
	private static String namespace = "com.jinfw.infra.modules.login.LoginMapper";
	
	// 로그인
	public Login selectOneId(Login dto) {
		return sqlSession.selectOne(namespace + ".selectOneId", dto);
	}
	public Login snsLogin(Login dto) {
	    return sqlSession.selectOne(namespace + ".snsLogin", dto);
	}
	public int snsInsert(Login dto) {
	    return sqlSession.insert(namespace + ".snsInsert", dto);
	}
	public int loginLogInsert(Login dto) {
	    return sqlSession.insert(namespace + ".loginLogInsert", dto);
	}
	
	
}
