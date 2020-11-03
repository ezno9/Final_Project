package com.edu.mvc.model.dto;

import java.util.Date;

import org.springframework.web.multipart.MultipartFile;

public class QBoardDto {
   private int qbseq;
   private String memberid;
   private String title;
   private int qbcount;
   private String qbtag;
   private Date qbdate;
   private String qbcontent;
   private String qbfilename;
   private MultipartFile mpfile;
   
   private MemberDto memberdto;

   public QBoardDto() {
      super();
      // TODO Auto-generated constructor stub
   }

   public QBoardDto(int qbseq, String memberid, String title, int qbcount, String qbtag, Date qbdate, String qbcontent,
         String qbfilename, MultipartFile mpfile, MemberDto memberdto) {
      super();
      this.qbseq = qbseq;
      this.memberid = memberid;
      this.title = title;
      this.qbcount = qbcount;
      this.qbtag = qbtag;
      this.qbdate = qbdate;
      this.qbcontent = qbcontent;
      this.qbfilename = qbfilename;
      this.mpfile = mpfile;
      this.memberdto = memberdto;
   }

   @Override
   public String toString() {
      return "QBoardDto [qbseq=" + qbseq + ", memberid=" + memberid + ", title=" + title + ", qbcount=" + qbcount
            + ", qbtag=" + qbtag + ", qbdate=" + qbdate + ", qbcontent=" + qbcontent + ", qbfilename=" + qbfilename
            + ", mpfile=" + mpfile + ", memberdto=" + memberdto + "]";
   }

   public int getQbseq() {
      return qbseq;
   }

   public void setQbseq(int qbseq) {
      this.qbseq = qbseq;
   }

   public String getMemberid() {
      return memberid;
   }

   public void setMemberid(String memberid) {
      this.memberid = memberid;
   }

   public String getTitle() {
      return title;
   }

   public void setTitle(String title) {
      this.title = title;
   }

   public int getQbcount() {
      return qbcount;
   }

   public void setQbcount(int qbcount) {
      this.qbcount = qbcount;
   }

   public String getQbtag() {
      return qbtag;
   }

   public void setQbtag(String qbtag) {
      this.qbtag = qbtag;
   }

   public Date getQbdate() {
      return qbdate;
   }

   public void setQbdate(Date qbdate) {
      this.qbdate = qbdate;
   }

   public String getQbcontent() {
      return qbcontent;
   }

   public void setQbcontent(String qbcontent) {
      this.qbcontent = qbcontent;
   }

   public String getQbfilename() {
      return qbfilename;
   }

   public void setQbfilename(String qbfilename) {
      this.qbfilename = qbfilename;
   }

   public MultipartFile getMpfile() {
      return mpfile;
   }

   public void setMpfile(MultipartFile mpfile) {
      this.mpfile = mpfile;
   }

   public MemberDto getMemberdto() {
      return memberdto;
   }

   public void setMemberdto(MemberDto memberdto) {
      this.memberdto = memberdto;
   }
   
   
   
}