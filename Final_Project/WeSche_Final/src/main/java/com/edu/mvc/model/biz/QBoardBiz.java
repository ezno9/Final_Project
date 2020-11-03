package com.edu.mvc.model.biz;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.edu.mvc.model.dao.QBoardDao;
import com.edu.mvc.model.dto.QBoardDto;
import com.edu.mvc.model.dto.SearchCriteria_qna;

@Service
public class QBoardBiz {

	@Autowired
	private QBoardDao dao;
	
	public List<QBoardDto> selectList(SearchCriteria_qna scri) {
		return dao.selectList(scri);
	}
		
	public QBoardDto selectOne(int myno) {
		dao.count(myno);
		return dao.selectOne(myno);
	}

	public int insert(QBoardDto qbdto) {
		return dao.insert(qbdto);
	}

	public int update(QBoardDto qbdto) {
		return dao.update(qbdto);
	}

	public int delete(int myno) {
		return dao.delete(myno);
	}
	
	public int countMyQ(String memberid) {
		return dao.countMyQ(memberid);
	}
	
}
