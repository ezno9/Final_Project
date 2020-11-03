package com.edu.mvc.model.biz;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.edu.mvc.model.dao.TimerStartDao;
import com.edu.mvc.model.dto.TimerStartDto;

@Service
public class TimerStartBiz {
	
	@Autowired
	private TimerStartDao startDao;
	
	
	public List<TimerStartDto> selectAll() {
		return null;
	}
	
	public int insert(TimerStartDto startDto) {
		return startDao.insert(startDto);
	}

}
