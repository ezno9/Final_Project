package com.edu.mvc;

import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.websocket.OnClose;
import javax.websocket.OnError;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.RemoteEndpoint;
import javax.websocket.RemoteEndpoint.Basic;
import javax.websocket.Session;
import javax.websocket.server.PathParam;
import javax.websocket.server.ServerEndpoint;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.edu.mvc.model.biz.ChatBiz;
import com.edu.mvc.model.dto.ChatlistDto;
import com.edu.mvc.model.dto.ChatmsgDto;
import com.edu.mvc.model.dto.ChatuserDto;

@Controller
@ServerEndpoint(value = "/echo/{chatSeq}/{userId}")
public class ChatSocketController {

   @Autowired
   private ChatBiz cbiz;

   private static final List<Map<String, Object>> sessionList = new ArrayList<Map<String, Object>>();
   private static final Logger logger = LoggerFactory.getLogger(ChatSocketController.class);

   public ChatSocketController() {
      // TODO Auto-generated constructor stub
      System.out.println("웹소켓(서버) 객체생성");
   }

   @RequestMapping(value = "/chatdetail{chatSeq}.do", method = RequestMethod.GET)
   public String chatDetail(Model model, @PathVariable("chatSeq") int chatSeq) {

      List<ChatmsgDto> lastestMsgList = new ArrayList<ChatmsgDto>();
      lastestMsgList = cbiz.getLastestMsgList(chatSeq);
      Collections.reverse(lastestMsgList);

      List<ChatuserDto> memberList = new ArrayList<ChatuserDto>();
      memberList = cbiz.getMemberList(chatSeq);

      ChatlistDto chatdetail = cbiz.selectChatdetail(chatSeq);

      model.addAttribute("chatdetail", chatdetail);
      model.addAttribute("chatSeq", chatSeq); // 방번호
      model.addAttribute("lastestMsgList", lastestMsgList); // 최근 20개 메세지
      model.addAttribute("memberList", memberList); // 채팅방 인원들
      logger.info("CHAT DETAIL");
      return "chatdetail";
   }

   @OnOpen
   public void onOpen(Session session, @PathParam("chatSeq") int chatSeq, @PathParam("userId") String userId) {
      logger.info("Open session id:" + session.getId());
      try {
         final Basic basic = session.getBasicRemote();
         // basic.sendText("all|----------"+ userId + "님이 대화방에 연결 되었습니다.----------");
         sendAllSessionToMessage(session, "all|" + userId + "님이 님이 입장했습니다.", chatSeq);
      } catch (Exception e) {
         // TODO: handle exception
         System.out.println(e.getMessage());
      }
      Map<String, Object> sessionMap = new HashMap<String, Object>();
      sessionMap.put("session", session);
      sessionMap.put("chatSeq", chatSeq);
      sessionMap.put("userId", userId);
      sessionList.add(sessionMap);
   }

   private void sendAllSessionToMessage(Session self, String message, int chatSeq) {

      try {
         for (Map<String, Object> sessionMap : ChatSocketController.sessionList) {
            Session session = (Session) sessionMap.get("session");
            if (!self.getId().equals(session.getId())
                  && Integer.parseInt(sessionMap.get("chatSeq").toString()) == chatSeq) {
               session.getBasicRemote().sendText("receive|" + message);
            }
         }
      } catch (Exception e) {
         // TODO: handle exception
         System.out.println(e.getMessage());
      }
   }

   @OnMessage
   public void onMessage(String message, Session session, @PathParam("chatSeq") int chatSeq,
         @PathParam("userId") String userId) {

      logger.info("Message From " + message);

      try {
         final RemoteEndpoint.Basic basic = session.getBasicRemote();
         basic.sendText("send|" + message);
      } catch (Exception e) {
         // TODO: handle exception
         System.out.println(e.getMessage());
      }
      sendAllSessionToMessage(session, message, chatSeq);

   }

   @OnError
   public void onError(Throwable e, Session session) {

   }

   @OnClose
   public void onClose(Session session, @PathParam("chatSeq") int chatSeq, @PathParam("userId") String userId) {
      logger.info("Session " + session.getId() + " has ended");
      
      try {
         final Basic basic = session.getBasicRemote();
         // basic.sendText("all|----------"+ userId + "님이 대화방에 연결 되었습니다.----------");
         sendAllSessionToMessage(session, "all|" + userId + "님이 님이 퇴장했습니다.", chatSeq);
      } catch (Exception e) {
         // TODO: handle exception
         System.out.println(e.getMessage());
      }
      
      
      
      for (int i = 0; i < sessionList.size(); i++) {
         if (sessionList.get(i).get("session") == session) {
            sessionList.remove(i);
         }
      }
   }
}