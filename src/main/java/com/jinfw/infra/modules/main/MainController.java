package com.jinfw.infra.modules.main;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping (value = "/main/")
public class MainController {

	@Autowired
	MainServiceImpl service;
	
	/**
	 * main/ 접속시 실행되는 함수
	 * @param model
	 * @param vo
	 * @return main.jsp
	 * @throws Exception
	 */
	@RequestMapping (value = "")
	public String main(@ModelAttribute("vo") MainVo vo, Model model) throws Exception {
		
		List<Main> list = service.selectList(vo);
		model.addAttribute("list", list);
		
		System.out.println(vo.getShValue());
		
		return "infra/main/user/main";
	}
	
	/**
	 * 회원가입
	 */
	@RequestMapping (value = "userInst")
	public String signUp(Main dto, Model model) throws Exception {

		int result = service.insert(dto);
		System.out.println("result : " + result);
		
		return "infra/main/user/main";
	}
	@RequestMapping (value = "signUp")
	public String signUpForm(Main dto, Model model) throws Exception {
		
		return "infra/main/user/signUpForm";
	}
	// id 중복 체크
	@RequestMapping("/idCheck")
	@ResponseBody
	public Map<String, Object> idCheck(Main dto) throws Exception {
		
		Map<String, Object> returnMap = new HashMap<String, Object>();
		
		int result = service.idCheck(dto);
		System.out.println(result);
		
		if (result > 0) {
			returnMap.put("rt", "fail");
		} else {
			returnMap.put("rt", "success");
		}
		
		return returnMap;
	}

	// 상세조회
	@RequestMapping(value = "view")
	public String view(@ModelAttribute("vo") MainVo vo, Model model) throws Exception {
		Main item = service.selectOne(vo);
		
		model.addAttribute("item", item);
		
		return "infra/main/user/mainView";
	}
	
	// 상품등록
	@RequestMapping(value = "mainForm")
	public String mainForm(@ModelAttribute("vo") MainVo vo, Model model) throws Exception {
		
		return "infra/main/user/mainForm";
	}
	@RequestMapping(value = "itemInst")
	public String itemInst(Main dto) throws Exception {
		
		int result = service.itemInst(dto);
		System.out.println("insert result" + result);
		
		return "infra/main/user/main";
	}
		
}
