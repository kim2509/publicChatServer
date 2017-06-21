package com.tessoft.nearhere;

import java.awt.Graphics2D;
import java.awt.image.BufferedImage;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.sql.Date;
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

import com.dy.common.Constants;
import com.dy.common.ErrorCode;
import com.dy.common.FileDTO;
import com.dy.common.UploadImageDTO;
import com.dy.common.Util;
import com.nearhere.domain.APIResponse;
import com.nearhere.domain.User;

import common.CafeBiz;

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

				String rootPath = "";
				if ( Constants.bReal )
					rootPath = "/var/lib/tomcat7/webapps/ROOT";
				else
					rootPath = "D:\\wamp\\www";
				
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
				User user = new User();
				user.setUserID( userID );
				user = sqlSession.selectOne("com.tessoft.nearhere.taxi.selectUser", user );
				
				String profilePoint = sqlSession.selectOne("com.tessoft.nearhere.taxi.selectProfilePoint", user);
				if ( profilePoint == null || "".equals( profilePoint ) )
					profilePoint = "0";
				user.setProfilePoint(profilePoint);
				
				response.setData2( user );

				logger.info( "RESPONSE: " + mapper.writeValueAsString(response) );

				BufferedImage originalImage = ImageIO.read( file );
				int type = originalImage.getType() == 0? BufferedImage.TYPE_INT_ARGB : originalImage.getType();
				BufferedImage thumbnailImage = resizeImage(originalImage, 320, type);
				
				File dirTh = new File(rootPath + File.separator + "thumbnail");
				
				if (!dirTh.exists())
					dirTh.mkdirs();
				
				ImageIO.write(thumbnailImage, "png", 
						new File(rootPath + File.separator + "thumbnail" + File.separator + fileName )); 

			} catch (Exception e) {
//				logger.error( e );
				e.printStackTrace();
				
				response.setResCode(ErrorCode.IMAGE_UPLOAD_ERROR );
				response.setResMsg("이미지 업로드중 오류");
				
			} // try - catch
		} // if
		// 데이터 베이스 처리를 현재 위치에서 처리

		logger.info("uploadUserProfilePhoto.do end");

		return response; // 리스트 요청으로 보내야하는데 일단 제외하고 구현
	}
	
	@SuppressWarnings({ "rawtypes", "unchecked" })
	@RequestMapping(value = "/cafe/uploadImageFile.do", method = RequestMethod.POST)
	public @ResponseBody APIResponse uploadImageFile(UploadImageDTO request) {

		logger.info("uploadImageFile.do start");
		APIResponse response = new APIResponse();

		MultipartFile uploadfile = (MultipartFile) request.getFile();
		if (uploadfile != null) {

			String fileName = "";//uploadfile.getOriginalFilename();
			
			try {

				String rootPath = "";
				if ( Constants.bReal )
					rootPath = "/var/lib/tomcat7/webapps/ROOT";
				else
					rootPath = "D:\\wamp\\www";
				
				String relativePath = "cafe_image" + File.separator + Util.getNow("yyyyMMdd");
				
				File dir = new File(rootPath + File.separator + relativePath );
				if (!dir.exists())
					dir.mkdirs();

				File file = null;
				// 동일 파일명일 경우 다시 파일명 생성
				while( true )
				{
					java.util.Date d = new java.util.Date();
					fileName = Util.getRandomSeed() + String.valueOf(d.getTime()) + ".png";
					
					// 2. File 사용
					file = new File( dir.getAbsolutePath() + File.separator + fileName);
					
					if ( file.exists() )
						continue;
					
					uploadfile.transferTo(file);
					break;
				}

				HashMap param = new HashMap();
				param.put("imageName", "이미지 이름");
				param.put("url1", Constants.getServerURL() + "/" + relativePath + "/" + fileName );
				param.put("serverPath", file.getAbsolutePath() );
				
				CafeBiz.getInstance(sqlSession).insertCafeImageRow(param);

				response.setData( param );
				
				logger.info( "RESPONSE: " + mapper.writeValueAsString(response) );

			} catch (Exception e) {

				logger.error( e );
				
				response.setResCode(ErrorCode.IMAGE_UPLOAD_ERROR );
				response.setResMsg("이미지 업로드중 오류");
				
			}
		}

		logger.info("uploadImageFile.do end");

		return response; // 리스트 요청으로 보내야하는데 일단 제외하고 구현
	}
	
	private BufferedImage resizeImage(BufferedImage originalImage, int maxResolution, int type){
		
		int iWidth = originalImage.getWidth();
		int iHeight = originalImage.getHeight();
		
		int newWidth = iWidth ;
		int newHeight = iHeight ;
		float rate = 0.0f;

		//이미지의 가로 세로 비율에 맞게 조절
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
