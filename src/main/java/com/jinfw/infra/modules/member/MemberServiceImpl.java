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
	 * @return 멤버목록 조회 결과
	 * @see MemberVo
	 * @see MemberDao
	 */
	@Override
	public List<Member> selectList(MemberVo vo) throws Exception {
		return dao.selectList(vo);
	}
	
}
