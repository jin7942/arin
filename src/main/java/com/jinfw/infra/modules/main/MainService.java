package com.jinfw.infra.modules.main;

import java.util.List;

public interface MainService {

	public List<Main> selectList(MainVo vo) throws Exception;
	public List<Main> selectListItemImg(MainVo vo) throws Exception;
	public Main selectOne(MainVo vo) throws Exception;
	public int insert(Main dto) throws Exception;
	public int idCheck(Main dto) throws Exception;
	public int itemInst(Main dto) throws Exception;
	public int buyItem(MainVo vo) throws Exception;
	
}
