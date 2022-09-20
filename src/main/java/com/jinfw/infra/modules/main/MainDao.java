package com.jinfw.infra.modules.main;

import java.util.List;

import javax.annotation.Resource;
import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Repository
public class MainDao {

	@Inject
	@Resource(name = "sqlSession")
	private SqlSession sqlSession;
	
	private static String namespace = "com.jinfw.infra.modules.main.MainMapper";
	
	// 메인 리스트 조회
	public List<Main> seleList() {
		return sqlSession.selectList(namespace + ".selectList", "");
	}
	
	// 회원가입
	public int insert(Main dto) {
		return sqlSession.insert(namespace + ".insert", dto);
	}
	
}
