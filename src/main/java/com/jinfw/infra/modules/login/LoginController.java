package com.jinfw.infra.modules.login;
/**
 * 로그인 모듈
 */

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
    
    public static String getSessionSeqCore(HttpServletRequest httpServletRequest) {
        HttpSession httpSession = httpServletRequest.getSession();
        String rtSeq = (String) httpSession.getAttribute("sessSeq");
        return rtSeq;
    }
    /**
     * 로그인 로그 기록 함수
     * @param Login dto
     * @param HttpServletRequest request
     * @param String seq
     * @throws Exception
     */
    public void loginLoger(Login dto, HttpServletRequest request, String seq) throws Exception {
        String ip = getClientIp(request);
        
        logger.info("=== Client Login ===");
        logger.info("=== Ip : " + ip);
        
        dto.setLoginLogMemberSeq(seq);
        dto.setLoginLogIp(ip);
        service.loginLogInsert(dto);
    }
    /**
     * 세션 부여 함수
     * @param Login rtMember
     * @param httpSession
     * @throws Exception
     */
    public void setSession(Login rtMember, HttpSession httpSession) throws Exception {
        httpSession.setMaxInactiveInterval(60 * Constants.SESSION_MINUTE); // 60second * 30 = 30minute
        httpSession.setAttribute("sessSeq", rtMember.getSeq());
        httpSession.setAttribute("sessId", rtMember.getMemberID());
        httpSession.setAttribute("sessName", rtMember.getMemberName());
        httpSession.setAttribute("sessPlace", rtMember.getMemberPlace());
    }
    
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
            // 로그인 로그 기록
            loginLoger(dto, request, rtMember.getSeq());
            // 세션부여
            setSession(rtMember, httpSession);

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
        httpSession.invalidate();
        returnMap.put("rt", "success");
        return returnMap;
    }

    
    /**
     * 카카오 로그인
     * @param code
     * @param dto
     * @param httpSession
     * @param model
     * @param redirectAttributes
     * @param request
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/login/kakao/oauth")
    public String loginWithKakao(String code, Login dto, HttpSession httpSession, Model model,
            RedirectAttributes redirectAttributes, HttpServletRequest request) throws Exception {

        Map<String, Object> returnMap = KakaoOauth.getUserInfoByToken(KakaoOauth.getAccessToken(code));

        dto.setMemberID(returnMap.get("id").toString());
        String memberName = returnMap.get("name").toString();
        String memberMailName = returnMap.get("mailName").toString();
        String memberMailDomain = returnMap.get("mailDomain").toString();

        Login rtMember = service.snsLogin(dto);

        if (rtMember == null) {
            // 회원가입
            dto.setMemberID(dto.getId());
            dto.setMemberName(memberName);
            dto.setMemberMailName(memberMailName);
            dto.setMemberMailDomain(memberMailDomain);
            dto.setType("1");

            service.snsInsert(dto);

            return "redirect:/index#about";
        } else {
            
            // 로그인 로그 기록
            loginLoger(dto, request, rtMember.getSeq());
            // 세션부여
            setSession(rtMember, httpSession);

            return "redirect:/main/";
        }

    }
    
    @RequestMapping(value = "/login/naver/oauth")
    @ResponseBody
    public Map<String, Object> naverLogin(Login dto, HttpSession httpSession, HttpServletRequest request) throws Exception{
        
        Map<String, Object> returnMap = new HashMap<String, Object>();
        Login rtMember = service.snsLogin(dto);
        
        if (rtMember != null) {
            // 로그인 로그 기록
            loginLoger(dto, request, rtMember.getSeq());
            // 세션부여
            setSession(rtMember, httpSession);
            returnMap.put("rt", "success");
        } else {
            // 회원가입
            service.snsInsert(dto);
            returnMap.put("rt", "fail");
        }
        return returnMap;
    }

}
