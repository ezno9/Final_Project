package com.edu.mvc.model.dto;

import java.util.Date;

public class QAnswerDto {
   private int qbseq;
   private int qaseq;
   private String qbmemberid;
   private String qamemberid;
   private String qacontent;
   private Date qadate;
   
   private MemberDto memberdto;

   public QAnswerDto() {
      super();
      // TODO Auto-generated constructor stub
   }

   public QAnswerDto(int qbseq, int qaseq, String qbmemberid, String qamemberid, String qacontent, Date qadate,
         MemberDto memberdto) {
      super();
      this.qbseq = qbseq;
      this.qaseq = qaseq;
      this.qbmemberid = qbmemberid;
      this.qamemberid = qamemberid;
      this.qacontent = qacontent;
      this.qadate = qadate;
      this.memberdto = memberdto;
   }

   @Override
   public String toString() {
      return "QAnswerDto [qbseq=" + qbseq + ", qaseq=" + qaseq + ", qbmemberid=" + qbmemberid + ", qamemberid="
            + qamemberid + ", qacontent=" + qacontent + ", qadate=" + qadate + ", memberdto=" + memberdto + "]";
   }

   public int getQbseq() {
      return qbseq;
   }

   public void setQbseq(int qbseq) {
      this.qbseq = qbseq;
   }

   public int getQaseq() {
      return qaseq;
   }

   public void setQaseq(int qaseq) {
      this.qaseq = qaseq;
   }

   public String getQbmemberid() {
      return qbmemberid;
   }

   public void setQbmemberid(String qbmemberid) {
      this.qbmemberid = qbmemberid;
   }

   public String getQamemberid() {
      return qamemberid;
   }

   public void setQamemberid(String qamemberid) {
      this.qamemberid = qamemberid;
   }

   public String getQacontent() {
      return qacontent;
   }

   public void setQacontent(String qacontent) {
      this.qacontent = qacontent;
   }

   public Date getQadate() {
      return qadate;
   }

   public void setQadate(Date qadate) {
      this.qadate = qadate;
   }

   public MemberDto getMemberdto() {
      return memberdto;
   }

   public void setMemberdto(MemberDto memberdto) {
      this.memberdto = memberdto;
   }
   
   
   
}