package com.edu.mvc.model.dto;

public class ChatuserDto {
	
	private int chat_user_no;
	private int chat_user_chat_no;
	private String chat_user_id;
	private String chat_user_created_at;
	private String chat_user_updated_at;
	private String chat_user_king_yn;
	
	private MemberDto memberdto;

	public ChatuserDto() {
		super();
		// TODO Auto-generated constructor stub
	}

	public ChatuserDto(int chat_user_no, int chat_user_chat_no, String chat_user_id, String chat_user_created_at,
			String chat_user_updated_at, String chat_user_king_yn, MemberDto memberdto) {
		super();
		this.chat_user_no = chat_user_no;
		this.chat_user_chat_no = chat_user_chat_no;
		this.chat_user_id = chat_user_id;
		this.chat_user_created_at = chat_user_created_at;
		this.chat_user_updated_at = chat_user_updated_at;
		this.chat_user_king_yn = chat_user_king_yn;
		this.memberdto = memberdto;
	}

	public int getChat_user_no() {
		return chat_user_no;
	}

	public void setChat_user_no(int chat_user_no) {
		this.chat_user_no = chat_user_no;
	}

	public int getChat_user_chat_no() {
		return chat_user_chat_no;
	}

	public void setChat_user_chat_no(int chat_user_chat_no) {
		this.chat_user_chat_no = chat_user_chat_no;
	}

	public String getChat_user_id() {
		return chat_user_id;
	}

	public void setChat_user_id(String chat_user_id) {
		this.chat_user_id = chat_user_id;
	}

	public String getChat_user_created_at() {
		return chat_user_created_at;
	}

	public void setChat_user_created_at(String chat_user_created_at) {
		this.chat_user_created_at = chat_user_created_at;
	}

	public String getChat_user_updated_at() {
		return chat_user_updated_at;
	}

	public void setChat_user_updated_at(String chat_user_updated_at) {
		this.chat_user_updated_at = chat_user_updated_at;
	}

	public String getChat_user_king_yn() {
		return chat_user_king_yn;
	}

	public void setChat_user_king_yn(String chat_user_king_yn) {
		this.chat_user_king_yn = chat_user_king_yn;
	}

	public MemberDto getMemberdto() {
		return memberdto;
	}

	public void setMemberdto(MemberDto memberdto) {
		this.memberdto = memberdto;
	}

	@Override
	public String toString() {
		return "ChatuserDto [chat_user_no=" + chat_user_no + ", chat_user_chat_no=" + chat_user_chat_no
				+ ", chat_user_id=" + chat_user_id + ", chat_user_created_at=" + chat_user_created_at
				+ ", chat_user_updated_at=" + chat_user_updated_at + ", chat_user_king_yn=" + chat_user_king_yn
				+ ", memberdto=" + memberdto + "]";
	}
	
	
	

}
