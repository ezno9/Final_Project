package com.edu.mvc;

import java.awt.AWTException;
import java.awt.Robot;
import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.edu.mvc.model.biz.ChatBiz;
import com.edu.mvc.model.biz.MemberBiz;
import com.edu.mvc.model.dto.MemberDto;

@Controller   
public class MemberController {

   private static final Logger logger = LoggerFactory.getLogger(MemberController.class);

   @Autowired 
   private ChatBiz cbiz;
   
   @Autowired
   private BCryptPasswordEncoder pwdEncoder;

   private Cookie cookie;
   
   //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
   // LOGIN/REGISTER //
   @Resource
   private MemberBiz lbiz;

   @Resource
   private HttpSession session;

   // 로그인 페이지 접속
   @RequestMapping("/login.do")
   public String login(HttpServletResponse response) {
      logger.info("[log] : login.jsp");
      String study_state = "login";
      session.setAttribute("study_state", study_state);
      return "login";
   }

   // 회원가입 페이지 접속
   @RequestMapping("/register.do")
   public String register() {
      logger.info("[log] : register.jsp");
      return "register";
   }

   // 로그아웃 시 login페이지로 이동
   @RequestMapping("/logout.do")
   public String logout(HttpServletRequest httpServletRequest, HttpServletResponse response) {
      session.removeAttribute("logindto");
      session.invalidate();
      response.setHeader("Cache-Control", "no-store");
      response.setHeader("Cache-control", "no-cache, no-store, must-revalidate");
      response.setHeader("Expires", "0");
      Cookie cookie = new Cookie("loginid",null);
      cookie.setMaxAge(0);
      cookie.setPath("/");
      response.addCookie(cookie);
      return "redirect:login.do";
   }

   // 로그인 성공시 index페이지 전환
   @RequestMapping(value = "/logind.do", method = RequestMethod.POST)
   public String loginIndex(HttpServletRequest httpServletRequest, HttpServletResponse response,Model model) {
      logger.info("[log] : 로그인 -> 인덱스");

      String memberid = (String) httpServletRequest.getParameter("memberid").trim();
      String memberpw = (String) httpServletRequest.getParameter("memberpw").trim();
      String name = (String) httpServletRequest.getParameter("name").trim();
      String email = (String) httpServletRequest.getParameter("email").trim();
      MemberDto logindto = new MemberDto();
      logindto.setMemberid(memberid);
      logindto.setMemberpw(pwdEncoder.encode(memberpw).trim());
      logindto.setName(name);
      logindto.setEmail(email);
      cookie = new Cookie("loginid", memberid);
      cookie.setMaxAge(60 * 60);
      cookie.setPath("/");
      response.addCookie(cookie);
      
      session.setAttribute("chatlistbyid", cbiz.selectRoomByIdS(memberid));
      session.setAttribute("logindto", logindto);
      session.setAttribute("login_id", logindto.getMemberid());
      session.setAttribute("myprofileimg", lbiz.selectMe(memberid).getFilename());
      
      session.setAttribute("chatlistbyid",cbiz.selectRoomByIdS(memberid));
      model.addAttribute("studylistbyking",cbiz.selectStudyListByKing(memberid));

      return "index";

   }

   // 로그인 시도
   @ResponseBody
   @RequestMapping("/ajaxLogin.do")
   public Map<String, Object> loginchk(HttpServletRequest httpServletRequest, HttpServletResponse response,
         @RequestParam(value = "memberid") String memberid, @RequestParam(value = "memberpw") String memberpw) {
      logger.info("[log] : ajaxLogin");
      System.out.println("ajaxlogin 시도 중");
      Map<String, Object> mmap = new HashMap<>();
      MemberDto mdto = new MemberDto();
      mdto = lbiz.selectOne(memberid);
      boolean valid = false;
      if (mdto != null && pwdEncoder.matches(memberpw, mdto.getMemberpw())) {
         mmap.put("mdto", mdto);
         valid = true;
      }
      mmap.put("valid", valid);
      return mmap;
   }

   // 회원가입 시 아이디 중복 여부 체크
   @ResponseBody
   @RequestMapping("/ajaxRegister.do")
   public Map<String, Object> registerchk(HttpServletRequest httpServletRequest,
         @RequestParam(value = "memberid") String memberid) {
      logger.info("[log] : ajaxRegister");
      Map<String, Object> mmap = new HashMap<>();
      MemberDto mdto = lbiz.selectOne(memberid);
      boolean valid = false;
      if (mdto != null) {
         mmap.put("mdto", mdto);
         valid = true;
      }
      mmap.put("valid", valid);
      return mmap;

   }

