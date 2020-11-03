package com.edu.mvc.model.biz;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.edu.mvc.model.dao.TimerSumDao;
import com.edu.mvc.model.dto.TimerSumDto;

@Service
public class TimerSumBiz {
	
	@Autowired
	private TimerSumDao sumDao;
	
	public List<TimerSumDto> selectAll(String memberid) {
		System.out.println("biz 성공 ");
		return sumDao.selectAll(memberid);
	}

	//일주
	public TimerSumDto selectMon(String memberid) {
		return sumDao.selectMon(memberid);
	}
	public TimerSumDto selectTue(String memberid) {
		return sumDao.selectTue(memberid);
	}
	public TimerSumDto selectWed(String memberid) {
		return sumDao.selectWed(memberid);
	}
	public TimerSumDto selectThu(String memberid) {
		return sumDao.selectThu(memberid);
	}
	public TimerSumDto selectFri(String memberid) {
		return sumDao.selectFri(memberid);
	}
	public TimerSumDto selectSat(String memberid) {
		return sumDao.selectSat(memberid);
	}
	public TimerSumDto selectSun(String memberid) {
		return sumDao.selectSun(memberid);
	}

	//오늘거 조회 
	public TimerSumDto selectOne(String memberid) {
		return sumDao.selectOne(memberid);
	}
	
	//저장 
	public int insert(TimerSumDto sumDto) {
		return sumDao.insert(sumDto);
	}

	
	//월별 조회 
	public int selectJan(String memberid) {
		return sumDao.selectJan(memberid);
	}
	public int selectFab(String memberid) {
		return sumDao.selectFab(memberid);
	}
	public int selectMar(String memberid) {
		return sumDao.selectMar(memberid);
	}
	public int selectApr(String memberid) {
		return sumDao.selectApr(memberid);
	}
	public int selectMay(String memberid) {
		return sumDao.selectMay(memberid);
	}
	public int selectJun(String memberid) {
		return sumDao.selectJun(memberid);
	}
	public int selectJul(String memberid) {
		return sumDao.selectJul(memberid);
	}
	public int selectAug(String memberid) {
		return sumDao.selectAug(memberid);
	}
	public int selectSep(String memberid) {
		return sumDao.selectSep(memberid);
	}
	public int selectOct(String memberid) {
		return sumDao.selectOct(memberid);
	}
	public int selectNov(String memberid) {
		return sumDao.selectNov(memberid);
	}
	public int selectDec(String memberid) {
		return sumDao.selectDec(memberid);
	}
	
	
}