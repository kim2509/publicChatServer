package com.nearhere.domain;

import java.util.List;

import org.codehaus.jackson.annotate.JsonIgnoreProperties;

@JsonIgnoreProperties(ignoreUnknown = true)
public class Post {

	private String postID;
	
	private String fromLatitude;
	private String fromLongitude;
	private String fromAddress;
	
	private String latitude;
	private String longitude;
	private String toAddress;
	private String region;
	
	private String message;
	private String content;
	
	private User user;
	
	private String createdDate;
	private String deletedDate;
	
	private String reward;
	
	private String sexInfo;
	private String numOfUsers;
	private String departureDate;
	private String departureTime;
	
	private String departureDateTime;
	
	private String fromDistance;
	private String toDistance;
	private String status;
	
	private boolean bPushOff;
	
	private List<PostLike> postLikes;
	private List<PostReply> postReplies;
	
	private int replyCount = 0;
	
	public String getLatitude() {
		return latitude;
	}
	public void setLatitude(String latitude) {
		this.latitude = latitude;
	}
	public String getLongitude() {
		return longitude;
	}
	public void setLongitude(String longitude) {
		this.longitude = longitude;
	}
	public String getMessage() {
		return message;
	}
	public void setMessage(String message) {
		this.message = message;
	}
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user= user;
	}
	public String getPostID() {
		return postID;
	}
	public void setPostID(String postID) {
		this.postID = postID;
	}
	public String getCreatedDate() {
		return createdDate;
	}
	public void setCreatedDate(String createdDate) {
		this.createdDate = createdDate;
	}
	public List<PostLike> getPostLikes() {
		return postLikes;
	}
	public void setPostLikes(List<PostLike> postLikes) {
		this.postLikes = postLikes;
	}
	public List<PostReply> getPostReplies() {
		return postReplies;
	}
	public void setPostReplies(List<PostReply> postReplies) {
		this.postReplies = postReplies;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getReward() {
		return reward;
	}
	public void setReward(String reward) {
		this.reward = reward;
	}
	public String getFromLatitude() {
		return fromLatitude;
	}
	public void setFromLatitude(String fromLatitude) {
		this.fromLatitude = fromLatitude;
	}
	public String getFromLongitude() {
		return fromLongitude;
	}
	public void setFromLongitude(String fromLongitude) {
		this.fromLongitude = fromLongitude;
	}
	public int getReplyCount() {
		return replyCount;
	}
	public void setReplyCount(int replyCount) {
		this.replyCount = replyCount;
	}
	public String getFromAddress() {
		return fromAddress;
	}
	public void setFromAddress(String fromAddress) {
		this.fromAddress = fromAddress;
	}
	public String getToAddress() {
		return toAddress;
	}
	public void setToAddress(String toAddress) {
		this.toAddress = toAddress;
	}
	public String getSexInfo() {
		return sexInfo;
	}
	public void setSexInfo(String sexInfo) {
		this.sexInfo = sexInfo;
	}
	public String getNumOfUsers() {
		return numOfUsers;
	}
	public void setNumOfUsers(String numOfUsers) {
		this.numOfUsers = numOfUsers;
	}
	public String getDeletedDate() {
		return deletedDate;
	}
	public void setDeletedDate(String deletedDate) {
		this.deletedDate = deletedDate;
	}
	public String getDepartureDate() {
		return departureDate;
	}
	public void setDepartureDate(String departureDate) {
		this.departureDate = departureDate;
	}
	public String getDepartureTime() {
		return departureTime;
	}
	public void setDepartureTime(String departureTime) {
		this.departureTime = departureTime;
	}
	public String getFromDistance() {
		return fromDistance;
	}
	public void setFromDistance(String fromDistance) {
		this.fromDistance = fromDistance;
	}
	public String getToDistance() {
		return toDistance;
	}
	public void setToDistance(String toDistance) {
		this.toDistance = toDistance;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getDepartureDateTime() {
		return departureDateTime;
	}
	public void setDepartureDateTime(String departureDateTime) {
		this.departureDateTime = departureDateTime;
	}
	public boolean isbPushOff() {
		return bPushOff;
	}
	public void setbPushOff(boolean bPushOff) {
		this.bPushOff = bPushOff;
	}
	public String getRegion() {
		return region;
	}
	public void setRegion(String region) {
		this.region = region;
	}
}
