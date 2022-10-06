package com.jinfw.infra.modules.user;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class UserServiceImpl implements UserService {

	@Autowired
	UserDao dao;

	/*회원 상세 페이지*/
	@Override
	public User selectOne(UserVo vo) throws Exception {
		
		return dao.selectOne(vo);
	}

	/*주문내역*/
	@Override
	public List<User> selectList(UserVo vo) throws Exception {
		return dao.selectList(vo);
	}
	
	/*등록상품*/
	@Override
	public List<User> selectListRegHistory(UserVo vo) throws Exception {
		return dao.selectListRegHistory(vo);
	}

	/* 회원정보 수정 */
	@Override
	public int userUpdt(User dto) throws Exception {
		return dao.userUpdt(dto);
	}
	
	/* 장바구니 */
	@Override
	public List<User> selectListItemCart(UserVo vo) throws Exception {
		return dao.selectListItemCart(vo);
	}
	
}
