package com.edu.mvc.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.edu.mvc.model.dto.TimerEndDto;

@Repository
public class TimerEndDao {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	
	private String NAMESPACE = "timer.";
	
	
	public List<TimerEndDto> selectAll() {
		return null;
	}
	
	public int insert(TimerEndDto endDto) {
		int res = 0;
		try {
			res = sqlSession.insert(NAMESPACE+"insertEnd", endDto);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return res;
	}
	

}
