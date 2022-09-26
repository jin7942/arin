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
	public int idCheck(Main dto) throws Exception {
		return dao.idCheck(dto);
	}
	
	// 상세조회
	@Override
	public Main selectOne(MainVo vo) throws Exception {
		return dao.selectOne(vo);
	}

	// 상품 등록
	@Override
	public int itemInst(Main dto) throws Exception {
		return dao.itemInst(dto);
	}

	// 상품 구매
	@Override
	public int buyItem(MainVo vo) throws Exception {
		return dao.buyItem(vo);
	}
	
}
