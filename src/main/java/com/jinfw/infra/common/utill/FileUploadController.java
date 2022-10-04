package com.jinfw.infra.common.utill;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.UUID;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

@Controller
@RequestMapping("/sample/")
public class FileUploadController {

	// 파일 폼 매핑
	@RequestMapping(value = "fileUploadForm")
	public String fileForm(Locale locale, Model model) {
		return "infra/temp/fileUpload";
	}

	// 파일 등록 매핑
	@RequestMapping(value = "upload")
	@ResponseBody
	public Map<String, Object> upload(MultipartHttpServletRequest files) {
		
		System.out.println("req in here! : /sample/upload");
		
		Map<String, Object> returnMap = new HashMap<String, Object>();
		
		String filePath = "D:/factory/ws_sts_4151/arin/src/main/webapp/resources/img";	// 저장 경로
		File Folder = new File(filePath);
		List<MultipartFile> list = files.getFiles("files");
		
		System.out.println("list size : " + list.size());
		if (list.size() == 0) {
			returnMap.put("rt", "false");
			return returnMap;
		}
		
		// 폴더가 존재하지 않으면
		if (!Folder.exists()) {
			try {
				// 폴더 생성
				Folder.mkdir(); 
				System.out.println("폴더가 생성되었습니다.");
			} catch (Exception e) {
				e.getStackTrace();
			}
		} else {
			// by pass
		}

		for (int i = 0; i < list.size(); i++) {
			String fileRealName = list.get(i).getOriginalFilename();
			String fileExtension = fileRealName.substring(fileRealName.lastIndexOf("."), fileRealName.length());
			long size = list.get(i).getSize();

			System.out.println("파일명 :" + fileRealName);
			System.out.println("사이즈" + size);

			UUID uuid = UUID.randomUUID();
			System.out.println(uuid.toString());
			String[] uuids = uuid.toString().split("-");

			String uniqueName = uuids[0];
			System.out.println("생성된 고유문자열" + uniqueName);
			System.out.println("확장자명" + fileExtension);

			File saveFile = new File(filePath + "\\" + uniqueName + fileExtension);
			try {
				list.get(i).transferTo(saveFile);
			} catch (IllegalStateException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}
			
		}
		
		returnMap.put("rt", "success");
		
		return returnMap;
	}
}
