package com.nearhere.domain;

import java.util.List;

import org.codehaus.jackson.annotate.JsonIgnoreProperties;
import org.codehaus.jackson.annotate.JsonIgnoreType;

@JsonIgnoreProperties(ignoreUnknown = true)
public class Post {

	private String postID;
	
	private String fromLatitude;
	private String fromLongitude;
	private String fromAddress;
	
	private String latitude;
	private String longitude;
	private String toAddress;
	
	private String message;
	private String content;
	
	private User user;
	
	private String distance;
	private String createdDate;
	
	private String reward;
	
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
	public String getDistance() {
		return distance;
	}
	public void setDistance(String distance) {
		this.distance = distance;
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
}
