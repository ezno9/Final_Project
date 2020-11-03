package com.edu.mvc;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.edu.mvc.model.biz.ChatBiz;
import com.edu.mvc.model.biz.MemberBiz;
import com.edu.mvc.model.biz.QAnswerBiz;
import com.edu.mvc.model.biz.QBoardBiz;
import com.edu.mvc.model.biz.RecruitAnswerBiz;
import com.edu.mvc.model.biz.RecruitBoardBiz;
import com.edu.mvc.model.dto.ChatlistDto;
import com.edu.mvc.model.dto.ChatmsgDto;
import com.edu.mvc.model.dto.ChatuserDto;

@Controller
public class ChatController {
   private static final Logger logger = LoggerFactory.getLogger(ChatController.class);
   
   @Autowired
   private RecruitBoardBiz rbbiz; //스터디
   
   @Autowired
   private QBoardBiz qbbiz;
   
   @Autowired
   private ChatBiz cbiz;
   
   @Autowired
   private MemberBiz mbiz;
   
   @RequestMapping("/createrooms.do")  //채팅방 생성 
   public String createRooms(Model model, ChatlistDto dto) { //dto 에 boardno 랑 boardtype 있음
      logger.info("CREATE CHATROOM");
      
      model.addAttribute("bdto",rbbiz.selectOne(dto.getChat_list_board_no()));   //게시물 정보
      model.addAttribute("memlist",mbiz.selectList()); //전체 맴버리스트 -> 댓글 리스트로 바꿔야함@@
      
      //새로고침시 board_type=S?reloaded 문제 해결
      if(dto.getChat_list_board_type().equals("S?reloaded")) {
         dto.setChat_list_board_type("S");
      }
      

      dto.setChat_list_title(rbbiz.selectOne(dto.getChat_list_board_no()).getTitle());; //채팅방이름 게시글이름과 동일하게
      
      ChatlistDto cdto = null;
      
      cdto = cbiz.selectRooms(dto.getChat_list_board_no()); 
         

      
      System.out.println("cdto: " + cdto);
      

      if(cdto==null) {
         int res = cbiz.createRoom(dto);
         if(res>0) { //채팅방 생성 성공시
            //방장 추가
            
            int resKing = 0;
            //방장id
            String kingId =rbbiz.selectOne(dto.getChat_list_board_no()).getMemberid();
            
            //채팅방번호
            int chatno = cbiz.selectRooms(dto.getChat_list_board_no()).getChat_list_no(); 
            ChatuserDto kingDto = new ChatuserDto(0,chatno,kingId,null,null,"Y",null);
            
            int temp= cbiz.inviteRoom(kingDto);
            
            //채팅방에 메세지 하나 만들기
            int makeMsg =0;
            ChatmsgDto msgDto = new ChatmsgDto();
            msgDto.setChat_msg_chat_no(chatno);
            msgDto.setChat_msg_txt("채팅을 시작하겠습니다!");
            msgDto.setChat_msg_user_id(kingId);

            makeMsg = cbiz.sendfordb(msgDto);
            
               model.addAttribute("cdto",cdto);
               model.addAttribute("invitelist",cbiz.inviteLists(dto));
               return "inviterooms";
            
         }else {
            return null;
         }
      }else {
         model.addAttribute("cdto",cdto);
         model.addAttribute("invitelist",cbiz.inviteLists(dto));
         return "inviterooms";
      }
   }
   
   @RequestMapping("/createroomq.do")  //채팅방 생성 
   public String createRoomq(Model model, ChatlistDto dto, int pagelength) { //dto 에 boardno 랑 boardtype 있음
      logger.info("CREATE CHATROOM");
      
      model.addAttribute("bdto",qbbiz.selectOne(dto.getChat_list_board_no()));   //게시물 정보
      model.addAttribute("memlist",mbiz.selectList()); //전체 맴버리스트 -> 댓글 리스트로 바꿔야함@@
      model.addAttribute("myno",dto.getChat_list_board_no());
      model.addAttribute("pagelength",pagelength);
      
      //새로고침시 board_type=S?reloaded 문제 해결
      if(dto.getChat_list_board_type().equals("Q?reloaded")) {
         dto.setChat_list_board_type("Q");
      }

      dto.setChat_list_title(qbbiz.selectOne(dto.getChat_list_board_no()).getTitle());; //채팅방이름 게시글이름과 동일하게
      
      ChatlistDto cdto = null;
      
      cdto = cbiz.selectRoomq(dto.getChat_list_board_no()); 
         

      
      System.out.println("cdto: " + cdto);
      

      if(cdto==null) {
         int res = cbiz.createRoom(dto);
         if(res>0) { //채팅방 생성 성공시
            //방장 추가
            
            int resKing = 0;
            //방장id
            String kingId =qbbiz.selectOne(dto.getChat_list_board_no()).getMemberid();
            
            //채팅방번호
            int chatno = cbiz.selectRoomq(dto.getChat_list_board_no()).getChat_list_no(); 
            ChatuserDto kingDto = new ChatuserDto(0,chatno,kingId,null,null,"Y",null);
            
            int temp= cbiz.inviteRoom(kingDto);
            
            //채팅방에 메세지 하나 만들기
            int makeMsg =0;
            ChatmsgDto msgDto = new ChatmsgDto();
            msgDto.setChat_msg_chat_no(chatno);
            msgDto.setChat_msg_txt("채팅을 시작하겠습니다!");
            msgDto.setChat_msg_user_id(kingId);

            makeMsg = cbiz.sendfordb(msgDto);
            
               model.addAttribute("cdto",cdto);
               model.addAttribute("invitelist",cbiz.inviteListq(dto));
               return "inviteroomq";
            
         }else {
            return null;
         }
      }else {
         model.addAttribute("cdto",cdto);
         model.addAttribute("invitelist",cbiz.inviteListq(dto));
         return "inviteroomq";
      }
   }
   
   

      
   @RequestMapping("/returnrooms.do")   
   public String returnRooms(int myno, int chat_list_no) { //pagelength 일단 미적용인듯
      logger.info("RETURN CHATROOM");
      
      //삭제시 맴버들 먼저 삭제!
      int temp = cbiz.deleteMembers(chat_list_no);
      
      //삭제시 채팅방 내용들 삭제
      int temp2 = cbiz.deleteMsgs(chat_list_no); 
      if(temp>0 && temp2>0) {
         System.out.println("채팅방인원 및 메세지 삭제 성공");
         int res = cbiz.deleteRoom(chat_list_no);   //채팅방 삭제  
         if(res==0) {
            return "redirect:studydetail.do?rbseq="+myno;  
         }else {
            System.out.println("채팅방 삭제 성공");
            return "redirect:studydetail.do?rbseq="+myno;  //삭제 성공시 전페이지로 이동  
         }
      }else {
         return null;
      }

   }
   
