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
	public Code selectOne(CodeVo vo) {
		return sqlSession.selectOne(namespace + ".selectOne", vo); 
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
	// 코드그룹 조회
	public List<Code> selectCodeGroupName() { 
		return sqlSession.selectList(namespace + ".selectCodeGroupName", ""); 
	}
	// 검색결과 카운트
	public int selectOneCount(CodeVo vo) {
		return sqlSession.selectOne(namespace + ".selectOneCount", vo);
	}
	// for cache
	public List<Code> selectListCachedCodeArrayList(){
		return sqlSession.selectList(namespace + ".selectListCachedCodeArrayList", null); 
	}
	// 아이템 리스트
	public List<Code> selectItemList(CodeVo vo) {
	    return sqlSession.selectList(namespace + ".selectItemList", vo);
	}
	public int selectOneItemCount(CodeVo vo) {
	    return sqlSession.selectOne(namespace + ".selectOneItemCount", vo);
	}
	
	// 대쉬보드
	public Code selectItem() {
	    return sqlSession.selectOne(namespace + ".selectItem", "");
	}
	public List<Code> selectIndexItem() {
	    return sqlSession.selectList(namespace + ".selectIndexItem", "");
	}
	public List<Code> selectVisitList(CodeVo vo) {
	    return sqlSession.selectList(namespace + ".selectVisitList", vo);
	}
	public int selectVisitListCnt(CodeVo vo) {
	    return sqlSession.selectOne(namespace + ".selectVisitListCnt", vo);
	}
}
