package com.dy.common;

import org.springframework.web.multipart.MultipartFile;

public class UploadImageDTO {
    private String requestInfo;
    private MultipartFile file;
 
    public UploadImageDTO()
    {
    	
    }

	public String getRequestInfo() {
		return requestInfo;
	}

	public void setRequestInfo(String requestInfo) {
		this.requestInfo = requestInfo;
	}

	public MultipartFile getFile() {
		return file;
	}

	public void setFile(MultipartFile file) {
		this.file = file;
	}
}