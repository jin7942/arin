package com.jinfw.infra.modules.codegroup;

import java.util.List;

import javax.annotation.Resource;
import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Repository
public class CodeGroupDao {

	@Inject
	@Resource(name = "sqlSession")
	private SqlSession sqlSession;
	
	@Inject
	@Resource(name = "sqlSession")
	private SqlSession sqlSessionOracle;
	
	private static String namespace = "com.jinfw.infra.modules.codegroup.CodeGroupMapper";
	
	// 리스트 조회
	public List<CodeGroup> selectList(CodeGroupVo vo) { 
		return sqlSession.selectList(namespace + ".selectList", vo); 
	}
	// 상세
	public CodeGroup selectOne(CodeGroup dto) {
		return sqlSession.selectOne(namespace + ".selectOne", dto); 
	}
	// 삽입
	public int insert(CodeGroup dto) {
		int result = sqlSession.insert(namespace + ".insert", dto);
		return result;
	}
	// 수정
	public int update(CodeGroup dto) {
		return sqlSession.update(namespace + ".update", dto);
	}
	// uelete
	public int uelete(CodeGroup dto) {
		return sqlSession.update(namespace + ".uelete", dto);
	}
	// 삭제
	public int delete(CodeGroupVo vo) {
		return sqlSession.delete(namespace + ".delete", vo);
	}
	// 검색결과 카운트
	public int selectOneCount(CodeGroupVo vo) {
		return sqlSession.selectOne(namespace + ".selectOneCount", vo);
	}

}
