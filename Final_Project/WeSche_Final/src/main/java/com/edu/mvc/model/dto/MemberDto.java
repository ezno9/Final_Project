package com.edu.mvc.model.dto;

import org.springframework.web.multipart.MultipartFile;

public class MemberDto {
	private String memberid;
	private String memberpw;
	private String name;
	private String email;
	private String filename;
	private MultipartFile mpfile;

	public MemberDto() {
		super();
	}

	public MemberDto(String memberid, String memberpw, String name, String email, String filename,
			MultipartFile mpfile) {
		super();
		this.memberid = memberid;
		this.memberpw = memberpw;
		this.name = name;
		this.email = email;
		this.filename = filename;
		this.mpfile = mpfile;
	}

	public String getMemberid() {
		return memberid;
	}

	public void setMemberid(String memberid) {
		this.memberid = memberid;
	}

	public String getMemberpw() {
		return memberpw;
	}

	public void setMemberpw(String memberpw) {
		this.memberpw = memberpw;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getFilename() {
		return filename;
	}

	public void setFilename(String filename) {
		this.filename = filename;
	}

	public MultipartFile getMpfile() {
		return mpfile;
	}

	public void setMpfile(MultipartFile mpfile) {
		this.mpfile = mpfile;
	}

	@Override
	public String toString() {
		return "MemberDto [memberid=" + memberid + ", memberpw=" + memberpw + ", name=" + name + ", email=" + email
				+ ", filename=" + filename + ", mpfile=" + mpfile + "]";
	}

}