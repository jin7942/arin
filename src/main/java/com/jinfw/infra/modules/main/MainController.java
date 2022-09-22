package com.jinfw.infra.modules.main;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
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
	@GetMapping("/idCheck")
	@ResponseBody
	public int idCheck(@RequestParam("id") String id) throws Exception {
		int cnt = service.idCheck(id);
		
		return cnt;
	}

	// 상세조회
	@RequestMapping(value = "view")
	public String view(@ModelAttribute("vo") MainVo vo, Model model) throws Exception {
		Main item = service.selectOne(vo);
		
		model.addAttribute("item", item);
		
		return "infra/main/user/mainView";
	}
		
}
