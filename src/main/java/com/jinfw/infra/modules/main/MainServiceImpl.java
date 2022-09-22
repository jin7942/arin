package com.jinfw.infra.modules.main;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class MainServiceImpl implements MainService {

	@Autowired
	MainDao dao;
	
	/*메인 리스트 조회*/
	@Override
	public List<Main> selectList(MainVo vo) throws Exception {
		return dao.seleList(vo);
	}
	
	/*회원가입*/
	@Override
	public int insert(Main dto) throws Exception {
		return dao.insert(dto);
	}
	// id 중복 체크
	@Override
	public int idCheck(String id) throws Exception {
		return dao.idCheck(id);
	}
	
	
	// 상세조회
	@Override
	public Main selectOne(MainVo vo) throws Exception {
		return dao.selectOne(vo);
	}

	
	
	
	
}
