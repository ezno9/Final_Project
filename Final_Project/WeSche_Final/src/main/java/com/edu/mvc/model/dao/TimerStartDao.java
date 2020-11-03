package com.edu.mvc.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.edu.mvc.model.dto.TimerStartDto;

@Repository
public class TimerStartDao {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	
	private String NAMESPACE = "timer.";
	
	
	public List<TimerStartDto> selectAll() {
		return null;
	}
	
	public int insert(TimerStartDto startDto) {
		int res = 0;
		try {
			res = sqlSession.insert(NAMESPACE+"insertStart", startDto);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return res;
	}

}
