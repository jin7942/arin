package com.jinfw.infra.modules.code;

import java.util.List;

import javax.annotation.Resource;
import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Repository
public class CodeDao {

	@Inject
	@Resource(name = "sqlSession")
	private SqlSession sqlSession;
	
	private static String namespace = "com.jinfw.infra.modules.code.CodeMapper";
	
	// 리스트 조회
	public List<Code> selectList(CodeVo vo) { 
		return sqlSession.selectList(namespace + ".selectList", vo); 
	}
	// 상세
	public Code selectOne(Code dto) {
		return sqlSession.selectOne(namespace + ".selectOne", dto); 
	}
	// 삽입
	public int insert(Code dto) {
		return sqlSession.insert(namespace + ".insert", dto);
	}
	// 수정
	public int update(Code dto) {
		return sqlSession.update(namespace + ".update", dto);
	}
	// uelete
	public int uelete(Code dto) {
		return sqlSession.update(namespace + ".uelete", dto);
	}
	// 삭제
	public int delete(CodeVo vo) {
		return sqlSession.delete(namespace + ".update", vo);
	}

}
