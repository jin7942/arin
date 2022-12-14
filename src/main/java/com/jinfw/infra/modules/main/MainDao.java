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
	public List<Main> seleList(MainVo vo) {
		return sqlSession.selectList(namespace + ".selectList", vo);
	}
	public int selectOneCount(MainVo vo) {
		return sqlSession.selectOne(namespace + ".selectOneCount", vo);
	}
	
	// 회원가입
	public int insert(Main dto) {
		return sqlSession.insert(namespace + ".insert", dto);
	}
	// id 중복체크
	public int idCheck(Main dto) {
		return sqlSession.selectOne(namespace + ".idCheck", dto);
	}
	
	// 상품 상세 조회
	public Main selectOne(MainVo vo) {
		return sqlSession.selectOne(namespace + ".selectOne", vo); 
	}
	public List<Main> selectListItemImg(MainVo vo) {
		return sqlSession.selectList(namespace + ".selectListItemImg", vo);
	}
	public List<Main> selectListRecommend() {
		return sqlSession.selectList(namespace + ".selectListRecommend", "");
	}
	
	// 상품등록
	public int itemInst(Main dto) {
		return sqlSession.insert(namespace + ".itemInst", dto); 
	}
	public int itemImgUpload(Main dto) {
		return sqlSession.insert(namespace + ".itemImgUpload", dto);
	}
	
	// 상품 수정
	public int itemUpdt(Main dto) {
		return sqlSession.update(namespace + ".itemUpdt", dto);
	}
	public int itemImgUpdt(Main dto) {
		return sqlSession.update(namespace + ".itemImgUpdt", dto);
	}
	
	// 상품 구매
	public int buyItem(MainVo vo) {
		return sqlSession.update(namespace + ".buyItem", vo);
	}
	
	// 장바구니 등록
	public int insertItemCart(MainVo vo) {
		return sqlSession.insert(namespace + ".insertItemCart", vo);
	}
	public int selectOneCartCount(MainVo vo) {
		return sqlSession.selectOne(namespace + ".selectOneCartCount", vo);
	}
	
	// 댓글 조회
	public List<Main> selectComment(MainVo vo) {
	    return sqlSession.selectList(namespace + ".selectComment", vo);
	}
	// 댓글등록
	public int regComment(Main dto) {
	    return sqlSession.insert(namespace + ".regComment", dto);
	}
}
