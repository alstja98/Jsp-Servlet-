package com.mvc.dto;

import java.util.Date;

public class MyMVCDto {
	private int seq;
	private String Writer;
	private String title;
	private String content;
	private Date regdate;
	public MyMVCDto() {
		super();
		// TODO Auto-generated constructor stub
	}
	public MyMVCDto(int seq, String writer, String title, String content, Date regdate) {
		super();
		this.seq = seq;
		Writer = writer;
		this.title = title;
		this.content = content;
		this.regdate = regdate;
	}
	public int getSeq() {
		return seq;
	}
	public void setSeq(int seq) {
		this.seq = seq;
	}
	public String getWriter() {
		return Writer;
	}
	public void setWriter(String writer) {
		Writer = writer;
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
	public Date getRegdate() {
		return regdate;
	}
	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}
	
	
}
