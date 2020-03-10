package com.vboard.controller;

import java.io.File;
import java.net.URLEncoder;
import java.sql.Timestamp;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.swing.JOptionPane;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.vboard.common.paging.PageCriteria;
import com.vboard.common.paging.PageMaker;
import com.vboard.common.paging.ReplyPageCriteria;
import com.vboard.common.paging.ReplyPageMaker;
import com.vboard.service.BoardService;
import com.vboard.service.ReplyService;
import com.vboard.service.UserService;
import com.vboard.vo.BoardVO;
import com.vboard.vo.ReplyVO;
import com.vboard.vo.UserVO;

// 컨트롤러 명시
@Controller
public class BoardController {

	// 객체 주입
	@Autowired
	private BoardService boardService;

	@Autowired
	private ReplyService replyService;

	@Autowired
	private UserService userService;

	// 메인 화면 호출
	@RequestMapping("main")
	public String responseMoveMain() {
		// board/writeForm.jsp로 이동
		return "main";
	}
	// pc에 담기는 파라미터 page, perPageNum
	@RequestMapping(value = "index", method = RequestMethod.GET)
	public String responseIndex(@ModelAttribute("pc") PageCriteria pc, Model model) throws Exception {
		// view > controller
		// Controller에서 view가 전송하는 parameter를 받는 여러가지 방법이 있다
		// 아래 예시(변수타입은 파라미터에 맞게 변경)
		// - @RequestParam String 변수명 (파라미터 1개)
		// - @RequestParam("키값") String 변수명 (데이터 커맨드를 키값으로 명시)
		// - @RequestParam String 변수명, @RequestParam int 변수명 (파라미터 2개)
		// 받아올 파라미터가 많아지게 되는 경우
		// - @RequestParam HashMap<String, Object> 변수명 (파라미터 여러개)
		// - 데이터모델(custom) 변수명 (파라미터 여러개)
		// - @ModelAttribute("키값") 데이터모델(custom) 변수명 (파라미터 여러개)
		// view(.jsp)에서 ${키값.데이터명}으로 값을 불러올 수 있다

		// 데이터 커맨드 객체로 pc를 매개변수로 넣어주고 넘어오는 page와 perPageNum 정보를 받는다
		// pc를 이용해서 service > dao > mapper.xml 순으로 접근하면서 DB 처리를 하여
		// 현재 페이지 정보를 기준으로 BoardVO 객체를 담은 ArrayList "list"가 반환된다
		List<BoardVO> bvo = boardService.listPageCriteria(pc);

		// view(.jsp)에서 페이징 처리를 위해 사용할 PageMaker 객체 생성
		PageMaker pageMaker = new PageMaker();
		pageMaker.setPc(pc);
		Integer totalPageNum = boardService.totalCount();
		pageMaker.setTotalCount(totalPageNum);

		// controller > view
		// Model vs ModelAndView
		// Model return URL경로 지정, ModelAndView return mv객체(뷰 경로 따로 지정)
		// view(.jsp)에서 페이징 처리를 위해 pageMaker 객체 저장
		// view(.jsp)에 게시글을 뿌려주기 위해 BoardVO bvo 객체 저장
		model.addAttribute("pageMaker", pageMaker);
		model.addAttribute("list", bvo);

		return "index";
	}

	// 글 내용 보기
	// params에 담기는 파라미터 page, perPageNum, b_num
	// rpc에 담기는 파라미터 replyPage, replyPerPageNum
	@RequestMapping("board/view")
	public String responseRead(ReplyPageCriteria rpc, @RequestParam HashMap<String, Object> params, Model model, HttpSession session,BoardVO boardVO) throws Exception {

		// 글 내용 가져오기
		BoardVO bvo = boardService.boardRead(params);
		// 글 조회수 올리기
		boardService.countHit(bvo.getB_num());

		int b_num = Integer.parseInt((String) params.get("b_num"));

		HashMap<String, Object> reply_params = new HashMap<String, Object>();
		reply_params.put("b_num", b_num);
		reply_params.put("replyPageStart", rpc.getReplyPageStart());
		reply_params.put("replyPerPageNum", rpc.getReplyPerPageNum());

		// 댓글 리스트 불러오기
		List<ReplyVO> rvo = replyService.replyListPageCriteria(reply_params);

		// 댓글 페이징
		ReplyPageMaker replyPageMaker = new ReplyPageMaker();
		replyPageMaker.setRpc(rpc);
		Integer replyTotalPageNum = replyService.replyTotalCount(b_num);
		replyPageMaker.setReplyTotalCount(replyTotalPageNum);

		// 현재 세션 로그인 유저 아이디 가져오기
		UserVO uvo = (UserVO) session.getAttribute("login_session");
		// 유저 추천 활성화 시간 조회, "board/recommend" 요청 결과 값을 view.jsp hidden값(u_r_a_t) 갱신을 위해 조회하여 model에 추가한다
		if(uvo != null){
			Timestamp u_recommend_active_time = userService.checkRecommendActiveTime(uvo.getU_id());
			model.addAttribute("u_recommend_active_time", u_recommend_active_time);
		}
		// 파일 조회
		List<Map<String, Object>> fileList = boardService.selectFileList(boardVO.getB_num());
		
		// 각 객체에 데이터 담아서 view.jsp 페이지로 반환
		model.addAttribute("replyPageMaker", replyPageMaker);
		model.addAttribute("replyList", rvo);
		model.addAttribute("v_content", bvo);
		model.addAttribute("page", params.get("page"));
		model.addAttribute("perPageNum", params.get("perPageNum"));
		model.addAttribute("file", fileList);
		
		return "board/view";
	}

