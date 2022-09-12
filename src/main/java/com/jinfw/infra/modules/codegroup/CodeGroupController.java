package com.jinfw.infra.modules.codegroup;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
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
	public String codeGroupList(Model model, CodeGroupVo vo) throws Exception {

		List<CodeGroup> list = service.selectList(vo);
		
		model.addAttribute("list", list);
		model.addAttribute("vo", vo);
		
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
	public String codeGroupForm(Model model, CodeGroupVo vo) throws Exception {
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
	public String codeGroupInst(CodeGroup dto) throws Exception {
		int result = service.insert(dto);
		
		System.out.println("controller result : " + result);
		
		return "redirect:codeGroupList";
	}

}
