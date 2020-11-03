package com.edu.mvc.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.edu.mvc.model.dto.TimerSumDto;

@Repository
public class TimerSumDao {

	@Autowired
	private SqlSessionTemplate sqlSession;

	private String NAMESPACE = "timer.";

	// 전체
	public List<TimerSumDto> selectAll(String memberid) {
		List<TimerSumDto> list = new ArrayList<TimerSumDto>();
		try {
			list = sqlSession.selectList(NAMESPACE + "selectSumAll", memberid);
		} catch (Exception e) {
			System.out.println("[error] : select Time error");
			e.printStackTrace();
		}
		return list;
	}


	// 일주일
	public TimerSumDto selectMon(String memberid) {
		TimerSumDto mon = null;
		try {
			mon = sqlSession.selectOne(NAMESPACE + "selectMon", memberid);
		} catch (Exception e) {
			System.out.println("[error]: mon data 조회 실패 ");
			e.printStackTrace();
		}
		return mon;
	}
	public TimerSumDto selectTue(String memberid) {
		TimerSumDto tue = null;
		try {
			tue = sqlSession.selectOne(NAMESPACE + "selectTue", memberid);
		} catch (Exception e) {
			System.out.println("[error]: tue data 조회 실패 ");
			e.printStackTrace();
		}
		return tue;
	}
	public TimerSumDto selectWed(String memberid) {
		TimerSumDto wed = null;
		try {
			wed = sqlSession.selectOne(NAMESPACE + "selectWed", memberid);
		} catch (Exception e) {
			System.out.println("[error]: wed data 조회 실패 ");
			e.printStackTrace();
		}
		return wed;
	}
	public TimerSumDto selectThu(String memberid) {
		TimerSumDto thu = null;
		try {
			thu = sqlSession.selectOne(NAMESPACE + "selectThu", memberid);
		} catch (Exception e) {
			System.out.println("[error]: thu data 조회 실패 ");
			e.printStackTrace();
		}
		return thu;
	}
	public TimerSumDto selectFri(String memberid) {
		TimerSumDto fri = null;
		try {
			fri = sqlSession.selectOne(NAMESPACE + "selectFri", memberid);
		} catch (Exception e) {
			System.out.println("[error]: fri data 조회 실패 ");
			e.printStackTrace();
		}
		return fri;
	}
	public TimerSumDto selectSat(String memberid) {
		TimerSumDto sat = null;
		try {
			sat = sqlSession.selectOne(NAMESPACE + "selectSat", memberid);
		} catch (Exception e) {
			System.out.println("[error]: sat data 조회 실패 ");
			e.printStackTrace();
		}
		return sat;
	}
	public TimerSumDto selectSun(String memberid) {
		TimerSumDto sun = null;
		try {
			sun = sqlSession.selectOne(NAMESPACE + "selectSun", memberid);
		} catch (Exception e) {
			System.out.println("[error]: sun data 조회 실패 ");
			e.printStackTrace();
		}
		return sun;
	}
	
	
	//오늘거 조회 
	public TimerSumDto selectOne(String memberid) {
		TimerSumDto dto = null;
		try {
			dto = sqlSession.selectOne(NAMESPACE + "selectSumToday", memberid);
		} catch (Exception e) {
			System.out.println("[error] : select One error");
			e.printStackTrace();
		}
		return dto;
	}

	//저장 
	public int insert(TimerSumDto sumDto) {
		int res = 0;
		try {
			res = sqlSession.insert(NAMESPACE + "insertSum", sumDto);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return res;
	}

	
	
	////월별 ///
	//1
	public int selectJan(String memberid) {
		int jan=0;
		try {
			jan = sqlSession.selectOne(NAMESPACE+"selectJan", memberid);
		} catch (Exception e) {
			System.out.println("jan null");
		}
		return jan;
	}
	//2
	public int selectFab(String memberid) {
		int fab=0;
		try {
			fab = sqlSession.selectOne(NAMESPACE+"selectFab", memberid);
		} catch (Exception e) {
			System.out.println("fab null ");
		}
		return fab;
	}
	//3
	public int selectMar(String memberid) {
		int mar=0;
		try {
			mar = sqlSession.selectOne(NAMESPACE+"selectMar", memberid);
		} catch (Exception e) {
			System.out.println("mar null ");
		}
		return mar;
	}
	//4
	public int selectApr(String memberid) {
		int apr=0;
		try {
			apr = sqlSession.selectOne(NAMESPACE+"selectApr", memberid);
		} catch (Exception e) {
			System.out.println("apr null ");
		}
		return apr;
	}
	//5
	public int selectMay(String memberid) {
		int may=0;
		try {
			may = sqlSession.selectOne(NAMESPACE+"selectMay", memberid);
		} catch (Exception e) {
			System.out.println("may null ");
		}
		return may;
	}
	//6
	public int selectJun(String memberid) {
		int jun=0;
		try {
			jun = sqlSession.selectOne(NAMESPACE+"selectJun", memberid);
		} catch (Exception e) {
			System.out.println("jun null ");
		}
		return jun;
	}
	//7
	public int selectJul(String memberid) {
		int jul=0;
		try {
			jul = sqlSession.selectOne(NAMESPACE+"selectJul", memberid);
		} catch (Exception e) {
			System.out.println("jul null ");
		}
		return jul;
	}	
	//8
	public int selectAug(String memberid) {
		int aug=0;
		try {
			aug = sqlSession.selectOne(NAMESPACE+"selectAug", memberid);
		} catch (Exception e) {
			System.out.println("aug null ");
		}
		return aug;
	}
	//9
	public int selectSep(String memberid) {
		int sep=0;
		try {
			sep = sqlSession.selectOne(NAMESPACE+"selectSep", memberid);
		} catch (Exception e) {
			System.out.println("sep null ");
		}
		return sep;
	}
	//10월
	public int selectOct(String memberid) {
		int oct=0;
		try {
			oct = sqlSession.selectOne(NAMESPACE+"selectOct", memberid);
		} catch (Exception e) {
			System.out.println("oct null ");
		}
		return oct;
	}
	//11
	public int selectNov(String memberid) {
		int nov=0;
		try {
			nov = sqlSession.selectOne(NAMESPACE+"selectNov", memberid);
		} catch (Exception e) {
			System.out.println("nov null ");
		}
		return nov;
	}	
	//12
	public int selectDec(String memberid) {
		int dec=0;
		try {
			dec = sqlSession.selectOne(NAMESPACE+"selectDec", memberid);
		} catch (Exception e) {
			System.out.println("dec null ");
		}
		return dec;
	}
}