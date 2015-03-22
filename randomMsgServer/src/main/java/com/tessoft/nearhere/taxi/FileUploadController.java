package com.tessoft.nearhere.taxi;

import java.awt.Graphics2D;
import java.awt.image.BufferedImage;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.HashMap;

import javax.imageio.ImageIO;

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
				// 1. FileOutputStream ъ슜
				// byte[] fileData = file.getBytes();
				// FileOutputStream output = new FileOutputStream("C:/images/" + fileName);
				// output.write(fileData);

            	String rootPath = "/var/lib/tomcat7/webapps/ROOT";// System.getProperty("catalina.home");
				File dir = new File(rootPath + File.separator + "image");
				if (!dir.exists())
					dir.mkdirs();

				// 2. File ъ슜
				File file = new File( dir.getAbsolutePath() + File.separator + fileName);
				uploadfile.transferTo(file);

				String userID = fileName.replaceAll(".png", "");
				HashMap hash = new HashMap();
				hash.put("userID", userID );
				hash.put("profileImageURL", userID + ".png" );

				int result = sqlSession.update("com.tessoft.nearhere.taxi.updateUserProfileImage", hash );

				response.setData( result );

				logger.info( "RESPONSE: " + mapper.writeValueAsString(response) );

				BufferedImage originalImage = ImageIO.read( file );
				int type = originalImage.getType() == 0? BufferedImage.TYPE_INT_ARGB : originalImage.getType();
				BufferedImage thumbnailImage = resizeImage(originalImage, 320, type);
				
				File dirTh = new File(rootPath + File.separator + "thumbnail");
				if (!dirTh.exists())
					dirTh.mkdirs();
				
				ImageIO.write(thumbnailImage, "png", 
						new File(rootPath + File.separator + "thumbnail" + File.separator + fileName )); 

			} catch (IOException e) {
				logger.error( e );
				e.printStackTrace();
			} // try - catch
		} // if
		// 곗씠踰좎씠泥섎━瑜꾩옱 꾩튂먯꽌 泥섎━

		logger.info("uploadUserProfilePhoto.do end");

		return response; // 由ъ뒪붿껌쇰줈 蹂대궡쇳븯붾뜲 쇰떒 쒖쇅섍퀬 援ы쁽
	}
	
	private BufferedImage resizeImage(BufferedImage originalImage, int maxResolution, int type){
		
		int iWidth = originalImage.getWidth();
		int iHeight = originalImage.getHeight();
		
		int newWidth = iWidth ;
		int newHeight = iHeight ;
		float rate = 0.0f;

		//대吏媛濡몃줈 鍮꾩쑉留욊쾶 議곗젅
		if(iWidth > iHeight ){
			if(maxResolution < iWidth ){ 
				rate = maxResolution / (float) iWidth ; 
				newHeight = (int) (iHeight * rate); 
				newWidth = maxResolution; 
			}
		}else{
			if(maxResolution < iHeight ){
				rate = maxResolution / (float) iHeight ; 
				newWidth = (int) (iWidth * rate);
				newHeight = maxResolution;
			}
		}
		
		BufferedImage resizedImage = new BufferedImage( newWidth , newHeight, type);
		Graphics2D g = resizedImage.createGraphics();
		g.drawImage(originalImage, 0, 0, newWidth, newHeight, null);
		g.dispose();

		return resizedImage;
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
