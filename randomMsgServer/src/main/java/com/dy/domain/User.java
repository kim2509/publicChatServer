package com.dy.domain;

public class User {

	private long USER_NO;
	
	private String USER_ID;
	
	private String USER_NAME;
	
	private String NICKNAME;
	
	private String CREATE_DATE;
	
	private String LAST_LOGIN_DATE;
	
	private String SEX;
	
	private int AGE;

	public long getUSER_NO() {
		return USER_NO;
	}

	public void setUSER_NO(long uSER_NO) {
		USER_NO = uSER_NO;
	}

	public String getUSER_ID() {
		return USER_ID;
	}

	public void setUSER_ID(String uSER_ID) {
		USER_ID = uSER_ID;
	}

	public String getUSER_NAME() {
		return USER_NAME;
	}

	public void setUSER_NAME(String uSER_NAME) {
		USER_NAME = uSER_NAME;
	}

	public String getNICKNAME() {
		return NICKNAME;
	}

	public void setNICKNAME(String nICKNAME) {
		NICKNAME = nICKNAME;
	}

	public String getCREATE_DATE() {
		return CREATE_DATE;
	}

	public void setCREATE_DATE(String cREATE_DATE) {
		CREATE_DATE = cREATE_DATE;
	}

	public String getLAST_LOGIN_DATE() {
		return LAST_LOGIN_DATE;
	}

	public void setLAST_LOGIN_DATE(String lAST_LOGIN_DATE) {
		LAST_LOGIN_DATE = lAST_LOGIN_DATE;
	}

	public String getSEX() {
		return SEX;
	}

	public void setSEX(String sEX) {
		SEX = sEX;
	}

	public int getAGE() {
		return AGE;
	}

	public void setAGE(int aGE) {
		AGE = aGE;
	}
	
}
