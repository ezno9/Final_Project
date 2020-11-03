package com.edu.mvc.model.biz;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.edu.mvc.model.dao.QAnswerDao;
import com.edu.mvc.model.dto.QAnswerDto;

@Service
public class QAnswerBiz {

	@Autowired
	private QAnswerDao dao;
	
	public List<QAnswerDto> selectList(int qbseq) {
		return dao.selectList(qbseq);
	}
	
	public QAnswerDto selectOne(int qaseq) {
		return dao.selectOne(qaseq);
	}

	public int insert(QAnswerDto qadto) {
		return dao.insert(qadto);
	}

	public int update(QAnswerDto qadto) {
		return dao.update(qadto);
	}

	public int delete(int qaseq) {
		return dao.delete(qaseq);
	}
	
	public int countMyQA(String memberid) {
		return dao.countMyQA(memberid);
	}

}
