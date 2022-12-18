package com.kn.entity;

import java.sql.Time;

public class Comment {
	private int uid;
	private String avatar;
	private Time time;
	private String content;
	
	public String getAvatar() {
		return avatar;
	}
	public void setAvatar(String avatar) {
		this.avatar = avatar;
	}
	public int getUid() {
		return uid;
	}
	public void setUid(int uid) {
		this.uid = uid;
	}
	public Time getTime() {
		return time;
	}
	public void setTime(Time time) {
		this.time = time;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	
	@Override
	public String toString() {
		return "Comment [uid=" + uid + ", avatar=" + avatar + ", time=" + time + "\n    , content=" + content + "]";
	}
	
	
}
