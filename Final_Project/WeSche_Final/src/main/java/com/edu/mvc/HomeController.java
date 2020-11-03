package com.edu.mvc;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.StringTokenizer;
import java.util.UUID;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.util.WebUtils;

import com.edu.mvc.model.biz.CalendarBiz;
import com.edu.mvc.model.biz.ChatBiz;
import com.edu.mvc.model.biz.MemberBiz;
import com.edu.mvc.model.biz.QAnswerBiz;
import com.edu.mvc.model.biz.QBoardBiz;
import com.edu.mvc.model.biz.RecruitAnswerBiz;
import com.edu.mvc.model.biz.RecruitBoardBiz;
import com.edu.mvc.model.dto.CalendarDto;
import com.edu.mvc.model.dto.ChatlistDto;
import com.edu.mvc.model.dto.ChatuserDto;
import com.edu.mvc.model.dto.MemberDto;
import com.edu.mvc.model.dto.PageMaker;
import com.edu.mvc.model.dto.QAnswerDto;
import com.edu.mvc.model.dto.QBoardDto;
import com.edu.mvc.model.dto.RecruitAnswerDto;
import com.edu.mvc.model.dto.RecruitBoardDto;
import com.edu.mvc.model.dto.SearchCriteria;
import com.edu.mvc.model.dto.SearchCriteria_qna;

@Controller
public class HomeController {

