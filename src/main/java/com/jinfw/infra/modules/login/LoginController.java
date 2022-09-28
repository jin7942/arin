package com.jinfw.infra.modules.login;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.jinfw.infra.common.constans.Constants;

@Controller
@RequestMapping(value = "/")
public class LoginController {

	@Autowired
	LoginServiceImpl service;
	
	@RequestMapping(value = "login")
	public String login() throws Exception {

		return "infra/login/xdmin/loginForm";
	}

	/**
	 * 로그인 프로세스
	 * @param dto
	 * @param httpSession
	 * @return Object
	 * @throws Exception
	 */
	@RequestMapping(value = "loginProc")
	@ResponseBody
	public Map<String, Object> loginProc(Login dto, HttpSession httpSession) throws Exception {
		
		Map<String, Object> returnMap = new HashMap<String, Object>();

		Login rtMember = service.selectOneId(dto);
		System.out.println(rtMember);

		if (rtMember != null) {
			System.out.println(rtMember.getMemberID());
			System.out.println(rtMember.getMemberPW());
			System.out.println(rtMember.getMemberPlace());

			httpSession.setMaxInactiveInterval(60 * Constants.SESSION_MINUTE); // 60second * 30 = 30minute
			httpSession.setAttribute("sessSeq", rtMember.getSeq());
			httpSession.setAttribute("sessId", rtMember.getMemberID());
			httpSession.setAttribute("sessName", rtMember.getMemberName());
			httpSession.setAttribute("sessPlace", rtMember.getMemberPlace());

			returnMap.put("rt", "success");
		} else {
			returnMap.put("rt", "fail");
		}
		return returnMap;
	}
	
	/**
	 * 로그아웃 프로세스
	 * @param httpSession
	 * @return Object
	 * @throws Exception
	 */
	@ResponseBody
	@RequestMapping(value = "logoutProc")
	public Map<String, Object> logoutProc(HttpSession httpSession) throws Exception {
		Map<String, Object> returnMap = new HashMap<String, Object>();
		/*UtilCookie.deleteCookie();*/
		httpSession.invalidate();
		returnMap.put("rt", "success");
		return returnMap;
	}
	
	public static String getSessionSeqCore(HttpServletRequest httpServletRequest) {
		HttpSession httpSession =  httpServletRequest.getSession();
		String rtSeq = (String) httpSession.getAttribute("sessSeq");
		return rtSeq;
	}

}
