package com.edu.mvc.model.dto;

public class ChatmsgDto {
	
	private int chat_msg_no;
	private String chat_msg_user_id;
	private String chat_msg_txt;
	private String chat_msg_created_at;
	private String chat_msg_updated_at;
	private int chat_msg_chat_no;
	public ChatmsgDto() {
		super();
		// TODO Auto-generated constructor stub
	}
	public ChatmsgDto(int chat_msg_no, int chat_msg_chat_no, String chat_msg_user_id, String chat_msg_txt,
			String chat_msg_created_at, String chat_msg_updated_at) {
		super();
		this.chat_msg_no = chat_msg_no;
		this.chat_msg_chat_no = chat_msg_chat_no;
		this.chat_msg_user_id = chat_msg_user_id;
		this.chat_msg_txt = chat_msg_txt;
		this.chat_msg_created_at = chat_msg_created_at;
		this.chat_msg_updated_at = chat_msg_updated_at;
	}
	public int getChat_msg_no() {
		return chat_msg_no;
	}
	public void setChat_msg_no(int chat_msg_no) {
		this.chat_msg_no = chat_msg_no;
	}
	public int getChat_msg_chat_no() {
		return chat_msg_chat_no;
	}
	public void setChat_msg_chat_no(int chat_msg_chat_no) {
		this.chat_msg_chat_no = chat_msg_chat_no;
	}
	public String getChat_msg_user_id() {
		return chat_msg_user_id;
	}
	public void setChat_msg_user_id(String chat_msg_user_id) {
		this.chat_msg_user_id = chat_msg_user_id;
	}
	public String getChat_msg_txt() {
		return chat_msg_txt;
	}
	public void setChat_msg_txt(String chat_msg_txt) {
		this.chat_msg_txt = chat_msg_txt;
	}
	public String getChat_msg_created_at() {
		return chat_msg_created_at;
	}
	public void setChat_msg_created_at(String chat_msg_created_at) {
		this.chat_msg_created_at = chat_msg_created_at;
	}
	public String getChat_msg_updated_at() {
		return chat_msg_updated_at;
	}
	public void setChat_msg_updated_at(String chat_msg_updated_at) {
		this.chat_msg_updated_at = chat_msg_updated_at;
	}
	@Override
	public String toString() {
		return "ChatmsgDto [chat_msg_no=" + chat_msg_no + ", chat_msg_chat_no=" + chat_msg_chat_no
				+ ", chat_msg_user_id=" + chat_msg_user_id + ", chat_msg_txt=" + chat_msg_txt + ", chat_msg_created_at="
				+ chat_msg_created_at + ", chat_msg_updated_at=" + chat_msg_updated_at + "]";
	}

}
