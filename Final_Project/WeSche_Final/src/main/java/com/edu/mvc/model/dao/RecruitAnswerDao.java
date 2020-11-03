package com.edu.mvc.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.edu.mvc.model.dto.RecruitAnswerDto;

@Repository
public class RecruitAnswerDao {

	@Autowired
	private SqlSessionTemplate sqlSession;

	private String NAMESPACE = "recruitanswer.";

	public List<RecruitAnswerDto> selectList(int rbseq) {
		List<RecruitAnswerDto> list = new ArrayList<RecruitAnswerDto>();

		try {
			list = sqlSession.selectList(NAMESPACE + "raselectList", rbseq);
		} catch (Exception e) {
			System.out.println("[error] : study answer selectList");
			e.printStackTrace();
		}

		return list;
	}

	public RecruitAnswerDto selectOne(int raseq) {
		RecruitAnswerDto dto = null;

		try {
			dto = sqlSession.selectOne(NAMESPACE + "raselectOne", raseq);
		} catch (Exception e) {
			System.out.println("[error] : study answer select One");
			e.printStackTrace();
		}
		return dto;
	}

	public int insert(RecruitAnswerDto radto) {
		int res = 0;

		try {
			res = sqlSession.insert(NAMESPACE + "rainsert", radto);
		} catch (Exception e) {
			System.out.println("[error] : study answer insert");
			e.printStackTrace();
		}
		return res;
	}

	public int update(RecruitAnswerDto radto) {
		int res = 0;

		try {
			res = sqlSession.update(NAMESPACE + "raupdate", radto);
		} catch (Exception e) {
			System.out.println("[error] : study answer update");
			e.printStackTrace();
		}
		return res;
	}

	public int delete(int raseq) {
		int res = 0;

		try {
			res = sqlSession.delete(NAMESPACE + "radelete", raseq);
		} catch (Exception e) {
			System.out.println("[error] : study answer delete");
			e.printStackTrace();
		}
		return res;
	}

	public int countMyRA(String memberid) {
		int res = 0;

		try {
			res = sqlSession.selectOne(NAMESPACE + "selectmyra", memberid);
		} catch (Exception e) {
			System.out.println("[error] : 내 스터디 댓글 조회 오류 ");
			e.printStackTrace();
		}
		return res;
	}
}
