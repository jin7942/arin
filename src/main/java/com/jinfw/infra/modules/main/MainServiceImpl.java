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
	@Override
	public List<Main> selectListItemImg(MainVo vo) throws Exception {
		return dao.selectListItemImg(vo);
	}
	@Override
	public List<Main> selectListRecommend() throws Exception {
		return dao.selectListRecommend();
	}

	// 상품 등록
	@Override
	public int itemInst(Main dto) throws Exception {
		int result = dao.itemInst(dto);
	
		int j = 0;
    	for(MultipartFile multipartFile : dto.getUploadedImage() ) {
    			
    		if(!multipartFile.isEmpty()) {
    		
    			String pathModule = this.getClass().getSimpleName().toString().toLowerCase().replace("serviceimpl", "");		
    			UtilUpload.upload(multipartFile, pathModule, dto);
    			
	    		dto.setType(2);
	    		dto.setDefaultNy(1);
	    		dto.setSort(j + 1);
	    		dto.setPseq(dto.getSeq());

	    		dao.itemImgUpload(dto);
    		}
    		j++;
    	}
		
		return result;
	}

	// 상품 구매
	@Override
	public int buyItem(MainVo vo) throws Exception {
		return dao.buyItem(vo);
	}

	// 장바구니 등록
	@Override
	public int insertItemCart(MainVo vo) throws Exception {
		return dao.insertItemCart(vo);
	}

	@Override
	public int selectOneCartCount(MainVo vo) throws Exception {
		return dao.selectOneCartCount(vo);
	}
	
}
