package com.edu.mvc.model.biz;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.edu.mvc.model.dao.RecruitAnswerDao;
import com.edu.mvc.model.dto.RecruitAnswerDto;

@Service
public class RecruitAnswerBiz {

	@Autowired
	private RecruitAnswerDao dao;
	
	public List<RecruitAnswerDto> selectList(int rbseq) {
		return dao.selectList(rbseq);
	}

	public RecruitAnswerDto selectOne(int raseq) {
		return dao.selectOne(raseq);
	}
	
	
	public int insert(RecruitAnswerDto radto) {
		return dao.insert(radto);
	}

	public int update(RecruitAnswerDto radto) {
		return dao.update(radto);
	}

	public int delete(int raseq) {
		return dao.delete(raseq);
	}
	
	public int countMyRA(String memberid) {
		return dao.countMyRA(memberid);
	}
	
}
