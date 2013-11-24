package com.dy.domain;

public class ChatMessage {

	private int chatID;
	private long roomID;
	private String msg;
	private String sender;
	private String createDate;
	public long getRoomID() {
		return roomID;
	}
	public void setRoomID(long roomID) {
		this.roomID = roomID;
	}
	public String getMsg() {
		return msg;
	}
	public void setMsg(String msg) {
		this.msg = msg;
	}
	public String getCreateDate() {
		return createDate;
	}
	public void setCreateDate(String createDate) {
		this.createDate = createDate;
	}
	public String getSender() {
		return sender;
	}
	public void setSender(String sender) {
		this.sender = sender;
	}
	public int getChatID() {
		return chatID;
	}
	public void setChatID(int chatID) {
		this.chatID = chatID;
	}
}
