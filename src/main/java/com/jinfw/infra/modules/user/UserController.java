package com.jinfw.infra.modules.user;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.jinfw.infra.modules.code.CodeVo;
import com.jinfw.infra.modules.login.LoginController;

@Controller
@RequestMapping (value = "/user/")
public class UserController {
	
	@Autowired
	UserServiceImpl service;
	
	String sessSeq = "";
	
   public void setSearchAndPaging(UserVo vo, int totalCnt) throws Exception {
    
        vo.setParamsPaging(totalCnt);
    }
	
	public void setMainKey(UserVo vo, HttpServletRequest httpServletRequest) {
		sessSeq = LoginController.getSessionSeqCore(httpServletRequest);
		vo.setMainKey(sessSeq);
	}
	
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
		
		setMainKey(vo, httpServletRequest);
		
		User item = service.selectOne(vo);
		model.addAttribute("item", item);
		
		return "infra/user/user/userInfo";
	}
	
	/**
	 * 구매내역
	 * @param vo
	 * @param model
	 * @return String
	 * @throws Exception
	 */
	@RequestMapping (value = "history")
	public String orderHistory(@ModelAttribute("vo") UserVo vo, Model model, HttpServletRequest httpServletRequest) throws Exception {
		
		setMainKey(vo, httpServletRequest);
		
		int cnt = service.selectHistoryCount(vo);
		List<User> list = service.selectList(vo);
		setSearchAndPaging(vo, cnt);
		
		model.addAttribute("cnt", cnt);
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
	public String regHistory(@ModelAttribute("vo") UserVo vo, Model model, HttpServletRequest httpServletRequest) throws Exception {
		
		setMainKey(vo, httpServletRequest);
		
		int cnt = service.selectRegHistoryCount(vo);
		List<User> list = service.selectListRegHistory(vo);
		setSearchAndPaging(vo, cnt);
		model.addAttribute("list", list);
		model.addAttribute("cnt", cnt);
		
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
	public String userform(@ModelAttribute("vo") UserVo vo, Model model, HttpServletRequest httpServletRequest) throws Exception {
		
		setMainKey(vo, httpServletRequest);
		
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
	public String selectListItemCart(@ModelAttribute("vo") UserVo vo, Model model, HttpServletRequest httpServletRequest) throws Exception {
		
		setMainKey(vo, httpServletRequest);
		
		List<User> list = service.selectListItemCart(vo);
		model.addAttribute("list", list);
		
		return "infra/user/user/cart";
	}
	
	@RequestMapping (value = "itemCartCount")
	@ResponseBody
	public Map<String, Object> selectOneCount(@ModelAttribute("vo") UserVo vo, Model model, HttpServletRequest httpServletRequest) throws Exception {

		setMainKey(vo, httpServletRequest);

		Map<String, Object> returnMap = new HashMap<String, Object>();
		int result = service.selectOneCount(vo);
		
		if (result != 0) {
		    returnMap.put("cnt", result);
		} else {
		    returnMap.put("cnt", 0);
		}
		return returnMap;
	}
	
	@RequestMapping (value = "deleteCartItem")
	@ResponseBody
	public Map<String, Object> deleteCartItem(@ModelAttribute("vo") UserVo vo, Model model, HttpServletRequest httpServletRequest) throws Exception {
		
		setMainKey(vo, httpServletRequest);
		
		Map<String, Object> returnMap = new HashMap<String, Object>();
		int result = service.deleteCartItem(vo);
		System.out.println("delete result : " + result);
		
		if (result > 0) {
			returnMap.put("rt", "success");
		} else {
			returnMap.put("rt", "fail");
		}
		
		return returnMap;
	}
	
}
