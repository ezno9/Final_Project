package com.edu.mvc.model.biz;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.edu.mvc.model.dao.CalendarDao;
import com.edu.mvc.model.dto.CalendarDto;

@Service
public class CalendarBiz {

   @Autowired
   private CalendarDao dao;
   
   public List<CalendarDto> selectList(){
      
      return null;
   }
   
   public CalendarDto selectOne(String memberid) {
      
      return null;
   }
   
   public int insert(CalendarDto dto) {
      return dao.insert(dto);
   }
   
   public int update(CalendarDto dto) {
      return dao.update(dto);
   }
   
   public int delete(String memberid) {
      
      return 0;
   }

   public List<CalendarDto> selectList(String startDate, String endDate, String memberid) {
      return dao.selectList(startDate,endDate,memberid);
   }

   public int delete(CalendarDto dto) {
      return dao.delete(dto);
   }

   public int dropUpdate(CalendarDto dto) {
      return dao.dropUpdate(dto);
   }

public CalendarDto selectScheOne(CalendarDto dto) {
	return dao.selectScheOne(dto);
}
   
}