	@Autowired
	private ChatBiz cbiz;

	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);

	@Resource
	private HttpSession session;

	@RequestMapping(value = "/index.do", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		logger.info("[log] : index.jsp");

		String login_id = (String) session.getAttribute("login_id");

		session.setAttribute("chatlistbyid", cbiz.selectRoomByIdS(login_id));
		model.addAttribute("studylistbyking", cbiz.selectStudyListByKing(login_id));

		return "index";
	}

	//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	// QBoard //
	@Autowired
	private QBoardBiz QBBiz;

	@RequestMapping("/qna.do")
	public String qna(HttpServletRequest httpServletRequest, Model model, SearchCriteria_qna scri) {
		logger.info("[log] : qna.jsp");
		int myno = Integer.parseInt(httpServletRequest.getParameter("myno").trim());

		List<QBoardDto> dtos = QBBiz.selectList(scri);
		int res = dtos.size();
		List<QBoardDto> dtoss = new ArrayList<>();
		int mynumber = myno;
		mynumber *= 5;

		if (res < 5) {
			for (int i = 0; i < res; i++) {
				dtoss.add(dtos.get(i));
			}
		} else {
			for (int i = mynumber; i < mynumber + 5; i++) {
				dtoss.add(dtos.get(i));
			}
		}

		model.addAttribute("dtoss", dtoss);
		model.addAttribute("myno", myno);
		model.addAttribute("res", res);

		return "qna";
	}

	@ResponseBody
	@RequestMapping("/ajaxQBoard.do")
	public Map<String, Object> ajaxQBoard(HttpServletRequest httpServletRequest, SearchCriteria_qna scri) {
		int myno = Integer.parseInt(httpServletRequest.getParameter("myno").trim());
		List<QBoardDto> dtos = QBBiz.selectList(scri);
		int res = dtos.size();
		List<QBoardDto> dtoss = new ArrayList<>();
		Map<String, Object> rmap = new HashMap<>();
		int mynumber = myno;
		mynumber *= 5;

		if (res - mynumber < 5) {
			for (int i = mynumber; i < res; i++) {
				dtoss.add(dtos.get(i));
			}
		} else {
			for (int i = mynumber; i < mynumber + 5; i++) {
				dtoss.add(dtos.get(i));
			}
		}

		rmap.put("myno", myno);
		rmap.put("dtoss", dtoss);
		rmap.put("res", res);

		return rmap;
	}

	@RequestMapping("/qnainsertform.do")
	public String qnaInsertForm(HttpServletRequest httpServletRequest, Model model) {
		session = httpServletRequest.getSession();
		logger.info("[log] : qna insert form");
		if (session.getAttribute("logindto") == null) {
			return "redirect:login.do";
		} else {
			MemberDto mdto = (MemberDto) httpServletRequest.getAttribute("login");
			model.addAttribute("mdto", mdto);
			return "qnainsert";
		}
	}

	@RequestMapping("/qnainsertres.do")
	public String qnaInsertRes(MultipartHttpServletRequest request, QBoardDto qbdto) throws Exception {
		logger.info("[log] : qna insert res");

		logger.info("qnainsert");
		UUID uuid = UUID.randomUUID();

		System.out.println("qbdto.getQbseq():" + qbdto.getQbseq());
		if (qbdto.getMpfile().getOriginalFilename().equals("")
				|| qbdto.getMpfile().getOriginalFilename().equals(null)) {
			qbdto.setQbfilename(null);
		} else {
			String filePath = WebUtils.getRealPath(request.getSession().getServletContext(), "/assets/img/upload/");

			File content = new File(filePath);
			if (!content.exists()) {
				content.mkdir();
			}

			Iterator<String> iterator = request.getFileNames();
			String content_photo = null;

			qbdto.setQbfilename(content_photo);
			List<String> name = new ArrayList<String>();

			while (iterator.hasNext()) {
				String flTagNm = iterator.next();
				List<MultipartFile> flLst = request.getFiles(flTagNm);
				for (MultipartFile file : flLst) {
					System.out.println("업로드 성공");
					content_photo = uuid.toString() + file.getOriginalFilename();
					name.add(content_photo);
					try {
						file.transferTo(new File(filePath + content_photo));
					} catch (Exception e) {
						e.printStackTrace();
						System.out.println("업로드 중 오류!!!!!!!");
					}
				}
			}
			StringBuilder br = new StringBuilder();
			for (int i = 0; i < name.size(); i++) {
				if (i != name.size() - 1) {
					br.append(name.get(i) + " ");
				} else {
					br.append(name.get(i));
				}
			}

			qbdto.setQbfilename(br.toString());
		}

		int res = QBBiz.insert(qbdto);
		if (res > 0) {
			return "redirect:qna.do?myno=0";
		} else {
			return "redirect:qnainsertform.do";
		}
	}

	@Autowired
	private QAnswerBiz qabiz;

	@RequestMapping("/qnadetail.do")
	public String qnadetail(HttpServletRequest httpServletRequest, Model model) {
		session = httpServletRequest.getSession();
		int qbseq = Integer.parseInt(httpServletRequest.getParameter("qbseq").trim());
		int pagelength = Integer.parseInt(httpServletRequest.getParameter("pagelength").trim());

		logger.info("[log] : qnadetail.jsp");
		QBoardDto mdto = QBBiz.selectOne(qbseq);

		if (session.getAttribute("logindto") == null) {
			System.out.println(session.getAttribute("logindto") == null);
			return "redirect:login.do";
		} else {
			// 현재 session에 담겨있는 로그인 정보들을 객체로 남아서 qnadetail페이지로 넘겨줌.

			StringTokenizer st = null;
			List<String> imageList = null;
			if (mdto.getQbfilename() != null) {

				imageList = new ArrayList<String>();
				st = new StringTokenizer(mdto.getQbfilename(), " ");

				while (st.hasMoreTokens()) {
					imageList.add(st.nextToken());
				}
			} else {
				imageList = null;
			}
			model.addAttribute("imageList", imageList);

			model.addAttribute("pagelength", pagelength);
			model.addAttribute("qbseq", qbseq);
			model.addAttribute("mdto", mdto);
			model.addAttribute("qadto", qabiz.selectList(qbseq));

			ChatlistDto cdto = cbiz.selectRoomq(qbseq);
			model.addAttribute("cdto", cdto);

			return "qnadetail";
		}
	}

	@RequestMapping("/qnadelete.do")
	public String qnadelete(HttpServletRequest httpServletRequest, int myno) {
		session = httpServletRequest.getSession();
		logger.info("[log] : qna delete");

		if (session.getAttribute("logindto") == null) {
			System.out.println(session.getAttribute("logindto") == null);
			return "redirect:login.do";
		} else {
			int res = QBBiz.delete(myno);
			if (res > 0) {
				return "redirect:qna.do?myno=0";
			} else {
				return "redirect:qna.do?myno=0";
			}
		}
	}

	@RequestMapping("/qnaupdateform.do")
	public String qnaUpdateForm(HttpServletRequest httpServletRequest, Model model, int myno, int pagelength) {
		session = httpServletRequest.getSession();
		logger.info("[log] : qna update form");
		QBoardDto qbdto = QBBiz.selectOne(myno);
		if (session.getAttribute("logindto") == null) {
			System.out.println(session.getAttribute("logindto") == null);
			return "redirect:login.do";
		} else {
			StringTokenizer st = null;
			List<String> imageList = null;
			if (qbdto.getQbfilename() != null) {

				imageList = new ArrayList<String>();
				st = new StringTokenizer(qbdto.getQbfilename(), " ");

				while (st.hasMoreTokens()) {
					imageList.add(st.nextToken());
				}
			} else {
				imageList = null;
			}
			model.addAttribute("imageList", imageList);

			model.addAttribute("qbdto", qbdto);
			model.addAttribute("pagelength", pagelength);

			return "qnaupdate";
		}
	}

	@RequestMapping("/qnaupdateres.do")
	public String qnaUpdateRes(MultipartHttpServletRequest request, HttpServletRequest httpServletRequest, Model model,
			QBoardDto qbdto, int pagelength) throws Exception {
		session = httpServletRequest.getSession();
		logger.info("[log] : qna update res");

		UUID uuid = UUID.randomUUID();
		QBoardDto dto = qbiz.selectOne(qbdto.getQbseq());

		if (qbdto.getMpfile().getOriginalFilename().equals("")
				|| qbdto.getMpfile().getOriginalFilename().equals(null)) {
			qbdto.setQbfilename(dto.getQbfilename());
		} else {
			String filePath = WebUtils.getRealPath(request.getSession().getServletContext(), "/assets/img/upload/");

			File content = new File(filePath);
			if (!content.exists()) {
				content.mkdir();
			}

			Iterator<String> iterator = request.getFileNames();
			String content_photo = null;

			qbdto.setQbfilename(content_photo);
			List<String> name = new ArrayList<String>();

			while (iterator.hasNext()) {
				String flTagNm = iterator.next();
				List<MultipartFile> flLst = request.getFiles(flTagNm);
				for (MultipartFile file : flLst) {
					System.out.println("업로드 성공");
					content_photo = uuid.toString() + file.getOriginalFilename();
					name.add(content_photo);
					try {
						file.transferTo(new File(filePath + content_photo));
					} catch (Exception e) {
						e.printStackTrace();
						System.out.println("업로드 중 오류!!!!!!!");
					}
				}
			}
			StringBuilder br = new StringBuilder();
			for (int i = 0; i < name.size(); i++) {
				if (i != name.size() - 1) {
					br.append(name.get(i) + " ");
				} else {
					br.append(name.get(i));
				}
			}

			qbdto.setQbfilename(br.toString());
		}

		if (session.getAttribute("logindto") == null) {
			System.out.println(session.getAttribute("logindto") == null);
			return "redirect:login.do";
		} else {
			int res = QBBiz.update(qbdto);
			if (res > 0) {
				return "redirect:qnadetail.do?qbseq=" + qbdto.getQbseq() + "&pagelength=" + pagelength;
			} else {
				return "redirect:qnaupdateform.do?myno=" + qbdto.getQbseq();
			}
		}
	}

