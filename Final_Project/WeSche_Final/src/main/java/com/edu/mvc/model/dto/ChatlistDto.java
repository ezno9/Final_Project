package com.edu.mvc.model.dto;

/**
 * @author User
 *
 */
public class ChatlistDto {
	private int chat_list_no;
	private String chat_list_title;
	private String chat_list_created_at;
	private String chat_list_updated_at;

	private int chat_list_board_no;
	private String chat_list_board_type;

	private int countmember;

	private ChatuserDto chatuserdto;
	private ChatmsgDto chatmsgdto;

	public ChatlistDto() {
		super();
		// TODO Auto-generated constructor stub
	}

	public ChatlistDto(int chat_list_no, String chat_list_title, String chat_list_created_at,
			String chat_list_updated_at, int chat_list_board_no, String chat_list_board_type, int countmember,
			ChatuserDto chatuserdto, ChatmsgDto chatmsgdto) {
		super();
		this.chat_list_no = chat_list_no;
		this.chat_list_title = chat_list_title;
		this.chat_list_created_at = chat_list_created_at;
		this.chat_list_updated_at = chat_list_updated_at;
		this.chat_list_board_no = chat_list_board_no;
		this.chat_list_board_type = chat_list_board_type;
		this.countmember = countmember;
		this.chatuserdto = chatuserdto;
		this.chatmsgdto = chatmsgdto;
	}

	@Override
	public String toString() {
		return "ChatlistDto [chat_list_no=" + chat_list_no + ", chat_list_title=" + chat_list_title
				+ ", chat_list_created_at=" + chat_list_created_at + ", chat_list_updated_at=" + chat_list_updated_at
				+ ", chat_list_board_no=" + chat_list_board_no + ", chat_list_board_type=" + chat_list_board_type
				+ ", countmember=" + countmember + ", chatuserdto=" + chatuserdto + ", chatmsgdto=" + chatmsgdto + "]";
	}

	public int getChat_list_no() {
		return chat_list_no;
	}

	public void setChat_list_no(int chat_list_no) {
		this.chat_list_no = chat_list_no;
	}

	public String getChat_list_title() {
		return chat_list_title;
	}

	public void setChat_list_title(String chat_list_title) {
		this.chat_list_title = chat_list_title;
	}

	public String getChat_list_created_at() {
		return chat_list_created_at;
	}

	public void setChat_list_created_at(String chat_list_created_at) {
		this.chat_list_created_at = chat_list_created_at;
	}

	public String getChat_list_updated_at() {
		return chat_list_updated_at;
	}

	public void setChat_list_updated_at(String chat_list_updated_at) {
		this.chat_list_updated_at = chat_list_updated_at;
	}

	public int getChat_list_board_no() {
		return chat_list_board_no;
	}

	public void setChat_list_board_no(int chat_list_board_no) {
		this.chat_list_board_no = chat_list_board_no;
	}

	public String getChat_list_board_type() {
		return chat_list_board_type;
	}

	public void setChat_list_board_type(String chat_list_board_type) {
		this.chat_list_board_type = chat_list_board_type;
	}

	public int getCountmember() {
		return countmember;
	}

	public void setCountmember(int countmember) {
		this.countmember = countmember;
	}

	public ChatuserDto getChatuserdto() {
		return chatuserdto;
	}

	public void setChatuserdto(ChatuserDto chatuserdto) {
		this.chatuserdto = chatuserdto;
	}

	public ChatmsgDto getChatmsgdto() {
		return chatmsgdto;
	}

	public void setChatmsgdto(ChatmsgDto chatmsgdto) {
		this.chatmsgdto = chatmsgdto;
	}

}