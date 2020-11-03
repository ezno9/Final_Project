package com.edu.mvc.model.biz;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.edu.mvc.model.dao.TimerEndDao;
import com.edu.mvc.model.dto.TimerEndDto;

@Service
public class TimerEndBiz {
	
	@Autowired
	private TimerEndDao endDao;
	

	public List<TimerEndDto> selectAll() {
		return null;
	}
	
	public int insert(TimerEndDto endDto) {
		return endDao.insert(endDto);
	}
	

}
