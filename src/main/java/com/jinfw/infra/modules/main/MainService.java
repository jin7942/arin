package com.jinfw.infra.modules.main;

import java.util.List;

public interface MainService {

	public List<Main> selectList() throws Exception;
	public int insert(Main dto) throws Exception;
	
}
