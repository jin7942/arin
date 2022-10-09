package com.jinfw.infra.modules.main;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.jinfw.infra.common.utill.UtilSecurity;
import com.jinfw.infra.common.utill.UtilUpload;

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
		
		// 비밀번호 암호화
    	dto.setMemberPW(UtilSecurity.encryptSha256(dto.getMemberPW()));
    	
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
		
    	for(MultipartFile multipartFile : dto.getUploadedImage() ) {
    			
    		if(!multipartFile.isEmpty()) {
    		
    			String pathModule = this.getClass().getSimpleName().toString().toLowerCase().replace("serviceimpl", "");		
    			UtilUpload.upload(multipartFile, pathModule, dto);
    			
	    		dto.setType(2);
	    		dto.setDefaultNy(1);
	    		dto.setSort(1);
	    		dto.setPseq(dto.getSeq());

	    		dao.itemImgUpload(dto);
    		}
    	}
		
		return dao.itemInst(dto);
	}

	// 상품 구매
	@Override
	public int buyItem(MainVo vo) throws Exception {
		return dao.buyItem(vo);
	}
	
}