/////////////////////////////////////// qna 댓글 //////////////////////////////////////////////////

	@RequestMapping("/qnaanswerinsert.do")
	public String qnaAnswerInsert(QAnswerDto qadto, int pagelength) {
		logger.info("[log] : qna answer insert");
		int res = qabiz.insert(qadto);

		if (res > 0) {
			return "redirect:qnadetail.do?qbseq=" + qadto.getQbseq() + "&pagelength=" + pagelength;
		} else {
			return "redirect:qna.do?myno=0";
		}
	}

	@RequestMapping("/qnaanswerupdateform.do")
	public String qnaAnswerUpdateForm(Model model, QAnswerDto qadto, int qaseq, int pagelength) {
		logger.info("[log] : qna answer update form");

		model.addAttribute("qadto", qabiz.selectOne(qaseq));
		model.addAttribute("pagelength", pagelength);

		return "qnaanswerupdate";
	}

	@RequestMapping("/qnaanswerupdateres.do")
	public String qnaAnswerUpdateRes(QAnswerDto qadto, int pagelength) {
		logger.info("[log] : qna answer update res");
		System.out.println("컨트롤러에서 update res : " + qabiz.update(qadto));
		int res = qabiz.update(qadto);

		if (res > 0) {
			return "redirect:qnadetail.do?qbseq=" + qadto.getQbseq() + "&pagelength=" + pagelength;
		} else {
			return "redirect:qna.do?myno=0";
		}
	}

	@RequestMapping("/qnaanswerdelete.do")
	public String qnaAnswerDelete(int qbseq, int qaseq, int pagelength) {
		int res = qabiz.delete(qaseq);

		if (res > 0) {
			return "redirect:qnadetail.do?qbseq=" + qbseq + "&pagelength=" + pagelength;
		} else {
			return "redirect:qna.do?myno=0";
		}
	}