   // 회원가입 시도
   @RequestMapping("/regchk.do")
   public String regchk(HttpServletRequest httpServletRequest, Model model) {
      logger.info("[log] : regchk");
      String memberid = (String) httpServletRequest.getParameter("memberid").trim();
      String memberpw = (String) httpServletRequest.getParameter("memberpw").trim();
      String name = (String) httpServletRequest.getParameter("name").trim();
      String email = (String) httpServletRequest.getParameter("email").trim();

      MemberDto dto = new MemberDto();
      dto.setMemberid(memberid);
      dto.setMemberpw(pwdEncoder.encode(memberpw).trim());
      dto.setName(name);
      dto.setFilename("kimegg.jpg");
      dto.setEmail(email);

      int res = lbiz.insert(dto);
      try {
      Robot robot = new Robot();
      robot.delay(1000);
   } catch (AWTException e) {
      e.printStackTrace();
   }
      if (res > 0) {
         System.out.println("member insert 성공");
         model.addAttribute("dto", dto);
         return "login";
      } else {
         System.out.println("member insert 실패");
         return "register";
      }
   }

   // 회원 정보 일치 여부 확인
   @ResponseBody
   @RequestMapping("/memberidchk.do")
   public Map<String, Object> memberidchk(HttpServletRequest httpServletRequest,
         @RequestParam(value = "fname") String name, @RequestParam(value = "femail") String email) {
      logger.info("[log] : memberidchk");
      Map<String, Object> mmap = new HashMap<>();
      boolean valid = false;
      MemberDto mdto = new MemberDto();
      mdto.setEmail(email);
      mdto.setName(name);
      MemberDto ldto = new MemberDto();
      ldto = lbiz.memberIdChk(mdto);

      if (ldto != null) {
         valid = true;
         mmap.put("ldto", ldto);
      }
      mmap.put("valid", valid);
      return mmap;

   }

   @ResponseBody
   @RequestMapping("/memberpwchk.do")
   public Map<String, Object> memberpwchk(HttpServletRequest httpServletRequest,
         @RequestParam(value = "pwid") String memberid, @RequestParam(value = "pwemail") String email) {
      logger.info("[log] : memberpwchk");
      Map<String, Object> mmap = new HashMap<>();
      boolean valid = false;
      MemberDto mdto = new MemberDto();
      mdto.setEmail(email);
      mdto.setMemberid(memberid);
      MemberDto ldto = new MemberDto();
      ldto = lbiz.memberPwChk(mdto);

      if (ldto != null) {
         valid = true;
         mmap.put("ldto", ldto);
      }
      mmap.put("valid", valid);
      return mmap;

   }

   @ResponseBody
   @RequestMapping("/pwchange.do")
   public Map<String, Object> pwchange(HttpServletRequest httpServletRequest,
         @RequestParam(value = "id") String memberid, @RequestParam(value = "pw") String memberpw) {
      logger.info("[log] : pwchange");
      Map<String, Object> mmap = new HashMap<>();
      int res = 0;
      MemberDto mdto = new MemberDto();
      mdto.setMemberid(memberid);
      mdto.setMemberpw(pwdEncoder.encode(memberpw).trim());
      res = lbiz.memberPwChg(mdto);

      boolean valid = false;
      if (res > 0) {
         System.out.println("PW update 성공");
         valid = true;
      } else {
         System.out.println("PW update 실패");
      }
      mmap.put("valid", valid);
      return mmap;
   }

   @ResponseBody
   @RequestMapping(value = "/ajaxemailchk.do", method = RequestMethod.POST)
   public Map<String, Object> emailchk(HttpServletRequest httpServletRequest,
         @RequestParam(value = "email") String email) {
      logger.info("[log] : emailchk");
      Map<String, Object> mmap = new HashMap<>();
      MemberDto mdto = new MemberDto();
      mdto.setEmail(email);
      mdto = lbiz.emailChk(email);
      
      boolean valid = false;
      if (mdto == null) {
         System.out.println("중복된 이메일이 존재하지 않음");
         valid = true;
      } else {
         System.out.println("중복된 이메일이 존재함");
      }
      mmap.put("valid", valid);
      return mmap;
   }
   
   @RequestMapping(value = "/idfind.do", method = RequestMethod.POST)
   public String idfind(HttpServletRequest httpServletRequest, Model model) {
      logger.info("[log] : idfind");
      String memberid = httpServletRequest.getParameter("ldtoid");
      MemberDto mdto = lbiz.selectOne(memberid);
      if (mdto != null) {
         memberid = memberid.substring(0, memberid.length() - 2);
         memberid += "**";
         model.addAttribute("memberid", memberid);
      }
      return "IDchkPopUp";

   }
   
   @ResponseBody
   @RequestMapping(value = "/deleteMember.do", method = RequestMethod.POST)
   public Map<String, Object>  deleteMember(HttpServletRequest httpServletRequest,
         @RequestParam(value = "logid") String logid) {
      logger.info("[log] :  deleteMember");
      Map<String, Object> mmap = new HashMap<>();
      int res = lbiz.delete(logid);
      int delchat = cbiz.roomOut(logid);
      mmap.put("res", res);
      mmap.put("delchat", delchat);
      
      return mmap;
   }
   
   
   
}