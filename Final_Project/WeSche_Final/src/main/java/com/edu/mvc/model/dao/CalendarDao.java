package com.edu.mvc.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.edu.mvc.model.dto.CalendarDto;

@Repository
public class CalendarDao {

   @Autowired
   private SqlSessionTemplate sqlSession;

   private String NAMESPACE = "calendar.";

   public List<CalendarDto> selectList() {

      return null;
   }

   public CalendarDto selectOne(String memberid) {

      return null;
   }

   public int insert(CalendarDto dto) {
      int res = 0;
      res = sqlSession.insert(NAMESPACE+"insert",dto);
      return res;
   }

   public int update(CalendarDto dto) {
      int res = 0;
      res = sqlSession.update(NAMESPACE+"update",dto);
      return res;
   }

   public int delete(String memberid) {

      return 0;
   }

   public List<CalendarDto> selectList(String startDate, String endDate, String memberid) {
      List<CalendarDto> list = new ArrayList<>();
      startDate += " 00:00";
      endDate += " 23:59";
      System.out.println("startDate : " + startDate);
      System.out.println("endDate : " + endDate);
      CalendarDto cdto = new CalendarDto();
      cdto.setStart(startDate);
      cdto.setEnd(endDate);
      cdto.setUsername(memberid);
      list = sqlSession.selectList(NAMESPACE+"selectCheck",cdto);
      System.out.println("list 사이즈 : " + list.size());
      return list;
   }

   public int delete(CalendarDto dto) {
      int res = 0;
      res = sqlSession.delete(NAMESPACE+"delete",dto);
      return res;
   }

   public int dropUpdate(CalendarDto dto) {
      int res = sqlSession.update(NAMESPACE+"dropUpdate",dto);
      return res;
   }

public CalendarDto selectScheOne(CalendarDto dto) {
	CalendarDto cdto = new CalendarDto();
	cdto = sqlSession.selectOne(NAMESPACE+"selectScheOne",dto);
	return cdto;
}

}