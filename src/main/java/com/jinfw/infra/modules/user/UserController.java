package com.jinfw.infra.modules.user;

import java.util.List;

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
	
	@RequestMapping (value = "info")
	public String userInfo(@ModelAttribute("vo") UserVo vo, Model model) throws Exception {
		
		User item = service.selectOne();
		model.addAttribute("item", item);
		
		return "infra/user/user/userInfo";
	}
	
	@RequestMapping (value = "history")
	public String orderHistory(@ModelAttribute("vo") UserVo vo, Model model) throws Exception {
		
		List<User> list = service.selectList();
		model.addAttribute("list", list);
		
		return "infra/user/user/history";
	}
	
}
