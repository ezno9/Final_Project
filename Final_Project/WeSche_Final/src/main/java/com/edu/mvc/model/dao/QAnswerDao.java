package com.edu.mvc.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.edu.mvc.model.dto.QAnswerDto;

@Repository
public class QAnswerDao {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	private String NAMESPACE = "qanswer.";
	
	public List<QAnswerDto> selectList(int qbseq) {
		List<QAnswerDto> list = new ArrayList<QAnswerDto>();
		try {
			list = sqlSession.selectList(NAMESPACE+"qaselectList", qbseq);
		} catch (Exception e) {
			System.out.println("[error] : qna answer qaselectList");
			e.printStackTrace();
		}
		return list;
	}

	public QAnswerDto selectOne(int qaseq) {
		QAnswerDto dto = null;
		
		try {
			dto = sqlSession.selectOne(NAMESPACE+"qaselectOne", qaseq);
		} catch (Exception e) {
			System.out.println("[error] : qna select One");
			e.printStackTrace();
		}
		return dto;
	}
	

	public int insert(QAnswerDto qadto) {
		int res = 0;
		
		try {
			res = sqlSession.insert(NAMESPACE+"qainsert", qadto);
		} catch (Exception e) {
			System.out.println("[error] : qna answer insert");
			e.printStackTrace();
		}
		return res;
	}
	

	public int update(QAnswerDto qadto) {
		int res = 0;
		
		try {
			res = sqlSession.update(NAMESPACE+"qaupdate", qadto);
		} catch (Exception e) {
			System.out.println("[error] : qna answer update");
			e.printStackTrace();
		}
		return res;
	}

	public int delete(int qaseq) {
		int res = 0;
		
		try {
			res = sqlSession.delete(NAMESPACE+"qadelete", qaseq);
		} catch (Exception e) {
			System.out.println("[error] : qna answer delete");
			e.printStackTrace();
		}
		
		return res;
	}
	
	
	public int countMyQA(String memberid) {
		int res = 0;
		
		try {
			res = sqlSession.selectOne(NAMESPACE+"selectmyqa", memberid);
		} catch (Exception e) {
			System.out.println("[error] : QNA 내 댓글 조회 오류 ");
			e.printStackTrace();
		}
		return res;
	}
	
}
