package com.tessoft.nearhere.taxi;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.apache.log4j.Logger;
import org.codehaus.jackson.map.ObjectMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.dy.common.FileDTO;
import com.nearhere.domain.APIResponse;

/**
 * Handles requests for the application file upload requests
 */
@Controller
public class FileUploadController {

	protected static Logger logger = Logger.getLogger(FileUploadController.class.getName());
	
	@Autowired
	private SqlSession sqlSession;
	ObjectMapper mapper = null;
	
	public FileUploadController() {
		// TODO Auto-generated constructor stub
		mapper = new ObjectMapper();
	}
	
	@RequestMapping(value = "/taxi/uploadUserProfilePhoto.do", method = RequestMethod.POST)
    public @ResponseBody APIResponse uploadUserProfilePhoto(FileDTO dto) {
		
		logger.info("uploadUserProfilePhoto.do start");
		APIResponse response = new APIResponse();
		
        MultipartFile uploadfile = dto.getFile();
        if (uploadfile != null) {
            String fileName = uploadfile.getOriginalFilename();
            dto.setFileName(fileName);
            try {
                // 1. FileOutputStream 사용
                // byte[] fileData = file.getBytes();
                // FileOutputStream output = new FileOutputStream("C:/images/" + fileName);
                // output.write(fileData);
                 
            	String rootPath = "E:\\wamp\\www";
				File dir = new File(rootPath + File.separator + "image");
				if (!dir.exists())
					dir.mkdirs();
				
                // 2. File 사용
                File file = new File( dir.getAbsolutePath() + File.separator + fileName);
                uploadfile.transferTo(file);
                
                String userID = fileName.replaceAll(".png", "");
                HashMap hash = new HashMap();
                hash.put("userID", userID );
                hash.put("profileImageURL", userID + ".png" );
                
                int result = sqlSession.update("com.tessoft.nearhere.taxi.updateUserProfileImage", hash );
                
                response.setData( result );
                
                logger.info( "RESPONSE: " + mapper.writeValueAsString(response) );
                
            } catch (IOException e) {
            	logger.error( e );
                e.printStackTrace();
            } // try - catch
        } // if
        // 데이터 베이스 처리를 현재 위치에서 처리
        
        logger.info("uploadUserProfilePhoto.do end");
        
        return response; // 리스트 요청으로 보내야하는데 일단 제외하고 구현
    }
	
	/**
	 * Upload single file using Spring Controller
	 */
	@RequestMapping(value = "/uploadFile.do", method = RequestMethod.POST)
	public @ResponseBody
	String uploadFileHandler(@RequestParam("name") String name,
			@RequestParam("file") MultipartFile file) {

		if (!file.isEmpty()) {
			try {
				byte[] bytes = file.getBytes();

				// Creating the directory to store file
				String rootPath = System.getProperty("catalina.home");
				File dir = new File(rootPath + File.separator + "tmpFiles");
				if (!dir.exists())
					dir.mkdirs();

				// Create the file on server
				File serverFile = new File(dir.getAbsolutePath()
						+ File.separator + name);
				BufferedOutputStream stream = new BufferedOutputStream(
						new FileOutputStream(serverFile));
				stream.write(bytes);
				stream.close();

				logger.info("Server File Location="
						+ serverFile.getAbsolutePath());

				return "You successfully uploaded file=" + name;
			} catch (Exception e) {
				return "You failed to upload " + name + " => " + e.getMessage();
			}
		} else {
			return "You failed to upload " + name
					+ " because the file was empty.";
		}
	}

	/**
	 * Upload multiple file using Spring Controller
	 */
	@RequestMapping(value = "/uploadMultipleFile", method = RequestMethod.POST)
	public @ResponseBody
	String uploadMultipleFileHandler(@RequestParam("name") String[] names,
			@RequestParam("file") MultipartFile[] files) {

		if (files.length != names.length)
			return "Mandatory information missing";

		String message = "";
		for (int i = 0; i < files.length; i++) {
			MultipartFile file = files[i];
			String name = names[i];
			try {
				byte[] bytes = file.getBytes();

				// Creating the directory to store file
				String rootPath = System.getProperty("catalina.home");
				File dir = new File(rootPath + File.separator + "tmpFiles");
				if (!dir.exists())
					dir.mkdirs();

				// Create the file on server
				File serverFile = new File(dir.getAbsolutePath()
						+ File.separator + name);
				BufferedOutputStream stream = new BufferedOutputStream(
						new FileOutputStream(serverFile));
				stream.write(bytes);
				stream.close();

				logger.info("Server File Location="
						+ serverFile.getAbsolutePath());

				message = message + "You successfully uploaded file=" + name
						+ "<br />";
			} catch (Exception e) {
				return "You failed to upload " + name + " => " + e.getMessage();
			}
		}
		return message;
	}
}
