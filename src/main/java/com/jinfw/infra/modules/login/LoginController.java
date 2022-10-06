package com.jinfw.infra.modules.login;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.jinfw.infra.common.constans.Constants;

@Controller
@RequestMapping(value = "/")
public class LoginController {
	private static final Logger logger = LoggerFactory.getLogger(LoginController.class);
	
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
	 * @param request
	 * @return Object
	 * @throws Exception
	 */
	@RequestMapping(value = "loginProc")
	@ResponseBody
	public Map<String, Object> loginProc(Login dto, HttpSession httpSession, HttpServletRequest request) throws Exception {
		
		Map<String, Object> returnMap = new HashMap<String, Object>();

		Login rtMember = service.selectOneId(dto);
		
		if (rtMember != null) {
			logger.info("===== client login =====");
			logger.info("client name : " + rtMember.getMemberID());
			logger.info("method : " + request.getMethod());
			logger.info("protocol : " + request.getProtocol());
			logger.info("request uri : " + request.getRequestURI());
			logger.info("request url: " + request.getRequestURL());
			logger.info("port : " + request.getLocalPort());
			
			httpSession.setMaxInactiveInterval(60 * Constants.SESSION_MINUTE); // 60second * 30 = 30minute
			httpSession.setAttribute("sessSeq", rtMember.getSeq());
			httpSession.setAttribute("sessId", rtMember.getMemberID());
			httpSession.setAttribute("sessName", rtMember.getMemberName());
			httpSession.setAttribute("sessPlace", rtMember.getMemberPlace());
			httpSession.setAttribute("sessitemCartCount", rtMember.getItemCartCount());

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
