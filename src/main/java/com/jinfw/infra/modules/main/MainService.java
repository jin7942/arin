package com.jinfw.infra.modules.main;

import java.util.List;

public interface MainService {

	public List<Main> selectList(MainVo vo) throws Exception;
	public Main selectOne(MainVo vo) throws Exception;
	public int insert(Main dto) throws Exception;
	public int idCheck(String id) throws Exception;
	
}
