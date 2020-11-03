package com.edu.mvc.model.dto;

import java.util.Date;

public class RecruitBoardDto {
   private int rbseq;
   private String memberid;
   private String title;
   private int rbcount;
   private String tag;
   private Date rbdate;
   private String rbcontent;
   private int grouping;
   
   private MemberDto memberdto;

   public RecruitBoardDto() {
      super();
      // TODO Auto-generated constructor stub
   }

   public RecruitBoardDto(int rbseq, String memberid, String title, int rbcount, String tag, Date rbdate,
         String rbcontent, int grouping, MemberDto memberdto) {
      super();
      this.rbseq = rbseq;
      this.memberid = memberid;
      this.title = title;
      this.rbcount = rbcount;
      this.tag = tag;
      this.rbdate = rbdate;
      this.rbcontent = rbcontent;
      this.grouping = grouping;
      this.memberdto = memberdto;
   }

   public int getRbseq() {
      return rbseq;
   }

   public void setRbseq(int rbseq) {
      this.rbseq = rbseq;
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

   public int getRbcount() {
      return rbcount;
   }

   public void setRbcount(int rbcount) {
      this.rbcount = rbcount;
   }

   public String getTag() {
      return tag;
   }

   public void setTag(String tag) {
      this.tag = tag;
   }

   public Date getRbdate() {
      return rbdate;
   }

   public void setRbdate(Date rbdate) {
      this.rbdate = rbdate;
   }

   public String getRbcontent() {
      return rbcontent;
   }

   public void setRbcontent(String rbcontent) {
      this.rbcontent = rbcontent;
   }

   public int getGrouping() {
      return grouping;
   }

   public void setGrouping(int grouping) {
      this.grouping = grouping;
   }

   public MemberDto getMemberdto() {
      return memberdto;
   }

   public void setMemberdto(MemberDto memberdto) {
      this.memberdto = memberdto;
   }

   @Override
   public String toString() {
      return "RecruitBoardDto [rbseq=" + rbseq + ", memberid=" + memberid + ", title=" + title + ", rbcount="
            + rbcount + ", tag=" + tag + ", rbdate=" + rbdate + ", rbcontent=" + rbcontent + ", grouping="
            + grouping + ", memberdto=" + memberdto + "]";
   }
   
   
   
   
   
}