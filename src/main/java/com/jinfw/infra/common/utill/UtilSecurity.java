package com.jinfw.infra.common.utill;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

/**
 * 암호화
 */
public class UtilSecurity {

	public static String encryptSha256(String text) throws NoSuchAlgorithmException {
        MessageDigest md = MessageDigest.getInstance("SHA-256");
        md.update(text.getBytes());

        return bytesToHex(md.digest());
    }

    private static  String bytesToHex(byte[] bytes) {
        StringBuilder builder = new StringBuilder();
        for (byte b : bytes) {
            builder.append(String.format("%02x", b));
        }
        return builder.toString();
    }
	
}
