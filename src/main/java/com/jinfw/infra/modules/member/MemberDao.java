package com.jinfw.infra.modules.member;

import java.util.List;

import javax.annotation.Resource;
import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Repository
public class MemberDao {
	
	@Inject
	@Resource(name = "sqlSession")
	private SqlSession sqlSession;
	
	private static String namespace = "com.jinfw.infra.modules.member.MemberMapper";
	
	// 멤버 리스트 조회
	public List<Member> selectList(MemberVo vo) { 
		return sqlSession.selectList(namespace + ".selectList", vo); 
	}
	
	// 검색결과 카운트
	public int selectOneCount(MemberVo vo) {
		return sqlSession.selectOne(namespace + ".selectOneCount", vo);
	}
	
	// 멤버 상세 조회
	public Member selectOneMember(MemberVo vo) {
		return sqlSession.selectOne(namespace + ".selectOneMember", vo);
	}
	
	
}
