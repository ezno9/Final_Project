package com.edu.mvc.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.edu.mvc.model.dto.QBoardDto;
import com.edu.mvc.model.dto.SearchCriteria_qna;

@Repository
public class QBoardDao {

	@Autowired
	private SqlSessionTemplate sqlSession;

	private String NAMESPACE = "qboard.";

	public List<QBoardDto> selectList(SearchCriteria_qna scri) {
		List<QBoardDto> dtos = null;
		try {
			dtos = sqlSession.selectList(NAMESPACE+"selectList", scri);
		} catch (Exception e) {
			System.out.println("[error] : qna select List");
			e.printStackTrace();
		}
		return dtos;
	}

	public QBoardDto selectOne(int myno) {
		QBoardDto dto = null;
		try {
			dto = sqlSession.selectOne(NAMESPACE+"selectOne", myno);
		} catch (Exception e) {
			System.out.println("[error] : qna select One");
			e.printStackTrace();
		}
		return dto;
	}

	public int insert(QBoardDto dto) {
		int res = 0;
		
		try {
			res = sqlSession.insert(NAMESPACE+"insert", dto);
		} catch (Exception e) {
			System.out.println("[error] : qna isnert");
			e.printStackTrace();
		}
		return res;
	}

	public int update(QBoardDto qbdto) {
		int res = 0;
		
		try {
			res = sqlSession.update(NAMESPACE+"update", qbdto);
		} catch (Exception e) {
			System.out.println("[error] : qna update");
			e.printStackTrace();
		}
		return res;
	}

	public int delete(int myno) {
		int res = 0;
		
		try {
			res = sqlSession.delete(NAMESPACE+"delete", myno);
		} catch (Exception e) {
			System.out.println("[error] : qna delete");
			e.printStackTrace();
		}
		return res;
	}
	
	public int count(int myno) {
		int res = 0;
		
		try {
			res = sqlSession.update(NAMESPACE+"count", myno);
		} catch (Exception e) {
			System.out.println("[error] : qna count");
			e.printStackTrace();
		}
		return res;
	}
	
	
	public int countMyQ(String memberid) {
		int res = 0;
		
		try {
			res = sqlSession.selectOne(NAMESPACE+"myqaselect", memberid);
		} catch (Exception e) {
			System.out.println("[error] : 내 글 개수 조회 실패 ");
			e.printStackTrace();
		}
		return res;
	}


	
}