////////////////////////////////// 유튜브 게시판  //////////////////////////////////////////////////////////

	@RequestMapping("/youtube.do")
	public String youtube() {
		logger.info("[log] : youtube.jsp");
		return "youtube";
	}

//////////////////////////////////// 스터디 게시판 ////////////////////////////////////////////////////////////////

	@Autowired
	private RecruitBoardBiz rbbiz;

	@Autowired
	private RecruitAnswerBiz rabiz;

	@RequestMapping("/study.do")
	public String study(Model model, SearchCriteria scri) {
		logger.info("[log] : study.jsp");

		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(scri);
		pageMaker.setTotalCount(rbbiz.countBoardListTotal(scri));

		model.addAttribute("pageMaker", pageMaker);
		model.addAttribute("study", rbbiz.selectList(scri));

		return "study";
	}

	@RequestMapping("/studyinsertform.do")
	public String studyInsertForm() {
		logger.info("[log] : studyinsertform");
		return "studyinsert";
	}

	@RequestMapping("/studyinsertres.do")
	public String studyInsertRes(RecruitBoardDto rbdto) {
		logger.info("[log] : studyinsertres");
		int res = rbbiz.insert(rbdto);
		if (res > 0) {
			return "redirect:study.do";
		} else {
			return "redirect:studyinsertform.do";
		}
	}

	@RequestMapping("/studyupdateform.do")
	public String studyUpdateForm(Model model, int rbseq) {
		logger.info("[log] : study update form");

		model.addAttribute("rbdto", rbbiz.selectOne(rbseq));

		return "studyupdate";
	}

	@RequestMapping("/studyupdateres.do")
	public String studyUpdateRes(RecruitBoardDto rbdto) {
		logger.info("[log] : study update res");
		int res = rbbiz.update(rbdto);
		if (res > 0) {
			return "redirect:studydetail.do?rbseq=" + rbdto.getRbseq();
		} else {
			return "redirect:studyupdateform.do?rbseq=" + rbdto.getRbseq();
		}

	}

	@RequestMapping("delete.do")
	public String delete(int rbseq) {
		logger.info("[log] : study delete");
		int res = rbbiz.delete(rbseq);

		if (res > 0) {
			return "redirect:study.do";
		} else {
			return "redirect:studydetail.do?rbseq=" + rbseq;
		}
	}

	@RequestMapping("/studydetail.do")
	public String studyDetail(Model model, int rbseq) {
		logger.info("[log] : study detail");
		model.addAttribute("rbdto", rbbiz.selectOne(rbseq));
		model.addAttribute("radto", rabiz.selectList(rbseq));

		ChatlistDto cdto = cbiz.selectRooms(rbseq);
		model.addAttribute("cdto", cdto);
		return "studydetail";
	}

//////////////////////////////////// 스터디 게시판 댓글 //////////////////////////////////////////////   

	@RequestMapping("/studyanswerinsert.do")
	public String studyAnswerInsert(RecruitAnswerDto radto) {
		int res = rabiz.insert(radto);
		if (res > 0) {
			return "redirect:studydetail.do?rbseq=" + radto.getRbseq();
		} else {
			return "redirect:studydetail.do?rbseq=" + radto.getRbseq();
		}
	}

	@RequestMapping("/studyanswerupdateform.do")
	public String studyAnswerUpdateForm(Model model, RecruitAnswerDto radto, int raseq) {
		logger.info("[log] : study answer update form");

		model.addAttribute("radto", rabiz.selectOne(raseq));
		System.out.println("프로필 사진 : "+rabiz.selectList(raseq));

		return "studyanswerupdate";
	}

	@RequestMapping("/studyanswerupdateres.do")
	public String studyAnswerUpdateRes(RecruitAnswerDto radto) {
		logger.info("[log] : study answer update res");
		System.out.println("컨트롤러에서 update res : " + rabiz.update(radto));
		int res = rabiz.update(radto);

		if (res > 0) {
			return "redirect:studydetail.do?rbseq=" + radto.getRbseq();
		} else {
			return "redirect:study.do?";
		}
	}

	@RequestMapping("/studyanswerdelete.do")
	public String studyAnswerDelete(int rbseq, int raseq) {
		int res = rabiz.delete(raseq);

		if (res > 0) {
			return "redirect:studydetail.do?rbseq=" + rbseq;
		} else {
			return "redirect:study.do?";
		}
	}

