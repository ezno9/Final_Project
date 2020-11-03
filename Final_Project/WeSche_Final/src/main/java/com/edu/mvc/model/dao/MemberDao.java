package com.edu.mvc.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.edu.mvc.model.dto.MemberDto;

@Repository
public class MemberDao {

   @Autowired
   private SqlSessionTemplate sqlSession;

   private String NAMESPACE = "member.";

   public List<MemberDto> loginchk(MemberDto ldto) {
      return null;
   }

   public MemberDto selectOne(MemberDto ldto) {
      MemberDto mdto = new MemberDto();
      System.out.println(ldto.toString());
      mdto = sqlSession.selectOne(NAMESPACE + "selectOne", ldto);
      return mdto;
   }

   public int insert(MemberDto dto) {
      int res = 0;
      res = sqlSession.insert(NAMESPACE + "insert", dto);
      return res;
   }

   public int update(MemberDto dto) {
      int res = 0;

      try {
         res = sqlSession.update(NAMESPACE + "updateInfo", dto);
      } catch (Exception e) {
         System.out.println("[error] : 회원 정보 수정 오류 ");
         e.printStackTrace();
      }
      return res;
   }

   public int delete(String memberid) {
      int res = sqlSession.delete(NAMESPACE+"delete",memberid);
      return res;
   }

   public MemberDto selectOne(String memberid) {
      MemberDto mdto = new MemberDto();
      mdto = sqlSession.selectOne(NAMESPACE + "selectOneRei", memberid);
      return mdto;
   }

   public MemberDto memberIdChk(MemberDto mdto) {
      MemberDto ldto = new MemberDto();
      ldto = sqlSession.selectOne(NAMESPACE + "idchk", mdto);
      return ldto;
   }

   public MemberDto memberPwChk(MemberDto mdto) {
      MemberDto ldto = new MemberDto();
      ldto = sqlSession.selectOne(NAMESPACE + "pwchk", mdto);
      return ldto;
   }

   public int memberPwChg(MemberDto mdto) {
      int res = 0;
      res = sqlSession.update(NAMESPACE + "pwchg", mdto);
      return res;
   }

   public MemberDto emailChk(String email) {
      MemberDto ldto = new MemberDto();
      ldto.setEmail(email);
      ldto = sqlSession.selectOne(NAMESPACE + "emailchk", ldto);
      return ldto;
   }
   
   public MemberDto selectMe(String memberid) {
      MemberDto mdto = new MemberDto();
      System.out.println(memberid);
      mdto = sqlSession.selectOne(NAMESPACE+"selectOneRei", memberid);
      
      return mdto;
   }

}