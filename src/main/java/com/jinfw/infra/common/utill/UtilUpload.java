package com.jinfw.infra.common.utill;

import java.io.File;
import java.util.UUID;

import org.springframework.web.multipart.MultipartFile;

import com.jinfw.infra.common.constans.Constants;
import com.jinfw.infra.modules.main.Main;


public class UtilUpload {

	public static void upload(MultipartFile multipartFile, String className, Main dto) throws Exception {
		String fileName = multipartFile.getOriginalFilename();
		String ext = fileName.substring(fileName.lastIndexOf(".") + 1);
		String uuid = UUID.randomUUID().toString();
		String uuidFileName = uuid + "." + ext;
		String pathModule = className;
		String nowString = UtilDateTime.nowString();
		String pathDate = nowString.substring(0, 4) + "/" + nowString.substring(5, 7) + "/" + nowString.substring(8, 10);
		String path = Constants.UPLOAD_PATH_PREFIX + "/" + pathModule + "/" + pathDate + "/";
		String pathForView = Constants.UPLOAD_PATH_PREFIX_FOR_VIEW + "/" + pathModule + "/" + pathDate + "/";

		createPath(path);
		System.out.println("save PATH : " + path);

		multipartFile.transferTo(new File(path + uuidFileName));

		dto.setPath(pathForView);
		dto.setOriginalName(fileName);
		dto.setUuidName(uuidFileName);
		dto.setExt(ext);
		dto.setSize(multipartFile.getSize());

	}

	public static void createPath(String path) {
		File uploadPath = new File(path);

		if (!uploadPath.exists()) {
			System.out.println("directory is doesn't exists !");
			uploadPath.mkdirs();
			System.out.println("create directory !");
		} else {
			// by pass
		}
	}
}