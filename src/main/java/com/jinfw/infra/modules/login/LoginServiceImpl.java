package com.jinfw.infra.modules.login;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import com.jinfw.infra.common.utill.UtilClient;
import com.jinfw.infra.common.utill.UtilSecurity;

@Service
public class LoginServiceImpl implements LoginService {

    @Autowired
    LoginDao dao;

    
    @Override
    public void logInsert(Login dto) throws Exception {
        HttpServletRequest request = ((ServletRequestAttributes)RequestContextHolder.currentRequestAttributes()).getRequest();
        
        dto.setClientIp(UtilClient.getClientIp(request));
        dto.setClientDevice(UtilClient.getClientDevice(request));
        dto.setClientReqUri(request.getRequestURI());
        dao.logInsert(dto);
    }

    /**
     * 로그인
     */
    @Override
    public Login selectOneId(Login dto) throws Exception {
        dto.setMemberPW(UtilSecurity.encryptSha256(dto.getMemberPW()));

        return dao.selectOneId(dto);
    }

    @Override
    public Login snsLogin(Login dto) throws Exception {
        return dao.snsLogin(dto);
    }

    @Override
    public int snsInsert(Login dto) throws Exception {
        return dao.snsInsert(dto);
    }
    
    @Override
    public int loginLogInsert(Login dto) throws Exception {
        return dao.loginLogInsert(dto);
    }
    
}
