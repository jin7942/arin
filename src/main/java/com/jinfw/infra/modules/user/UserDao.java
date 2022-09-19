package com.jinfw.infra.modules.user;

import java.util.List;

import javax.annotation.Resource;
import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Repository
public class UserDao {
	
	@Inject
	@Resource(name = "sqlSession")
	private SqlSession sqlSession;
	
	private static String namespace = "com.jinfw.infra.modules.user.UserMapper";
	
	// 회원 상세정보 조회
	public User selectOne() { 
		return sqlSession.selectOne(namespace + ".selectOne", ""); 
	}
	
	// 주문내역 조회
	public List<User> selectList() {
		return sqlSession.selectList(namespace + ".selectList" + "");
	}
}
