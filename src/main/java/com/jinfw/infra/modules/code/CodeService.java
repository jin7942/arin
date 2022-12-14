package com.jinfw.infra.modules.code;

import java.util.List;

public interface CodeService {

	public List<Code> selectList(CodeVo vo) throws Exception; 
	public Code selectOne(CodeVo vo) throws Exception;
	public List<Code> selectItemList(CodeVo vo) throws Exception;
	public List<Code> selectCodeGroupName() throws Exception;
	public int insert(Code dto) throws Exception;
	public int update(Code dto) throws Exception;
	public int uelete(Code dto) throws Exception;
	public int delete(CodeVo vo) throws Exception;
	public int selectOneCount(CodeVo vo) throws Exception;
	public int selectOneItemCount(CodeVo vo) throws Exception;
	public Code selectItem() throws Exception;
	public List<Code> selectIndexItem() throws Exception;
	public List<Code> selectVisitList(CodeVo vo) throws Exception;
	public int selectVisitListCnt(CodeVo vo) throws Exception;
	public Code selectOneItem(CodeVo vo) throws Exception;
}
