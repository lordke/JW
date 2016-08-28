package com.students.util;

import java.util.ArrayList;

public class Posts {
	private int id;
	private String title;
	private String author;
	private String post;
	private ArrayList<Msg> msgs;
	
	

	public ArrayList<Msg> getMsgs() {
		return msgs;
	}
	public void setMsgs(ArrayList<Msg> msgs) {
		this.msgs = msgs;
	}
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getAuthor() {
		return author;
	}
	public void setAuthor(String author) {
		this.author = author;
	}
	public String getPost() {
		return post;
	}
	public void setPost(String post) {
		this.post = post;
	}
	

}