	// 글쓰기 페이지로 이동
	@RequestMapping("board/writeForm")
	public String responseMoveWriteForm() {
		// board/writeForm.jsp로 이동
		return "board/writeForm";
	}

	// 글쓰기
	@RequestMapping(value="board/write" , method = RequestMethod.POST)
	public String writePost(BoardVO boardVO, MultipartHttpServletRequest mpRequest) throws Exception {

		boardService.boardWrite(boardVO, mpRequest);

		return "redirect:/index";
	}

	// 글수정 페이지로 이동(+b_num에 맞는 글내용 조회)
	@RequestMapping("board/updateForm")
	public String responseMoveUpdateForm(@RequestParam HashMap<String, Object> params, Model model, HttpSession session,BoardVO boardVO) throws Exception {

		// 수정할 글 세부 정보 가져오기
		BoardVO bvo = boardService.boardRead(params);

		// 현재 세션 로그인 유저 아이디 가져오기
		UserVO uvo = (UserVO) session.getAttribute("login_session");
		
		List<Map<String, Object>> fileList = boardService.selectFileList(boardVO.getB_num());
		model.addAttribute("file", fileList);
		
		// 현재 세션 로그인 유저 equals 선택 글 작성자인 경우 수정 페이지로 이동
		// ==는 객체의 참조 주소값을 비교하는 연산자
		// equals()는 객체의 내용 값을 비교하는 메소드
		if (bvo.getB_writer().equals(uvo.getU_id())) {
			model.addAttribute("u_content", bvo);
			model.addAttribute("page", params.get("page"));
			model.addAttribute("perPageNum", params.get("perPageNum"));
			return "board/updateForm";
		} else {
			JOptionPane.showMessageDialog(null, "수정할 수 없는 글입니다");
			// 다시 보고 있던 글로 리턴
			return "redirect:view?b_num=" + params.get("b_num") + "&page=" + params.get("page") + "&perPageNum=" + params.get("perPageNum");
		}

	}

	// 글수정
	@RequestMapping(value="board/update", method = RequestMethod.POST)
	public String responseUpdate(BoardVO boardVO, @RequestParam(value="fileNoDel[]") String[] files,
			 @RequestParam(value="fileNameDel[]") String[] fileNames, MultipartHttpServletRequest mpRequest) throws Exception {

		boardService.boardUpdate(boardVO, files, fileNames, mpRequest);

		return "redirect:/index";
	}

	// 글삭제
	@RequestMapping("board/delete")
	public String responseDelete(@RequestParam HashMap<String, Object> params) throws Exception {
		System.out.println("글 삭제 파라미터: " + params);

		boardService.boardDelete(params);

		return "redirect:/index";
	}

	// 검색
	@RequestMapping("/search")
	public String responseSearch(@ModelAttribute("pc") PageCriteria pc, @RequestParam HashMap<String, Object> params, Model model) throws Exception {
		// 10개씩 결과
		pc.setPerPageNum(10);

		// 파라미터 합치기
		HashMap<String, Object> search_params = new HashMap<String, Object>();
		search_params.put("search_condition", params.get("search_condition"));
		search_params.put("search_content", params.get("search_content"));
		search_params.put("pageStart", pc.getPageStart());
		search_params.put("perPageNum", pc.getPerPageNum());
		System.out.println("search_params 값: " + search_params);

		// 검색 리스트 부르기
		List<BoardVO> bvo = boardService.searchBoard(search_params);

		PageMaker pageMaker = new PageMaker();
		pageMaker.setPc(pc);
		// 검색한 결과값의 개수 구하기
		Integer totalPageNum = boardService.searchTotalCount(params);
		pageMaker.setTotalCount(totalPageNum);

		// 모델에 값 담기
		model.addAttribute("pageMaker", pageMaker);
		model.addAttribute("list", bvo);
		model.addAttribute("search_condition", params.get("search_condition"));
		model.addAttribute("search_content", params.get("search_content"));

		// 검색했던 결과값 유지해야 페이징 기능 이용이 가능
		return "search";
	}

	// 추천하기
	@RequestMapping("board/recommend")
	public String responseRecommned(@RequestParam HashMap<String, Object> params) throws Exception {
		// 현재시간 > u_recommend_active_time 인 경우, 추천Go
		boardService.countRecommned(params);
		// 추천 후, 유저 u_recommend_active_time에 현재시간+5분(시간 변경가능, board_mapper) 업데이트
		userService.updateRecommendActiveTime((String) params.get("u_id"));

		return "redirect:view?b_num=" + params.get("b_num") + "&page=" + params.get("page") + "&perPageNum=" + params.get("perPageNum");
	}
	
	// 파일 다운
	@RequestMapping(value="board/fileDown")
	public void fileDown(@RequestParam Map<String, Object> map, HttpServletResponse response) throws Exception{
		System.out.println("fileDown");
		Map<String, Object> resultMap = boardService.downFile(map);
		String storedFileName = (String) resultMap.get("stored_file_name");
		String originalFileName = (String) resultMap.get("org_file_name");
		
		// 파일을 저장했던 위치에서 첨부파일을 읽어 byte[]형식으로 변환한다.
		byte fileByte[] = org.apache.commons.io.FileUtils.readFileToByteArray(new File("C:\\upload\\file\\"+storedFileName));
		
		response.setContentType("application/octet-stream");
		response.setContentLength(fileByte.length);
		response.setHeader("Content-Disposition",  "attachment; fileName=\""+URLEncoder.encode(originalFileName, "UTF-8")+"\";");
		response.setHeader("Content-Transfer-Encoding", "binary");
		response.getOutputStream().write(fileByte);
		response.getOutputStream().flush();
		response.getOutputStream().close();
	}
}
