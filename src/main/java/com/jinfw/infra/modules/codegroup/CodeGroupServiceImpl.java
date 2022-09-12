package com.jinfw.infra.modules.codegroup;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class CodeGroupServiceImpl implements CodeGroupService {

	@Autowired
	CodeGroupDao dao;
	
	/**
	 * 코드그룹 리스트 조회 함수
	 * @param vo
	 * @return 코드그룹 조회 결과
	 * @see CodeGroupVo
	 * @see CodeGroupDao
	 */
	@Override
	public List<CodeGroup> selectList(CodeGroupVo vo) throws Exception {
		return dao.selectList(vo);
	}

	/**
	 * 코드그룹 추가 함수
	 * @param dto
	 * @return 코드그룹 추가 결과
	 * @see CodeGroup
	 * @see CodeGroupDao
	 */
	@Override
	public int insert(CodeGroup dto) throws Exception {
		return dao.insert(dto);
	}

	

}
