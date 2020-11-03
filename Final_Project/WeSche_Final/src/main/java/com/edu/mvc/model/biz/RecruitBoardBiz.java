package com.edu.mvc.model.biz;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.edu.mvc.model.dao.RecruitBoardDao;
import com.edu.mvc.model.dto.RecruitBoardDto;
import com.edu.mvc.model.dto.SearchCriteria;


@Service
public class RecruitBoardBiz {

	@Autowired
	private RecruitBoardDao dao;
	
	public List<RecruitBoardDto> selectList(SearchCriteria scri) {
		return dao.selectList(scri);
	}
	
	public int countBoardListTotal(SearchCriteria scri) {
		return dao.countBoardList(scri);
	}

	public RecruitBoardDto selectOne(int rbseq) {
		dao.count(rbseq);
		return dao.selectOne(rbseq);
	}

	public int insert(RecruitBoardDto rbdto) {
		return dao.insert(rbdto);
	}

	public int update(RecruitBoardDto rbdto) {
		return dao.update(rbdto);
	}

	public int delete(int rbseq) {
		return dao.delete(rbseq);
	}
	
	public int countMyS(String memberid) {
		return dao.countMyS(memberid);
	}
	
	
}
