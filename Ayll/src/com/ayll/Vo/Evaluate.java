package com.ayll.Vo;

public class Evaluate {
	
	private String id = null ;
	private String content = null;
	private String clientName = null;
	private String level;
	private String date;
	
	public Evaluate(){
		
	}
	
	public Evaluate(String id, String clientName, String level, String content, String date) {
		this.id = id;
		this.content = content;
		this.clientName = clientName;
		this.level = level;
		this.date = date;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getClientName() {
		return clientName;
	}

	public void setClientID(String clientName) {
		this.clientName = clientName;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getLevel() {
		return level;
	}

	public void setLevel(String level) {
		this.level = level;
	}

	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}
}
