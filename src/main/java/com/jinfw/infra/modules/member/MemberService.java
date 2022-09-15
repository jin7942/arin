package com.jinfw.infra.modules.member;

import java.util.List;

public interface MemberService {

	public List<Member> selectList(MemberVo vo) throws Exception;
	public int selectOneCount(MemberVo vo) throws Exception;
	
}
