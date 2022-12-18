package com.kn.entity;

import java.sql.Time;

public class Comment {
	private int uid;
	private String uname;
	private String avatar;
	private String time;
	private String content;
	
	
	public String getUname() {
		return uname;
	}
	public void setUname(String uname) {
		this.uname = uname;
	}
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
	public String getTime() {
		return time;
	}
	public void setTime(String time) {
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
		return "Comment [uid=" + uid + ", uname=" + uname + ", avatar=" + avatar + ", time=" + time + "\n    , content="
				+ content + "]";
	}
	
	
}
