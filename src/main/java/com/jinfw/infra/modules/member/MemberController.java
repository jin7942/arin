package com.jinfw.infra.modules.member;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.jinfw.infra.modules.code.Code;
import com.jinfw.infra.modules.code.CodeVo;

@Controller
@RequestMapping(value = "/member/")
public class MemberController {

	@Autowired
	MemberServiceImpl service;
	
	@RequestMapping(value = "login")
	public String login() throws Exception {

		return "infra/member/xdmin/loginForm";
	}

	/**
	 * member/memberList 접속시 실행되는 함수
	 * @param model
	 * @param vo
	 * @return memberList.jsp
	 * @throws Exception
	 */
	@RequestMapping(value = "memberList")
	public String memberList(@ModelAttribute("vo") MemberVo vo, Model model) throws Exception {

		int totalCnt = service.selectOneCount(vo);
		vo.setParamsPaging(totalCnt);

		List<Member> list = service.selectList(vo);

		model.addAttribute("list", list);
		model.addAttribute("totalCnt", totalCnt);

		return "infra/member/xdmin/memberList";
	}

    @RequestMapping(value = "memberForm")
    public String codeForm(@ModelAttribute("vo") CodeVo vo, Code dto, Model model) throws Exception {

        return "infra/member/xdmin/memberForm";
    }	
}
