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
	public User selectOne() throws Exception {
		return dao.selectOne();
	}

	/*주문내역*/
	@Override
	public List<User> selectList() throws Exception {
		return dao.selectList();
	}
	
	
	
	
}