/////////////////////////////////// 마이 페이지 //////////////////////////////////////////////////////

	@Autowired
	MemberBiz mbiz = new MemberBiz();

	@Autowired
	QBoardBiz qbiz = new QBoardBiz();

	@Autowired
	QAnswerBiz qnabiz = new QAnswerBiz();

	@Autowired
	RecruitBoardBiz rbiz = new RecruitBoardBiz();

	@Autowired
	RecruitAnswerBiz rnabiz = new RecruitAnswerBiz();

	@Autowired
	ChatBiz chbiz = new ChatBiz();

	@RequestMapping("/mypage.do")
	public String mypage(HttpServletRequest httpServletRequest, Model model, String memberid) {
		logger.info("[log] : mypage.jsp");
		session = httpServletRequest.getSession();

		MemberDto mdto = new MemberDto();

		memberid = (String) session.getAttribute("login_id");
		System.out.println(memberid); // 로그인한 아이디 받아오기

		mdto = mbiz.selectMe(memberid);

		int qB = qbiz.countMyQ(memberid);
		int rB = rbiz.countMyS(memberid);

		int myBoard = qB + rB;

		int qnaB = qnabiz.countMyQA(memberid);
		int rnaB = rnabiz.countMyRA(memberid);

		int myReply = qnaB + rnaB;

		int cB = chbiz.countMyStudy(memberid);

		if (memberid.equals(mdto.getMemberid())) {
//         System.out.println(mdto);
//         System.out.println("질문글:"+qB);
//         System.out.println("스터디구인글:"+rB);
//         System.out.println("합치면:" + myBoard);
//         
//         System.out.println("질문댓글: " + qnaB);
//         System.out.println("스터디댓글: " + rnaB);
//         System.out.println("두개 합치면: " + myReply);

			System.out.println(cB);

			System.out.println("성공");
			model.addAttribute("mdto", mdto);
			model.addAttribute("myBoard", myBoard);
			model.addAttribute("myReply", myReply);
			model.addAttribute("cB", cB);

		} else {
			System.out.println("안되넹...");
		}

		return "mypage";
	}

	@RequestMapping("/mypageupdate.do")
	public String mypageUpdate(MultipartHttpServletRequest request, HttpServletRequest httpServletRequest,
			MemberDto mDto) throws Exception {
		logger.info("회원 정보 변경하기");

		String memberid = (String) httpServletRequest.getParameter("memberid");
		String name = (String) httpServletRequest.getParameter("name");
		String email = (String) httpServletRequest.getParameter("email");

		MemberDto memberdto = mbiz.selectMe(memberid);

		String filename = "";
		UUID uuid = UUID.randomUUID();
		MultipartFile file = mDto.getMpfile();
		if (file.getOriginalFilename().equals(null) || file.getOriginalFilename().equals("")) {
			System.out.println(mbiz.selectMe(memberid).getFilename());
			filename = memberdto.getFilename();
		} else {
			System.out.println("오리지널이름" + file.getOriginalFilename());
			filename = uuid.toString() + file.getOriginalFilename();
			InputStream inputstream = null;
			OutputStream outputstream = null;

			if (filename != "") {
				try {
					inputstream = file.getInputStream();
					// 폴더와 파일 만듦
					String path = WebUtils.getRealPath(request.getSession().getServletContext(),
							"./assets/img/profile/");
					System.out.println("업로드 될 실제 경로 : " + path);

					File newFile = new File(path + "/" + filename);
					if (!newFile.exists()) {
						newFile.createNewFile();
					}

					outputstream = new FileOutputStream(newFile);

					int read = 0;
					byte[] b = new byte[(int) file.getSize()];

					while ((read = inputstream.read(b)) != -1) {
						outputstream.write(b, 0, read);
					}

				} catch (IOException e) {
					e.printStackTrace();
				} finally {
					try {
						inputstream.close();
						outputstream.close();
					} catch (IOException e) {
						e.printStackTrace();
					}
				}
			}
			session.setAttribute("myprofileimg", filename);
		}

		mDto.setMemberid(memberid);
		mDto.setName(name);
		mDto.setEmail(email);
		mDto.setFilename(filename);

		int res = mbiz.update(mDto);

		if (res > 0) {
			System.out.println("성공@!@@");
			return "redirect:mypage.do";

		} else {
			System.out.println("안되네유..");
			return null;
		}
	}

