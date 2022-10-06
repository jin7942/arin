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
	
	public String sessSeq;
	
	/**
	 * 사용자 마이페이지
	 * @param vo
	 * @param model
	 * @param httpServletRequest
	 * @return String
	 * @throws Exception
	 */
	@RequestMapping (value = "info")
	public String userInfo(@ModelAttribute("vo") UserVo vo, Model model, HttpServletRequest httpServletRequest) throws Exception {
		
		HttpSession httpSession =  httpServletRequest.getSession();
		sessSeq = (String) httpSession.getAttribute("sessSeq");
		
		vo.setMainKey(sessSeq);
		
		User item = service.selectOne(vo);
		model.addAttribute("item", item);
		
		return "infra/user/user/userInfo";
	}
	
	/**
	 * 굼매내역
	 * @param vo
	 * @param model
	 * @return String
	 * @throws Exception
	 */
	@RequestMapping (value = "history")
	public String orderHistory(@ModelAttribute("vo") UserVo vo, Model model) throws Exception {
		
		vo.setMainKey(sessSeq);
		
		List<User> list = service.selectList(vo);
		model.addAttribute("list", list);
		
		return "infra/user/user/history";
	}
	
	/**
	 * 등록상품 내역
	 * @param vo
	 * @param model
	 * @return String
	 * @throws Exception
	 */
	@RequestMapping (value = "regHistory")
	public String regHistory(@ModelAttribute("vo") UserVo vo, Model model) throws Exception {
		
		vo.setMainKey(sessSeq);
		
		List<User> list = service.selectListRegHistory(vo);
		model.addAttribute("list", list);
		
		return "infra/user/user/regHistory";
	}
	
	/**
	 * 회원정보 수정
	 * @param vo
	 * @param model
	 * @return String
	 * @throws Exception
	 */
	@RequestMapping (value = "form")
	public String userform(@ModelAttribute("vo") UserVo vo, Model model) throws Exception {
		
		vo.setMainKey(sessSeq);
		
		User item = service.selectOne(vo);
		model.addAttribute("item", item);
		
		return "infra/user/user/userForm";
	}
	
	/**
	 * 사용자 정보 수정 프로세스
	 * @param dto
	 * @return info redirect
	 * @throws Exception
	 */
	@RequestMapping (value = "updt")
	public String userUpdt(User dto) throws Exception {
		
		dto.setSeq(sessSeq);
		System.out.println(dto.getSeq());
		
		int result = service.userUpdt(dto);
		System.out.println("update result : " + result);
		
		return "redirect:info";
	}
	
	/**
	 * 장바구니
	 * @param vo
	 * @param model
	 * @return String
	 * @throws Exception
	 */
	@RequestMapping (value = "cart")
	public String selectListItemCart(@ModelAttribute("vo") UserVo vo, Model model) throws Exception {
		
		vo.setMainKey(sessSeq);
		
		List<User> list = service.selectListItemCart(vo);
		model.addAttribute("list", list);
		
		return "infra/user/user/cart";
	}
	
}
