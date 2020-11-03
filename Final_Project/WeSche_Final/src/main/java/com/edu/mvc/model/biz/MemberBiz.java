package com.edu.mvc.model.biz;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.edu.mvc.model.dao.MemberDao;
import com.edu.mvc.model.dto.MemberDto;

@Service
public class MemberBiz {

   @Autowired
   private MemberDao dao;

   public List<MemberDto> selectList() {

      return null;
   }

   public MemberDto selectOne(MemberDto ldto) {
      return dao.selectOne(ldto);
   }

   public int insert(MemberDto dto) {
      return dao.insert(dto);
   }

   public int update(MemberDto dto) {
      return dao.update(dto);
   }

   public int delete(String memberid) {
      return dao.delete(memberid);
   }

   public MemberDto selectOne(String memberid) {
      return dao.selectOne(memberid);
   }

   public MemberDto memberIdChk(MemberDto mdto) {
      return dao.memberIdChk(mdto);
   }

   public MemberDto memberPwChk(MemberDto mdto) {
      return dao.memberPwChk(mdto);
   }

   public int memberPwChg(MemberDto mdto) {
      return dao.memberPwChg(mdto);
   }

   public MemberDto emailChk(String email) {
      return dao.emailChk(email);
   }

   public MemberDto selectMe(String memberid) {
      return dao.selectMe(memberid);
   }

}