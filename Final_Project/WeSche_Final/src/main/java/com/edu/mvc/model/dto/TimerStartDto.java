package com.edu.mvc.model.dto;

import java.util.Date;

public class TimerStartDto {
	
	
	private int startno;
	private String memberid;
	private Date start_t;
	
	
	public TimerStartDto() {
		super();
		// TODO Auto-generated constructor stub
	}


	public int getStartno() {
		return startno;
	}


	public void setStartno(int startno) {
		this.startno = startno;
	}


	public String getMemberid() {
		return memberid;
	}


	public void setMemberid(String memberid) {
		this.memberid = memberid;
	}


	public Date getStart_t() {
		return start_t;
	}


	public void setStart_t(Date start_t) {
		this.start_t = start_t;
	}
	
	
	
	
	
}
