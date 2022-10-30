package com.jinfw.infra.modules.main;

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
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.jinfw.infra.modules.login.LoginController;

@Controller
@RequestMapping(value = "/main/")
public class MainController {

	@Autowired
	MainServiceImpl service;

	public String sessSeq;

	public void setSearchAndPaging(MainVo vo, int totalCnt) throws Exception {
		vo.setParamsPaging(totalCnt);
	}

	/**
	 * 메인 상품 리스트
	 * 
	 * @param vo
	 * @param model
	 * @param httpServletRequest
	 * @return String
	 * @throws Exception
	 */
	@RequestMapping(value = "")
	public String main(@ModelAttribute("vo") MainVo vo, Model model, HttpServletRequest httpServletRequest)
			throws Exception {

		sessSeq = LoginController.getSessionSeqCore(httpServletRequest);
		vo.setMainKey(sessSeq);
		System.out.println("mainKey : " + vo.getMainKey());

		List<Main> list = service.selectList(vo);

		model.addAttribute("list", list);

		return "infra/main/user/main";
	}

	@RequestMapping(value = "getList")
	@ResponseBody
	public Map<String, Object> getList(@ModelAttribute("vo") MainVo vo) throws Exception {

		Map<String, Object> returnMap = new HashMap<String, Object>();
		int totalCnt = service.selectOneCount(vo);
		setSearchAndPaging(vo, totalCnt);

		if (!(vo.getThisPage() >= vo.getTotalPages() + 1)) {
			List<Main> list = service.selectList(vo);

			if (list != null && totalCnt != 0) {
				returnMap.put("data", list);
				returnMap.put("rt", "success");
			} else {
				returnMap.put("rt", "fail");
			}
		}
		
		return returnMap;
	}

	/**
	 * 회원가입
	 * 
	 * @param dto
	 * @param model
	 * @return String
	 * @throws Exception
	 */
	@RequestMapping(value = "userInst")
	public String signUp(Main dto, Model model) throws Exception {
		System.out.println("userInst!!!!!");
		int result = service.insert(dto);
		System.out.println("result : " + result);

		return "redirect:/index#about";
	}

	/**
	 * 회원가입폼
	 * 
	 * @param dto
	 * @param model
	 * @return String
	 * @throws Exception
	 */
	@RequestMapping(value = "signUp")
	public String signUpForm(Main dto, Model model) throws Exception {

		return "infra/main/user/signUpForm";
	}

	/**
	 * ID 중복체크
	 * 
	 * @param dto
	 * @return Map Object
	 * @throws Exception
	 */
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

	/**
	 * 상품 상세페이지
	 * 
	 * @param vo
	 * @param model
	 * @return String
	 * @throws Exception
	 */
	@RequestMapping(value = "view")
	public String view(@ModelAttribute("vo") MainVo vo, Main dto, Model model) throws Exception {

		System.out.println("mainKey : " + vo.getMainKey());

		Main item = service.selectOne(vo);
		List<Main> list = service.selectListItemImg(vo);
		List<Main> listRecommend = service.selectListRecommend();

		model.addAttribute("item", item);
		model.addAttribute("list", list);
		model.addAttribute("listRecommend", listRecommend);

		return "infra/main/user/mainView";
	}

	// 상품등록 폼
	@RequestMapping(value = "form")
	public String mainForm(@ModelAttribute("vo") MainVo vo, Model model) throws Exception {

		return "infra/main/user/mainForm";
	}

	/**
	 * 상품등록 프로세스
	 * 
	 * @param vo
	 * @param dto
	 * @param redirectAttributes
	 * @return view result
	 * @throws Exception
	 */
	@RequestMapping(value = "itemInst")
	public String itemInst(MainVo vo, Main dto, RedirectAttributes redirectAttributes) throws Exception {
		service.itemInst(dto);

		vo.setMainKey(dto.getItemSeq());
		redirectAttributes.addFlashAttribute("vo", vo);

		return "redirect:view";
	}

	/**
	 * 상품구매
	 * 
	 * @param vo
	 * @return Map Object
	 * @throws Exception
	 */
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
	
	@RequestMapping("/insertItemCart")
	@ResponseBody
	public Map<String, Object> insertItemCart(MainVo vo) throws Exception {

		Map<String, Object> returnMap = new HashMap<String, Object>();

		int cnt = service.selectOneCartCount(vo);

		if (cnt == 0) {
			service.insertItemCart(vo);
			returnMap.put("rt", "success");
		} else {
			returnMap.put("rt", "fail");
		}

		return returnMap;
	}

}
