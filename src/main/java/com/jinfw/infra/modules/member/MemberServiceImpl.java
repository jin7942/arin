package com.jinfw.infra.modules.member;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class MemberServiceImpl implements MemberService {

	@Autowired
	MemberDao dao;
	
	/**
	 * 멤버 리스트 조회 함수
	 * @param vo
	 * @return object
	 * @see MemberVo
	 * @see MemberDao
	 */
	@Override
	public List<Member> selectList(MemberVo vo) throws Exception {
		return dao.selectList(vo);
	}
	
	/**
	 * 검색결과 카운트 함수
	 * @param MemberVo vo
	 * @return int
	 */
	@Override
	public int selectOneCount(MemberVo vo) throws Exception {
		return dao.selectOneCount(vo);
	}
	
	
}
