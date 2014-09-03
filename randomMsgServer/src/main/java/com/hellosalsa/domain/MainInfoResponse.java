package com.hellosalsa.domain;

import java.util.HashMap;
import java.util.List;

@SuppressWarnings("rawtypes")
public class MainInfoResponse {

	private String resCode = "0000";
	private String resMessage = "";

	private List<HashMap> userList = null;
	public String getResCode() {
		return resCode;
	}
	public void setResCode(String resCode) {
		this.resCode = resCode;
	}
	public String getResMessage() {
		return resMessage;
	}
	public void setResMessage(String resMessage) {
		this.resMessage = resMessage;
	}
	public List<HashMap> getUserList() {
		return userList;
	}
	public void setUserList(List<HashMap> userList) {
		this.userList = userList;
	}
}
