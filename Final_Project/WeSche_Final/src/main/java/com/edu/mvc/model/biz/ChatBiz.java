package com.edu.mvc.model.biz;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.edu.mvc.model.dao.ChatDao;
import com.edu.mvc.model.dto.ChatlistDto;
import com.edu.mvc.model.dto.ChatmsgDto;
import com.edu.mvc.model.dto.ChatuserDto;
import com.edu.mvc.model.dto.MemberDto;
import com.edu.mvc.model.dto.QAnswerDto;
import com.edu.mvc.model.dto.RecruitAnswerDto;

@Service
public class ChatBiz {

@Autowired
private ChatDao dao;

public int createRoom(ChatlistDto dto) {
   return dao.createRoom(dto);
}

public ChatlistDto selectRooms(int chat_list_board_no) {
   return dao.selectRooms(chat_list_board_no);
}


public int insertKing(ChatuserDto kdto) {
   return dao.insertKing(kdto);
}

public int deleteRoom(int chat_list_no) {
   return dao.deleteRoom(chat_list_no);
}

public int inviteRoom(ChatuserDto dto) {
   return dao.inviteRoom(dto);
}

public List<ChatlistDto> selectRoomById(String chat_user_id) {
   return dao.selectRoomById(chat_user_id);
}

public List<ChatlistDto> selectRoomByIdS(String chat_user_id) {
      return dao.selectRoomByIdS(chat_user_id);
   }

public int sendfordb(ChatmsgDto item) {
   return dao.sendfordb(item);
}



public List<ChatmsgDto> getLastestMsgList(int chatSeq) {
   // TODO Auto-generated method stub
   return dao.getLastestMsgList(chatSeq);
}

public int deleteMembers(int chat_list_no) {
   return dao.deleteMembers(chat_list_no);
}

public int deleteMsgs(int chat_list_no) {
   return dao.deleteMsgs(chat_list_no);
}

public List<MemberDto> inviteList(ChatlistDto dto) {
   return dao.inviteList(dto);
}

public List<ChatuserDto> getMemberList(int chatSeq) {
   return dao.getMemberList(chatSeq);
}

public int exitRoom(ChatuserDto dto) {
   return dao.exitRoom(dto);
}

public ChatlistDto selectRoomq(int qbseq) {
   return dao.selectRoomq(qbseq);
}

public int countMyStudy(String memberid) {
   return dao.countMyStudy(memberid);
}

public ChatlistDto selectChatdetail(int chatSeq) {
   return dao.selectChatdetail(chatSeq);
}
public List<QAnswerDto> inviteListq(ChatlistDto dto) {
   return dao.inviteListq(dto);
}


public List<RecruitAnswerDto> inviteLists(ChatlistDto dto) {
   return dao.inviteLists(dto);
}

public ChatuserDto findKingId(String username) {
      return dao.findKingId(username);
   }

   public List<ChatuserDto> findMembers(ChatuserDto chatDto) {
      return dao.findMembers(chatDto);
   }

   public Object selectStudyListByKing(String login_id) {
      return dao.selectStudyListByKing(login_id);
   }

   public List<ChatuserDto> selectStudyAll(String type) {
      return dao.selectStudyAll(type);
   }

   public int roomOut(String logid) {
      return dao.roomOut(logid);
   }



   
}