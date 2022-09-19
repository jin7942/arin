package com.jinfw.infra.modules.user;

import java.util.List;

public interface UserService {

	public User selectOne() throws Exception;
	public List<User> selectList() throws Exception;
	
}
