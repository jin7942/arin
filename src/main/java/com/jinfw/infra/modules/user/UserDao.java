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
	public User selectOne(UserVo vo) { 
		return sqlSession.selectOne(namespace + ".selectOne", vo); 
	}
	
	// 주문내역 조회
	public List<User> selectList(UserVo vo) {
		return sqlSession.selectList(namespace + ".selectList", vo);
	}
	
	// 등록상품 조회
	public List<User> selectListRegHistory(UserVo vo) {
		return sqlSession.selectList(namespace + ".selectListRegHistory", vo);
	}
	
}
