package com.edu.mvc.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.edu.mvc.model.dto.ChatlistDto;
import com.edu.mvc.model.dto.ChatmsgDto;
import com.edu.mvc.model.dto.ChatuserDto;
import com.edu.mvc.model.dto.MemberDto;
import com.edu.mvc.model.dto.QAnswerDto;
import com.edu.mvc.model.dto.RecruitAnswerDto;

@Repository
public class ChatDao {
   String NAMESPACE = "chat.";

   @Autowired
   private SqlSessionTemplate sqlSession;

   public int createRoom(ChatlistDto dto) {
      int res = 0;
      try {
         res = sqlSession.insert(NAMESPACE + "createroom", dto);
      } catch (Exception e) {
         System.out.println("[ERROR] : createroom");
         e.printStackTrace();
      }

      return res;
   }

   public ChatlistDto selectRooms(int chat_list_board_no) {
      ChatlistDto dto = null;
      try {
         dto = sqlSession.selectOne(NAMESPACE + "selectrooms", chat_list_board_no);
      } catch (Exception e) {
         System.out.println("[ERROR] : selectrooms");
         e.printStackTrace();
      }
      return dto;
   }

   public int insertKing(ChatuserDto kdto) {
      int res = 0;
      try {
         res = sqlSession.insert(NAMESPACE + "insertking", kdto);

      } catch (Exception e) {
         System.out.println("[ERROR] : insertking");
         e.printStackTrace();
      }
      return res;
   }

   public int deleteRoom(int chat_list_no) {
      int res = 0;
      try {
         res = sqlSession.delete(NAMESPACE + "deleteroom", chat_list_no);
      } catch (Exception e) {
         System.out.println("[ERROR] : deleteroom");
         e.printStackTrace();
      }
      return res;
   }

   public int inviteRoom(ChatuserDto dto) {
      int res = 0;
      try {
         res = sqlSession.insert(NAMESPACE + "inviteroom", dto);
      } catch (Exception e) {
         System.out.println("[ERROR] : inviteroom");
         e.printStackTrace();
      }
      return res;
   }

   public List<ChatlistDto> selectRoomById(String chat_user_id) {
      List<ChatlistDto> list = new ArrayList<ChatlistDto>();
      try {
         list = sqlSession.selectList(NAMESPACE + "selectroombyid", chat_user_id);
      } catch (Exception e) {
         System.out.println("[ERROR] : selectroombyid");
         e.printStackTrace();
      }
      return list;
   }
   
   public List<ChatlistDto> selectRoomByIdS(String chat_user_id) {
         List<ChatlistDto> list = new ArrayList<ChatlistDto>();
         try {
            list = sqlSession.selectList(NAMESPACE + "selectroombyidS", chat_user_id);
         } catch (Exception e) {
            System.out.println("[ERROR] : selectroombyidS");
            e.printStackTrace();
         }
         return list;
      }

   public int sendfordb(ChatmsgDto item) {
      int res = 0;
      try {
         res = sqlSession.insert(NAMESPACE + "sendfordb", item);
      } catch (Exception e) {
         System.out.println("[ERROR] : sendfordb");
         e.printStackTrace();
      }
      return res;
   }

   public List<ChatmsgDto> getLastestMsgList(int chatSeq) {
      List<ChatmsgDto> latestMsgList = new ArrayList<ChatmsgDto>();

      try {
         latestMsgList = sqlSession.selectList(NAMESPACE + "lastestMsgList", chatSeq);
      } catch (Exception e) {
         System.out.println("[ERROR] : lastestMsgList");
         e.printStackTrace();
      }
      return latestMsgList;
   }

   public int deleteMembers(int chat_list_no) {
      int res = 0;
      try {
         res = sqlSession.delete(NAMESPACE + "deleteMembers", chat_list_no);
      } catch (Exception e) {
         System.out.println("[ERROR] : deleteMembers");
         e.printStackTrace();
      }
      return res;
   }

   public int deleteMsgs(int chat_list_no) {
      int res = 0;
      try {
         res = sqlSession.delete(NAMESPACE + "deleteMsgs", chat_list_no);
      } catch (Exception e) {
         System.out.println("[ERROR] : deleteMsgs");
         e.printStackTrace();
      }
      return res;
   }



