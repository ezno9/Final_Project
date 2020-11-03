package com.edu.mvc;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Locale;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.edu.mvc.model.biz.TimerEndBiz;
import com.edu.mvc.model.biz.TimerStartBiz;
import com.edu.mvc.model.biz.TimerSumBiz;
import com.edu.mvc.model.dto.TimerEndDto;
import com.edu.mvc.model.dto.TimerStartDto;
import com.edu.mvc.model.dto.TimerSumDto;

@Controller
public class TimerController {
	
	private static final Logger logger = LoggerFactory.getLogger(TimerController.class);
	
    @Resource
    private HttpSession session;
	
	@Autowired
	private TimerStartBiz startBiz;
	
	@Autowired
	private TimerEndBiz endBiz;
	
	@Autowired
	private TimerSumBiz sumBiz;
	
	@RequestMapping("/startTimer.do")
	@ResponseBody
	public String timer(HttpServletRequest httpServletRequest, TimerStartDto startDto) {
		logger.info("timer record start");
		
		String memberid = httpServletRequest.getParameter("memberid");
		String study_state = httpServletRequest.getParameter("study_state");

		session.setAttribute("study_state", study_state);
		System.out.println(study_state);
		
		startDto.setMemberid(memberid);
		
		if(startBiz.insert(startDto) > 0) {
			logger.info("record start success");
			
			return startDto.getMemberid();
		} else {
			logger.info("record start fail");
			return "실패";
		}
		
	}
	
	
	@RequestMapping("/endNrecordTimer.do")
	@ResponseBody
	public Map<String, Object> timer(HttpServletRequest httpServletRequest, TimerEndDto endDto, TimerSumDto sumDto) {
		logger.info("timer record end");
		
		String memberid = httpServletRequest.getParameter("memberid");
		String study_state = httpServletRequest.getParameter("study_state");
		
		session.setAttribute("study_state", study_state);
		System.out.println(study_state);
		
		SimpleDateFormat format = new SimpleDateFormat("yy/MM/dd", Locale.KOREA);
		Date date = new Date();

		String today_server = format.format(date);			//오늘 날짜
		System.out.println("오늘 날짜: " + today_server);

		Map<String, Object> resmap = new HashMap<String, Object>();
		
		
		endDto.setMemberid(memberid);
		
		int res = 0;
		
		if(endBiz.insert(endDto) > 0) {
			logger.info("record end success");
			
			res = sumBiz.insert(sumDto);
			
			if(res>0) {
				logger.info("디비에도 저장 성공!");
				
				sumDto = sumBiz.selectOne(memberid);		//mapper에서 select해오기 
				System.out.println("여기까지 성공 ");
				System.out.println(sumDto);
				
				resmap.put("memberid", memberid);
				resmap.put("today", sumDto.getToday());
				resmap.put("total", sumDto.getTotal_t());
				
				
				
			} else {
				logger.info("디비 저장 실패 ㅜㅜ ");
			}
			
		} else {
			logger.info("record end fail");
		}
		return resmap;
	}
	
	@RequestMapping("/showAll.do")
	@ResponseBody
	public Map<String, Object> showResult(HttpServletRequest httpServletRequest, TimerSumDto sumDto) {
		logger.info("시간을 모두 불러오기");
		String memberid = httpServletRequest.getParameter("memberid");
		
		String msg_s = "List 불러오기 성공";
		String msg_f = "List 불러오기 실패";
 		
		int mon=0, tue=0, wed=0, thu=0, fri=0, sat=0, sun=0;

		Map<String, Object> map = new HashMap<String, Object>();
		try {
			mon = sumBiz.selectMon(memberid).getTotal_t();
		} catch (NullPointerException e) {
			System.out.println("mon null");
			mon=0;
		}
		try {
			tue = sumBiz.selectTue(memberid).getTotal_t();
		} catch (Exception e) {
			System.out.println("tue null");
			tue=0;
		}
		try {
			wed = sumBiz.selectWed(memberid).getTotal_t();
		} catch (Exception e) {
			System.out.println("wed null");
			wed=0;
		}
		try {
			thu = sumBiz.selectThu(memberid).getTotal_t();
		} catch (Exception e) {
			System.out.println("thu null");
			thu=0;
		}
		try {
			fri = sumBiz.selectFri(memberid).getTotal_t();
		} catch (Exception e) {
			System.out.println("fri null");
			fri=0;
		}
		try {
			sat = sumBiz.selectSat(memberid).getTotal_t();
		} catch (Exception e) {
			System.out.println("sat null");
			sat=0;
		}
		try {
			sun = sumBiz.selectSun(memberid).getTotal_t();
		} catch (Exception e) {
			System.out.println("sun null");
			sun=0;
		}
		
		map.put("msg_s", msg_s);
		map.put("msg_f", msg_f);
		map.put("mon", mon);
		map.put("tue", tue);
		map.put("wed", wed);
		map.put("thu", thu);
		map.put("fri", fri);
		map.put("sat", sat);
		map.put("sun", sun);
		
		System.out.println(mon + ", "+tue+","+wed+","+thu+"," +fri+","+sat+","+sun) ;

		return map;
		
		
	}
	
	
	@RequestMapping("/selectMonth.do")
	@ResponseBody
	public Map<String, Object> selectMonth(HttpServletRequest httpServletRequest, TimerSumDto sumDto) {
		logger.info("select month");
		String memberid = httpServletRequest.getParameter("memberid");
		
		Map<String, Object> resmap = new HashMap<String, Object>();
		
		Integer jan=null, fab=null, mar=null, apr=null, may=null, jun=null, 
				jul=null, aug=null, sep=null, oct=null, nov=null, dec=null;
		
		try { 
			jan=sumBiz.selectJan(memberid); 
		} catch (NullPointerException e) { jan=0; }
		try { 
			fab=sumBiz.selectFab(memberid); 
		} catch (NullPointerException e) { fab=0; }
		try { 
			mar=sumBiz.selectMar(memberid); 
		} catch (NullPointerException e) { mar=0; }
		try { 
			apr=sumBiz.selectApr(memberid); 
		} catch (NullPointerException e) { apr=0; }
		try { 
			may=sumBiz.selectMay(memberid); 
		} catch (NullPointerException e) { may=0; }
		try { 
			jun=sumBiz.selectJun(memberid); 
		} catch (NullPointerException e) { jun=0; }
		try { 
			jul=sumBiz.selectJul(memberid); 
		} catch (NullPointerException e) { jul=0; }
		try { 
			aug=sumBiz.selectAug(memberid); 
		} catch (NullPointerException e) { aug=0; }
		try { 
			sep=sumBiz.selectSep(memberid); 
		} catch (NullPointerException e) { sep=0; }
		try { 
			oct=sumBiz.selectOct(memberid); 
		} catch (NullPointerException e) { oct=0; }
		try { 
			nov=sumBiz.selectNov(memberid); 
		} catch (NullPointerException e) { nov=0; }
		try { 
			dec=sumBiz.selectDec(memberid); 
		} catch (NullPointerException e) { dec=0; }
		

		resmap.put("jan", jan);
		resmap.put("fab", fab);
		resmap.put("mar", mar);
		resmap.put("apr", apr);
		resmap.put("may", may);
		resmap.put("jun", jun);
		resmap.put("jul", jul);
		resmap.put("aug", aug);
		resmap.put("sep", sep);
		resmap.put("oct", oct);
		resmap.put("nov", nov);
		resmap.put("dec", dec);
		
		
		
		return resmap;
	}
	
	
	
	

}