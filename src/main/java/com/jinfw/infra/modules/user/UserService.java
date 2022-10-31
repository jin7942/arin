package com.jinfw.infra.modules.user;

import java.util.List;

public interface UserService {

	public User selectOne(UserVo vo) throws Exception;
	public List<User> selectList(UserVo vo) throws Exception;
	public List<User> selectListRegHistory(UserVo vo) throws Exception;
	public List<User> selectListItemCart(UserVo vo) throws Exception;
	public int userUpdt(User dto) throws Exception;
	public int selectOneCount(UserVo vo) throws Exception;
	public int deleteCartItem(UserVo vo) throws Exception;
	public int selectRegHistoryCount(UserVo vo) throws Exception;
	public int selectHistoryCount(UserVo vo) throws Exception;
	
}
