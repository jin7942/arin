package com.jinfw.infra.modules.codegroup;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping(value = "/codegroup/")
public class CodeGroupController {

	@Autowired
	CodeGroupServiceImpl service;

	/**
	 * 코드그룹 리스트 조회 함수
	 * @param model
	 * @param vo
	 * @return codeGroupList.jsp
	 * @throws Exception
	 */
	@RequestMapping(value = "codeGroupList")
	public String codeGroupList(@ModelAttribute("vo") CodeGroupVo vo, Model model) throws Exception {
		
		int totalCnt = service.selectOneCount(vo);
		vo.setParamsPaging(totalCnt);
		
		List<CodeGroup> list = service.selectList(vo);
		
		model.addAttribute("list", list);
		model.addAttribute("totalCnt", totalCnt);
		
		return "infra/codegroup/xdmin/codeGroupList";
	}
	
	/**
	 * 코드그룹 등록폼
	 * @param model
	 * @param vo
	 * @return codeGroupForm.jsp
	 * @throws Exception
	 */
	@RequestMapping(value = "codeGroupForm")
	public String codeForm(Model model, CodeGroupVo vo) throws Exception {
		List<CodeGroup> list = service.selectList(vo);
		
		model.addAttribute("list", list);		
		
		return "infra/codegroup/xdmin/codeGroupForm";
	}
	
	/**
	 * 코드그룹 등록 함수
	 * @param dto
	 * @return codeGroupList 리다이렉트
	 * @throws Exception
	 */
	@RequestMapping(value = "codeGroupInst")
	public String codeInst(CodeGroup dto) throws Exception {
		int result = service.insert(dto);
		
		System.out.println("controller result : " + result);
		
		return "redirect:codeGroupList";
	}
	
	/**
	 * 코드그룹 상세화면
	 * @param model
	 * @param dto
	 * @return codeGroupForm.jsp
	 * @throws Exception
	 */
	@RequestMapping(value = "codeGroupView")
	public String codeView(Model model, CodeGroup dto) throws Exception {
		CodeGroup item = service.selectOne(dto); 
		model.addAttribute("dto", item);
		
		return "infra/codegroup/xdmin/codeGroupForm";
	}
	
	/**
	 * 코드그룹 수정 함수
	 * @param dto
	 * @return codeGroupList
	 * @throws Exception
	 */
	@RequestMapping(value = "codeGroupUpdt")
	public String codeUpdt(CodeGroup dto) throws Exception {
		int result = service.update(dto);
		System.out.println("ifccSeq : " + dto.getIfcgSeq());
		System.out.println("controller result : " + result);
		return "redirect:codeGroupList";
	}
	
	/**
	 * 코드그룹 삭제 함수(uelete)
	 * @param dto
	 * @return codeGroupList
	 * @throws Exception
	 */
	@RequestMapping(value = "codeGroupUele")
	public String codeUele(CodeGroup dto) throws Exception {
		int result = service.uelete(dto);
		System.out.println("controller result22 : " + result);
		return "redirect:codeGroupList";
	}
}