   //변수어케받음
   @RequestMapping("/returnroomq.do")   
   public String returnRoomq(int myno, int chat_list_no,int pagelength) {
      logger.info("RETURN CHATROOM");
      
      //삭제시 맴버들 먼저 삭제!
      int temp = cbiz.deleteMembers(chat_list_no);
      
      //삭제시 채팅방 내용들 삭제
      int temp2 = cbiz.deleteMsgs(chat_list_no); 
      if(temp>0 && temp2>0) {
         System.out.println("채팅방인원 및 메세지 삭제 성공");
         int res = cbiz.deleteRoom(chat_list_no);   //채팅방 삭제  
         if(res==0) {
            return "redirect:qnadetail.do?qbseq="+myno+"&pagelength="+pagelength;  
         }else {
            System.out.println("채팅방 삭제 성공");
            return "redirect:qnadetail.do?qbseq="+myno+"&pagelength="+pagelength;//삭제 성공시 전페이지로 이동  
         }
      }else {
         return null;
      }

   }
   
   
   
   
   @RequestMapping(value="/inviteroom.do", method=RequestMethod.POST)
   @ResponseBody
   public Map<String,Integer> chatInvite(@RequestBody List<Map<String,String>> invitelist) throws Exception{

      logger.info("INVITE ROOM");
      

      int res = 0;
      int temp =0;
      
      
      for(int i=0; i<invitelist.size(); i++) { //한명씩 insert
         
         int chat_user_chat_no = Integer.parseInt(invitelist.get(i).get("chat_user_chat_no"));
         String chat_user_id = invitelist.get(i).get("chat_user_id"); 
         ChatuserDto cdto = new ChatuserDto(0,chat_user_chat_no,chat_user_id,null,null,"N",null);
         
         temp = cbiz.inviteRoom(cdto);
         if(temp>0) {
            res++;                        //insert된 인원수
         }else {
            return null;
         }
      }
      Map<String,Integer> map = new HashMap<String, Integer>();
      map.put("count", res);
      return map;
   }
   
   ////////////////////////////////////////////////////////////////
   @RequestMapping("/chatlist.do")
   public String chatlist(Model model,String userid) {
      logger.info("[log] : chatlist.jsp");
      
      List<ChatlistDto> mylist =new ArrayList<ChatlistDto>();
      mylist=cbiz.selectRoomById(userid); //접속 아이디가 참여한 채팅방리스트들
      
      model.addAttribute("mylist",mylist);
      
      return "chatlist";
   }
/////////////////////////////////////////////////////////////////   
   
   @RequestMapping(value="/sendfordb.do", method=RequestMethod.POST)
   @ResponseBody
   public Map<String,Integer> sendfordb(@RequestBody ChatmsgDto item, HttpSession session){
      
      String loginId = "";
      if (session.getAttribute("login_id") != null) {
         loginId = session.getAttribute("login_id").toString();
      }
      item.setChat_msg_user_id(loginId);
      
      int res = cbiz.sendfordb(item);
      
      Map<String,Integer> map = new HashMap<String,Integer>();
   
      if(res>0) {
         map.put("res",res);
      }

      return map;
   }
   
   @RequestMapping("/exitRoom.do")
   public String exitRoom(ChatuserDto dto) {
      logger.info("[log] : exitRoom");
      System.out.println("dto?:" + dto);

      int res = 0;
      res = cbiz.exitRoom(dto);
      
      
      return "redirect:chatlist.do?userid="+dto.getChat_user_id();
   }
   

   
   
}