package com.nearhere.domain;

public class UserSetting {
	private String userID;
	private String messagePushReceiveYN;
	private String replyPushReceiveYN;
	private String recommendPushReceiveYN;
	private String createdDate;
	public String getUserID() {
		return userID;
	}
	public void setUserID(String userID) {
		this.userID = userID;
	}
	public String getMessagePushReceiveYN() {
		return messagePushReceiveYN;
	}
	public void setMessagePushReceiveYN(String messagePushReceiveYN) {
		this.messagePushReceiveYN = messagePushReceiveYN;
	}
	public String getReplyPushReceiveYN() {
		return replyPushReceiveYN;
	}
	public void setReplyPushReceiveYN(String replyPushReceiveYN) {
		this.replyPushReceiveYN = replyPushReceiveYN;
	}
	public String getRecommendPushReceiveYN() {
		return recommendPushReceiveYN;
	}
	public void setRecommendPushReceiveYN(String recommendPushReceiveYN) {
		this.recommendPushReceiveYN = recommendPushReceiveYN;
	}
	public String getCreatedDate() {
		return createdDate;
	}
	public void setCreatedDate(String createdDate) {
		this.createdDate = createdDate;
	}
}