////////////////////////////////// 타이머 ////////////////////////////////////////////////

	@RequestMapping("/openTimer.do")
	public String timer() {
		logger.info("[log] : timer.jsp");
		return "timer";
	}

//////////////////////////////////캘린더 ////////////////////////////////////////////////   

	@Autowired
	private CalendarBiz calbiz;

	@ResponseBody
	@RequestMapping(value = "/getAllSche.do", method = RequestMethod.POST)
	public Map<String, Object> getAllSche(HttpServletRequest httpServletRequest) {
		Map<String, Object> rmap = new HashMap<>();
		String startDate = httpServletRequest.getParameter("startDate");
		String endDate = httpServletRequest.getParameter("endDate");
		String memberid = ((MemberDto) httpServletRequest.getSession().getAttribute("logindto")).getMemberid().trim();
		List<CalendarDto> clist = new ArrayList<>();
		clist = calbiz.selectList(startDate, endDate, memberid);
		System.out.println(clist.size());
		for (int i = 0; i < clist.size(); i++) {
			rmap.put("evt" + i, clist.get(i));
		}

		System.out.println("가져오는 총 갯수 : " + rmap.size());
		return rmap;
	}

	@ResponseBody
	@RequestMapping(value = "/addSche.do", method = RequestMethod.POST)
	public Map<String, Object> addSche(HttpServletRequest httpServletRequest) {
		Map<String, Object> rmap = new HashMap<>();
		String _id = httpServletRequest.getParameter("_id").trim();
		String title = httpServletRequest.getParameter("title").trim();
		String start = httpServletRequest.getParameter("start").trim();
		String end = httpServletRequest.getParameter("end").trim();
		String description = httpServletRequest.getParameter("description").trim();
		String type = httpServletRequest.getParameter("type").trim();
		String username = ((MemberDto) httpServletRequest.getSession().getAttribute("logindto")).getMemberid().trim();
		String backgroundColor = httpServletRequest.getParameter("backgroundColor").trim();
		String textColor = httpServletRequest.getParameter("textColor").trim();
		boolean allDay = false;
		System.out.println(_id);
		System.out.println(title);
		System.out.println(start);
		System.out.println(end);
		System.out.println(description);
		System.out.println(type);
		System.out.println(username);
		System.out.println(backgroundColor);
		System.out.println(textColor);
		System.out.println(allDay);
		CalendarDto cdto = new CalendarDto(_id, title, start, end, description, type, username, backgroundColor,
				textColor, allDay);
		// 개인
		if (type.equals("개인")) {

			int res = calbiz.insert(cdto);
			if (res > 0) {
				System.out.println("생성 완료");
			} else {
				System.out.println("생성 실패");
			}

			return rmap;

			// 개인이 아닐 때
		} else {
			List<ChatuserDto> chatuserlist = new ArrayList<>();
			chatuserlist = chbiz.selectStudyAll(type);

			for (int i = 0; i < chatuserlist.size(); i++) {
				cdto.setUsername(chatuserlist.get(i).getChat_user_id());
				int res = calbiz.insert(cdto);
				if (res > 0) {
					System.out.println("생성 완료");
				} else {
					System.out.println("생성 실패");
				}
			}
			return rmap;
		}
	}

	@ResponseBody
	@RequestMapping(value = "/dropUpdateSche.do", method = RequestMethod.POST)
	public Map<String, Object> dropUpdateSche(HttpServletRequest httpServletRequest) {
		Map<String, Object> rmap = new HashMap<>();
		String id = httpServletRequest.getParameter("_id").trim();
		String start = httpServletRequest.getParameter("start").trim();
		String end = httpServletRequest.getParameter("end").trim();
		String type = httpServletRequest.getParameter("type").trim();
		CalendarDto dto = new CalendarDto();
		dto.set_id(id);
		dto.setUsername(((MemberDto) httpServletRequest.getSession().getAttribute("logindto")).getMemberid());
		dto.setStart(start);
		dto.setEnd(end);

		if (type.equals("개인")) {
			int res = calbiz.dropUpdate(dto);

			boolean valid = false;
			if (res > 0) {
				valid = true;
			}
			rmap.put("valid", valid);
			return rmap;

		} else {

			List<ChatuserDto> chatuserlist = new ArrayList<>();
			chatuserlist = chbiz.selectStudyAll(type);

			for (int i = 0; i < chatuserlist.size(); i++) {
				dto.setUsername(chatuserlist.get(i).getChat_user_id());
				int res = calbiz.dropUpdate(dto);
				if (res > 0) {
					System.out.println("업데이트 완료");
				} else {
					System.out.println("업데이트 실패");
				}
			}
			return rmap;
		}
	}

	@ResponseBody
	@RequestMapping(value = "/deleteSche.do", method = RequestMethod.POST)
	public Map<String, Object> deleteSche(HttpServletRequest httpServletRequest) {
		Map<String, Object> rmap = new HashMap<>();
		String id = httpServletRequest.getParameter("_id").trim();
		CalendarDto dto = new CalendarDto();
		dto.set_id(id);
		dto.setUsername(((MemberDto) httpServletRequest.getSession().getAttribute("logindto")).getMemberid());

		CalendarDto cdto = calbiz.selectScheOne(dto);
		int res = -1;

		if (cdto.getType().equals("개인")) {
			res = calbiz.delete(dto);
			boolean valid = false;
			if (res > 0) {
				valid = true;
			}
			rmap.put("valid", valid);
			return rmap;

		} else {
			List<ChatuserDto> chatuserlist = new ArrayList<>();
			chatuserlist = chbiz.selectStudyAll(cdto.getType());

			for (int i = 0; i < chatuserlist.size(); i++) {
				dto.setUsername(chatuserlist.get(i).getChat_user_id());
				res = calbiz.delete(dto);
			}
			rmap.put("res", res);
			return rmap;
		}
	}

	@ResponseBody
	@RequestMapping(value = "/updateSche.do", method = RequestMethod.POST)
	public Map<String, Object> updateSche(HttpServletRequest httpServletRequest) {
		Map<String, Object> rmap = new HashMap<>();
		String _id = httpServletRequest.getParameter("_id").trim();
		String title = httpServletRequest.getParameter("title").trim();
		String start = httpServletRequest.getParameter("start").trim();
		String end = httpServletRequest.getParameter("end").trim();
		String description = httpServletRequest.getParameter("description").trim();
		String type = httpServletRequest.getParameter("type").trim();
		String username = ((MemberDto) httpServletRequest.getSession().getAttribute("logindto")).getMemberid().trim();
		String backgroundColor = httpServletRequest.getParameter("backgroundColor").trim();
		String textColor = httpServletRequest.getParameter("textColor").trim();
		boolean allDay = false;
		System.out.println("업데이트 시 아이디 : " + _id);
		System.out.println(title);
		System.out.println(start);
		System.out.println(end);
		System.out.println(description);
		System.out.println(type);
		System.out.println(username);
		System.out.println(backgroundColor);
		System.out.println(textColor);
		System.out.println(allDay);
		CalendarDto cdto = new CalendarDto(_id, title, start, end, description, type, username, backgroundColor,
				textColor, allDay);
		int res = -1;
		if (type.equals("개인")) {

			res = calbiz.update(cdto);
			boolean valid = false;
			if (res > 0) {
				valid = true;
			}
			rmap.put("valid", valid);
			rmap.put("res", res);
			return rmap;

			// 개인이 아닐 때
		} else {
			List<ChatuserDto> chatuserlist = new ArrayList<>();
			chatuserlist = chbiz.selectStudyAll(type);

			for (int i = 0; i < chatuserlist.size(); i++) {
				cdto.setUsername(chatuserlist.get(i).getChat_user_id());
				res = calbiz.update(cdto);
				
			}
			rmap.put("res", res);
			return rmap;
		}

		
	}

}