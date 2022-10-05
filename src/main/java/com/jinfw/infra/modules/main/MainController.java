package com.jinfw.infra.modules.main;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
@RequestMapping (value = "/main/")
public class MainController {

	@Autowired
	MainServiceImpl service;
	
	public String sessSeq = ""; 
	
	// 메인 리스트
	@RequestMapping (value = "")
	public String main(@ModelAttribute("vo") MainVo vo, Model model, HttpServletRequest httpServletRequest) throws Exception {
		
		HttpSession httpSession =  httpServletRequest.getSession();
		sessSeq = (String) httpSession.getAttribute("sessSeq");
		
		vo.setMainKey(sessSeq);
		System.out.println("mainKey : " + vo.getMainKey());
		
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
		
		System.out.println("userInst!!!!!");
		int result = service.insert(dto);
		System.out.println("result : " + result);
		
		return "redirect:/index#about";
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
		
		System.out.println("mainKey : " + vo.getMainKey());
		
		Main item = service.selectOne(vo);
		model.addAttribute("item", item);
		
		return "infra/main/user/mainView";
	}
	
	// 상품등록
	@RequestMapping(value = "form")
	public String mainForm(@ModelAttribute("vo") MainVo vo, Model model) throws Exception {
		
		return "infra/main/user/mainForm";
	}
	@RequestMapping(value = "itemInst")
	public String itemInst(MainVo vo, Main dto, RedirectAttributes redirectAttributes) throws Exception {
		
		int result = service.itemInst(dto);
		System.out.println("insert result" + result);
		
		vo.setMainKey(dto.getItemSeq());
		redirectAttributes.addFlashAttribute("vo", vo);
		
		return "redirect:view";
	}
	
	// 상품 구매
	@RequestMapping("/buyItem")
	@ResponseBody
	public Map<String, Object> buyItem(MainVo vo) throws Exception {
		
		Map<String, Object> returnMap = new HashMap<String, Object>();
		
		int result = service.buyItem(vo);
		System.out.println("buyItem : " + result);
		
		if (result == 1) {
			returnMap.put("rt", "success");
		} else {
			returnMap.put("rt", "fail");
		}
		
		return returnMap;
	}
	
}
