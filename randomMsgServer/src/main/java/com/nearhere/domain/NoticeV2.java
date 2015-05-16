package com.nearhere.domain;

public class NoticeV2 {
	private String noticeID;
	private String title;
	private String content;
	private String createdDate;
	private String type;
	private String landingURL;
	
	public String getNoticeID() {
		return noticeID;
	}
	public void setNoticeID(String noticeID) {
		this.noticeID = noticeID;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getCreatedDate() {
		return createdDate;
	}
	public void setCreatedDate(String createdDate) {
		this.createdDate = createdDate;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getLandingURL() {
		return landingURL;
	}
	public void setLandingURL(String landingURL) {
		this.landingURL = landingURL;
	}
}
