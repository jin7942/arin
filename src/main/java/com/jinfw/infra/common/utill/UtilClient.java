package com.jinfw.infra.common.utill;

import javax.servlet.http.HttpServletRequest;

public class UtilClient {

    /**
     * 클라이언트 ip 조회 함수
     * 
     * @param request
     * @return ip 문자열
     */
    public static String getClientIp(HttpServletRequest request) {
        String ip = null;
        ip = request.getHeader("X-Forwarded-For");
        if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
            ip = request.getHeader("Proxy-Client-IP");
        }
        if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
            ip = request.getHeader("WL-Proxy-Client-IP");
        }
        if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
            ip = request.getHeader("HTTP_CLIENT_IP");
        }
        if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
            ip = request.getHeader("HTTP_X_FORWARDED_FOR");
        }
        if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
            ip = request.getHeader("X-Real-IP");
        }
        if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
            ip = request.getHeader("X-RealIP");
        }
        if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
            ip = request.getHeader("REMOTE_ADDR");
        }
        if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
            ip = request.getRemoteAddr();
        }
        return ip;
    }
    
    /**
     * 클라이언트 디바이스 조회
     * @param request
     * @return 브라우저 이름 문자열
     */
    public static String getClientDevice(HttpServletRequest request) {
        String headerStr = request.getHeader("User-Agent").toUpperCase();
        String browser = "";

        if (headerStr.indexOf("TRIDENT") > -1 || headerStr.indexOf("MSIE") > -1) { // IE

            if (headerStr.indexOf("TRIDENT/7") > -1) {
                browser = "IE 11";
            } else if (headerStr.indexOf("TRIDENT/6") > -1) {
                browser = "IE 10";
            } else if (headerStr.indexOf("TRIDENT/5") > -1) {
                browser = "IE 9";
            } else if (headerStr.indexOf("TRIDENT/4") > -1) {
                browser = "IE 8";
            } else if (headerStr.indexOf("EDG") > -1 || headerStr.indexOf("EDGE") > -1) {
                browser = "IE Edge";
            }

        } else if (headerStr.indexOf("WHALE") > -1) { // 네이버 WHALE
            browser = "Whale";
        } else if (headerStr.indexOf("OPERA") > -1 || headerStr.indexOf("OPR") > -1) { // 오페라
            browser = "Opera";
        } else if (headerStr.indexOf("FIREFOX") > -1) { // 파이어폭스
            browser = "Firefox";
        } else if (headerStr.indexOf("SAFARI") > -1 && headerStr.indexOf("CHROME") == -1) { // 사파리
            browser = "Safari";
        } else if (headerStr.indexOf("CHROME") > -1) { // 크롬
            browser = "Chrome";
        } else {
            browser = "Other";
        }

        return browser;
    }
    


}
