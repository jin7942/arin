package com.jinfw.infra.modules.user;

import java.util.List;

public interface UserService {

	public User selectOne(UserVo vo) throws Exception;
	public List<User> selectList(UserVo vo) throws Exception;
	public List<User> selectListRegHistory(UserVo vo) throws Exception;
	public List<User> selectListItemCart(UserVo vo) throws Exception;
	public int userUpdt(User dto) throws Exception;
	
}
