package com.jinfw.infra.common.utill;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;

public class UtilParser {
    
    public static JSONObject stringToJson(String str) throws Exception {
        
        JSONParser jsonParser = new JSONParser();
        Object obj = jsonParser.parse(str);
      
        return (JSONObject) obj;
    }
    
    
}
