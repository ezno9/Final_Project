package com.edu.mvc.model.dto;

import java.util.Date;

public class RecruitAnswerDto {
   private int rbseq;
   private int raseq;
   private String rbmemberid;
   private String ramemberid;
   private String racontent;
   private Date radate;
   
   private MemberDto memberdto;

   public RecruitAnswerDto() {
      super();
      // TODO Auto-generated constructor stub
   }

   public RecruitAnswerDto(int rbseq, int raseq, String rbmemberid, String ramemberid, String racontent, Date radate,
         MemberDto memberdto) {
      super();
      this.rbseq = rbseq;
      this.raseq = raseq;
      this.rbmemberid = rbmemberid;
      this.ramemberid = ramemberid;
      this.racontent = racontent;
      this.radate = radate;
      this.memberdto = memberdto;
   }

   public int getRbseq() {
      return rbseq;
   }

   public void setRbseq(int rbseq) {
      this.rbseq = rbseq;
   }

   public int getRaseq() {
      return raseq;
   }

   public void setRaseq(int raseq) {
      this.raseq = raseq;
   }

   public String getRbmemberid() {
      return rbmemberid;
   }

   public void setRbmemberid(String rbmemberid) {
      this.rbmemberid = rbmemberid;
   }

   public String getRamemberid() {
      return ramemberid;
   }

   public void setRamemberid(String ramemberid) {
      this.ramemberid = ramemberid;
   }

   public String getRacontent() {
      return racontent;
   }

   public void setRacontent(String racontent) {
      this.racontent = racontent;
   }

   public Date getRadate() {
      return radate;
   }

   public void setRadate(Date radate) {
      this.radate = radate;
   }

   public MemberDto getMemberdto() {
      return memberdto;
   }

   public void setMemberdto(MemberDto memberdto) {
      this.memberdto = memberdto;
   }

   @Override
   public String toString() {
      return "RecruitAnswerDto [rbseq=" + rbseq + ", raseq=" + raseq + ", rbmemberid=" + rbmemberid + ", ramemberid="
            + ramemberid + ", racontent=" + racontent + ", radate=" + radate + ", memberdto=" + memberdto + "]";
   }
   

   
}