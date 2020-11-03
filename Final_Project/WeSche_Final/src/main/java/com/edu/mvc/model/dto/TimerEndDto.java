package com.edu.mvc.model.dto;

import java.util.Date;

public class TimerEndDto {
	
	private int endno;
	private String memberid;
	private Date end_t;
	
	
	public TimerEndDto() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public int getEndno() {
		return endno;
	}

	public void setEndno(int endno) {
		this.endno = endno;
	}

	public String getMemberid() {
		return memberid;
	}
	public void setMemberid(String memberid) {
		this.memberid = memberid;
	}
	public Date getEnd_t() {
		return end_t;
	}
	public void setEnd_t(Date end_t) {
		this.end_t = end_t;
	}

	
	

}
