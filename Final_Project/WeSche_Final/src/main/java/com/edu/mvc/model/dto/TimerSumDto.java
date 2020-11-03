package com.edu.mvc.model.dto;

public class TimerSumDto {
	
	private String memberid;
	private int total_t;
	private String today;
	
	
	public TimerSumDto() {
		super();
		// TODO Auto-generated constructor stub
	}


	public String getMemberid() {
		return memberid;
	}


	public void setMemberid(String memberid) {
		this.memberid = memberid;
	}


	public int getTotal_t() {
		return total_t;
	}


	public void setTotal_t(int total_t) {
		this.total_t = total_t;
	}


	public String getToday() {
		return today;
	}


	public void setToday(String today) {
		this.today = today;
	}
	
	
	

}
