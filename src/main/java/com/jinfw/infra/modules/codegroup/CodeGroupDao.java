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
	
	private static String namespace = "com.jinfw.infra.modules.codegroup.CodeGroupMapper";
	
	/**
	 * 코드그룹 리스트 조회 함수
	 * @param vo
	 * @return 코드그룹 조회 결과
	 * @see CodeGroupVo
	 * @see CodeGroupMapper
	 */
	public List<CodeGroup> selectList(CodeGroupVo vo) { 
		return sqlSession.selectList(namespace + ".selectList", vo); 
	}
	
	public int insert(CodeGroup dto) {
		int result = sqlSession.insert(namespace + ".insert", dto);
		
		return result;
	}
	
}
