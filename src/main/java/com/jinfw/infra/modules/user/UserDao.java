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
	// 주문내역 조회
    public int selectHistoryCount(UserVo vo) {
        return sqlSession.selectOne(namespace + ".selectHistoryCount", vo);
    }
    
	
	// 등록상품 조회
	public List<User> selectListRegHistory(UserVo vo) {
		return sqlSession.selectList(namespace + ".selectListRegHistory", vo);
	}
	// 등록상품 카운트
	public int selectRegHistoryCount(UserVo vo) {
	    return sqlSession.selectOne(namespace + ".selectRegHistoryCount", vo);
	}
	
	// 회원정보 수정
	public int userUpdt(User dto) {
		return sqlSession.update(namespace + ".userUpdt", dto);
	}
	
	// 장바구니
	public List<User> selectListItemCart(UserVo vo) {
		return sqlSession.selectList(namespace + ".selectListItemCart", vo);
	}
	// 장바구니 카운트
	public int selectOneCount(UserVo vo) {
		return sqlSession.selectOne(namespace + ".selectOneCount", vo);
	}
	// 장바구니 삭제
	public int deleteCartItem(UserVo vo) {
		return sqlSession.delete(namespace + ".deleteCartItem", vo);
	}
}