   public List<ChatuserDto> getMemberList(int chatSeq) {
      List<ChatuserDto> memberList = new ArrayList<ChatuserDto>();

      try {
         memberList = sqlSession.selectList(NAMESPACE + "getMemberList", chatSeq);
      } catch (Exception e) {
         System.out.println("[ERROR] : getMemberList");
         e.printStackTrace();
      }
      return memberList;
   }

   public int exitRoom(ChatuserDto dto) {
      int res = 0;
      try {
         res = sqlSession.delete(NAMESPACE + "exitRoom", dto);
      } catch (Exception e) {
         System.out.println("[ERROR] : exitRoom");
         e.printStackTrace();
      }

      return res;
   }

   public ChatlistDto selectRoomq(int qbseq) {
      ChatlistDto dto = null;
      try {
         dto = sqlSession.selectOne(NAMESPACE + "selectroomq", qbseq);
      } catch (Exception e) {
         System.out.println("[ERROR] : selectroomq");
         e.printStackTrace();
      }
      return dto;

   }

   public int countMyStudy(String memberid) {
      int res = 0;

      try {
         res = sqlSession.selectOne(NAMESPACE + "selectMyStudy", memberid);
      } catch (Exception e) {
         System.out.println("[error] : 스터디 개수 조회 오류 ");
         e.printStackTrace();
      }

      return res;
   }

   public ChatlistDto selectChatdetail(int chatSeq) {
      ChatlistDto selectchatdetail = null;
      try {
         selectchatdetail = sqlSession.selectOne(NAMESPACE+"selectChatdetail",chatSeq);
      } catch (Exception e) {
         System.out.println("[error] : selectChatdetail");
         e.printStackTrace();
      }
      
      return selectchatdetail;
   }
   
   public List<MemberDto> inviteList(ChatlistDto dto) {
      List<MemberDto> invitelist = new ArrayList<MemberDto>();
      try {
         invitelist = sqlSession.selectList("member." + "inviteList", dto);
      } catch (Exception e) {
         System.out.println("[ERROR] : inviteList");
         e.printStackTrace();
      }
      return invitelist;
   }
   

   public List<QAnswerDto> inviteListq(ChatlistDto dto) {
      List<QAnswerDto> invitelistq = new ArrayList<QAnswerDto>();
      try {
         invitelistq = sqlSession.selectList("qanswer."+"inviteListq",dto);
      } catch (Exception e) {
         System.out.println("[ERROR] : inviteListq");
         e.printStackTrace();
      }
      return invitelistq;
   }
   
   public List<RecruitAnswerDto> inviteLists(ChatlistDto dto) {
      List<RecruitAnswerDto> invitelists = new ArrayList<RecruitAnswerDto>();
      try {
         invitelists = sqlSession.selectList("recruitanswer."+"inviteLists",dto);
      } catch (Exception e) {
         System.out.println("[ERROR] : inviteLists");
         e.printStackTrace();
      }
      return invitelists;
   }
   
   public ChatuserDto findKingId(String username) {
      ChatuserDto cdto = new ChatuserDto();
      cdto = sqlSession.selectOne(NAMESPACE+"selectKingId",username);
      return cdto;
   }

   public List<ChatuserDto> findMembers(ChatuserDto chatDto) {
      List<ChatuserDto> chatlist = new ArrayList<>();
      chatlist = sqlSession.selectList(NAMESPACE+"findMembers",chatDto);
      return chatlist;
   }

   public List<ChatlistDto> selectStudyListByKing(String login_id) {
      List<ChatlistDto> list = new ArrayList<ChatlistDto>();
      try {
         list = sqlSession.selectList(NAMESPACE+"selectStudyListByKing",login_id);
         System.out.println("list:" + list);
      } catch (Exception e) {
            System.out.println("[ERROR] : selectStudyListByKing");
            e.printStackTrace();
      }
      return list;
   }

   public List<ChatuserDto> selectStudyAll(String type) {
      List<ChatuserDto> clist = new ArrayList<>();
      int ttype = Integer.parseInt(type);
      clist = sqlSession.selectList(NAMESPACE+"studyListAll", ttype);
      return clist;
   }

   public int roomOut(String logid) {
      int res = 0;
      try {
         res=sqlSession.delete(NAMESPACE+"roomOut",logid);
      } catch (Exception e) {
         System.out.println("[ERROR] : roomOut");
         e.printStackTrace();
      }
      return res;
   }

}