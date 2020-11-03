package com.edu.mvc.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.edu.mvc.model.dto.RecruitBoardDto;
import com.edu.mvc.model.dto.SearchCriteria;

@Repository
public class RecruitBoardDao {

	@Autowired
	private SqlSessionTemplate sqlSession;

	private String NAMESPACE = "recruitboard.";

	public List<RecruitBoardDto> selectList(SearchCriteria scri) {
		List<RecruitBoardDto> list = new ArrayList<RecruitBoardDto>();

		try {
			list = sqlSession.selectList(NAMESPACE + "selectList", scri);
		} catch (Exception e) {
			System.out.println("[error] : board selectList");
			e.printStackTrace();
		}
		return list;
	}

	public int countBoardList(SearchCriteria scri) {
		int res = 0;

		try {
			res = sqlSession.selectOne(NAMESPACE + "countBoardList", scri);
		} catch (Exception e) {
			System.out.println("[error] : count Board List ");
			e.printStackTrace();
		}

		return res;
	}

	public RecruitBoardDto selectOne(int rbseq) {
		RecruitBoardDto dto = null;

		try {
			dto = sqlSession.selectOne(NAMESPACE + "selectOne", rbseq);
		} catch (Exception e) {
			System.out.println("[error] : board select One");
			e.printStackTrace();
		}

		return dto;
	}

	public int insert(RecruitBoardDto rbdto) {
		int res = 0;

		try {
			res = sqlSession.insert(NAMESPACE + "insert", rbdto);
		} catch (Exception e) {
			System.out.println("[error] : board insert");
			e.printStackTrace();
		}
		return res;
	}

	public int update(RecruitBoardDto rbdto) {
		int res = 0;

		try {
			res = sqlSession.update(NAMESPACE + "update", rbdto);
		} catch (Exception e) {
			System.out.println("[error] : board update");
			e.printStackTrace();
		}

		return res;
	}

	public int delete(int rbseq) {
		int res = 0;

		try {
			res = sqlSession.delete(NAMESPACE + "delete", rbseq);
		} catch (Exception e) {
			System.out.println("[error] : board delete");
			e.printStackTrace();
		}
		return res;
	}

	public int count(int rbseq) {
		int res = 0;

		try {
			res = sqlSession.update(NAMESPACE + "count", rbseq);
		} catch (Exception e) {
			System.out.println("[error] : board count");
			e.printStackTrace();
		}
		return res;
	}

	public int countMyS(String memberid) {
		int res = 0;

		try {
			res = sqlSession.selectOne(NAMESPACE + "selectMyS", memberid);
		} catch (Exception e) {
			System.out.println("[error] : 내 스터디 구인 게시글 조회 오류 ");
			e.printStackTrace();
		}

		return res;
	}

}
