package com.jinfw.infra.modules.user;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping (value = "/user/")
public class UserController {
	
	@Autowired
	UserServiceImpl service;
	
	public String sessSeq = ""; 
	
	@RequestMapping (value = "info")
	public String userInfo(@ModelAttribute("vo") UserVo vo, Model model, HttpServletRequest httpServletRequest) throws Exception {
		
		HttpSession httpSession =  httpServletRequest.getSession();
		sessSeq = (String) httpSession.getAttribute("sessSeq");
		
		vo.setMainKey(sessSeq);
		
		User item = service.selectOne(vo);
		model.addAttribute("item", item);
		
		return "infra/user/user/userInfo";
	}
	
	@RequestMapping (value = "history")
	public String orderHistory(@ModelAttribute("vo") UserVo vo, Model model) throws Exception {
		
		vo.setMainKey(sessSeq);
		
		List<User> list = service.selectList(vo);
		model.addAttribute("list", list);
		
		return "infra/user/user/history";
	}
	
	@RequestMapping (value = "regHistory")
	public String regHistory(@ModelAttribute("vo") UserVo vo, Model model) throws Exception {
		
		vo.setMainKey(sessSeq);
		
		List<User> list = service.selectListRegHistory(vo);
		model.addAttribute("list", list);
		
		return "infra/user/user/regHistory";
	}

	@RequestMapping (value = "form")
	public String userform(@ModelAttribute("vo") UserVo vo, Model model) throws Exception {
		
		return "infra/user/user/userForm";
	}
	
}
