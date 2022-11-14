package com.jinfw.infra.modules.login;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.jinfw.infra.common.base.BaseController;
import com.jinfw.infra.common.constans.Constants;
import com.jinfw.infra.common.utill.KakaoOauth;
import com.jinfw.infra.modules.main.Main;
import com.jinfw.infra.modules.main.MainServiceImpl;

@Controller
@RequestMapping(value = "/")
public class LoginController extends BaseController {
    private static final Logger logger = LoggerFactory.getLogger(LoginController.class);

    @Autowired
    LoginServiceImpl service;

    @RequestMapping(value = "login")
    public String login() throws Exception {

        return "infra/login/xdmin/loginForm";
    }

    /**
     * 로그인 프로세스
     * 
     * @param dto
     * @param httpSession
     * @param request
     * @return Object
     * @throws Exception
     */
    @RequestMapping(value = "loginProc")
    @ResponseBody
    public Map<String, Object> loginProc(Login dto, HttpSession httpSession, HttpServletRequest request)
            throws Exception {

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
            logger.info("ip : " + getClientIp(request));
            
            // 로그인 로그 기록
            dto.setLoginLogMemberSeq(rtMember.getSeq());
            dto.setLoginLogIp(getClientIp(request));
            service.loginLogInsert(dto);

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
     * 
     * @param httpSession
     * @return Object
     * @throws Exception
     */
    @ResponseBody
    @RequestMapping(value = "logoutProc")
    public Map<String, Object> logoutProc(HttpSession httpSession) throws Exception {
        Map<String, Object> returnMap = new HashMap<String, Object>();
        /* UtilCookie.deleteCookie(); */
        httpSession.invalidate();
        returnMap.put("rt", "success");
        return returnMap;
    }

    public static String getSessionSeqCore(HttpServletRequest httpServletRequest) {
        HttpSession httpSession = httpServletRequest.getSession();
        String rtSeq = (String) httpSession.getAttribute("sessSeq");
        return rtSeq;
    }

    @RequestMapping(value = "/login/kakao/oauth")
    public String loginWithKakao(String code, Login dto, HttpSession httpSession, Model model,
            RedirectAttributes redirectAttributes, HttpServletRequest request) throws Exception {

        Map<String, Object> returnMap = KakaoOauth.getUserInfoByToken(KakaoOauth.getAccessToken(code));

        dto.setId(returnMap.get("id").toString());
        String memberName = returnMap.get("name").toString();
        String memberMailName = returnMap.get("mailName").toString();
        String memberMailDomain = returnMap.get("mailDomain").toString();

        Login rtMember = service.kakaoLogin(dto);

        if (rtMember == null) {
            // 회원가입
            dto.setMemberID(dto.getId());
            dto.setMemberName(memberName);
            dto.setMemberMailName(memberMailName);
            dto.setMemberMailDomain(memberMailDomain);

            service.kakaoInsert(dto);

            return "redirect:/index#about";
        } else {
            
            // 로그인 로그 기록
            dto.setSeq(rtMember.getSeq());
            dto.setLoginLogIp(getClientIp(request));
            service.loginLogInsert(dto);
            
            httpSession.setMaxInactiveInterval(60 * Constants.SESSION_MINUTE); // 60second * 30 = 30minute
            httpSession.setAttribute("sessSeq", rtMember.getSeq());
            httpSession.setAttribute("sessId", rtMember.getMemberID());
            httpSession.setAttribute("sessName", rtMember.getMemberName());
            httpSession.setAttribute("sessPlace", rtMember.getMemberPlace());

            return "redirect:/main/";
        }

    }

}
