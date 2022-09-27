package com.jinfw.infra.modules.member;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.jinfw.infra.common.constans.Constants;

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
	 * 로그인 프로세스
	 * @param dto
	 * @param httpSession
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "loginProc")
	@ResponseBody
	public Map<String, Object> loginProc(Member dto, HttpSession httpSession) throws Exception {
		
		Map<String, Object> returnMap = new HashMap<String, Object>();

		Member rtMember = service.selectOneId(dto);
		System.out.println(rtMember);

		if (rtMember != null) {
			System.out.println(rtMember.getMemberID());
			System.out.println(rtMember.getMemberPW( ));

			httpSession.setMaxInactiveInterval(60 * Constants.SESSION_MINUTE); // 60second * 30 = 30minute
			httpSession.setAttribute("sessSeq", rtMember.getSeq());
			httpSession.setAttribute("sessId", rtMember.getMemberID());
			httpSession.setAttribute("sessName", rtMember.getMemberName());

			returnMap.put("rt", "success");
		} else {
			returnMap.put("rt", "fail");
		}
		return returnMap;
	}

	/**
	 * member/memberList 접속시 실행되는 함수
	 * 
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

}
