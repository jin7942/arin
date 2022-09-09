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
	
	/**
	 * 멤버 리스트 조회 함수
	 * @param vo
	 * @return 멤버목록 조회 결과
	 * @see MemberVo
	 * @see MemberMapper
	 */
	public List<Member> selectList(MemberVo vo) { 
		return sqlSession.selectList(namespace + ".selectList", vo); 
	}
	
}
