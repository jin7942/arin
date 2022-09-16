package com.jinfw.infra.modules.code;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class CodeServiceImpl implements CodeService {

	@Autowired
	CodeDao dao;
	
	/**
	 * 공통코드 리스트 조회 함수
	 * @param CodeVo vo
	 * @return 공통코드 조회 결과
	 */
	@Override
	public List<Code> selectList(CodeVo vo) throws Exception {
		return dao.selectList(vo);
	}

	/**
	 * 공통코드 추가 함수
	 * @param Code dto
	 * @return 공통코드 추가 결과
	 */
	@Override
	public int insert(Code dto) throws Exception {
		return dao.insert(dto);
	}

	/**
	 * 공통코드 상세화면
	 * @param Code dto
	 * @return 코드그룹 상세 조회 결과
	 */
	@Override
	public Code selectOne(CodeVo vo) throws Exception {
		return dao.selectOne(vo);
	}

	/**
	 * 공통코드 수정 함수
	 * @param Code dto
	 * @return 공통코드 수정 결과
	 */
	@Override
	public int update(Code dto) throws Exception {
		return dao.update(dto);
	}

	/**
	 * 공통코드 삭제 함수(delNY)
	 * @param Code dto
	 * @return 공통코드 삭제 결과
	 */
	@Override
	public int uelete(Code dto) throws Exception {
		return dao.uelete(dto);
	}

	/**
	 * 공통코드 삭제 함수
	 * @param CodeVo vo
	 * @return 공통코드 삭제 결과
	 */
	@Override
	public int delete(CodeVo vo) throws Exception {
		return dao.delete(vo);
	}
	
	/**
	 * 코드그룹 조회 함수
	 * @return object
	 */
	@Override
	public List<Code> selectCodeGroupName() {
		return dao.selectCodeGroupName();
	}
	
	/**
	 * 검색결과 카운트 함수
	 * @param CodeGroupVo vo
	 * @return {int} 검색결과 개수
	 */
	@Override
	public int selectOneCount(CodeVo vo) throws Exception {
		return dao.selectOneCount(vo);
	}

}
