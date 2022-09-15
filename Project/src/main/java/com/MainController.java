package com;

import java.io.IOException;
import java.sql.Date;
import java.util.Calendar;
import java.util.List;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.JSONObject;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.project.dto.JoinDTO;
import com.project.dto.MemberDTO;
import com.project.dto.MemberVipDTO;
import com.project.dto.QnaDTO;
import com.project.service.AdminMemberService;
import com.project.service.MemberService;
import com.project.service.QnaService;

@Controller
public class MainController {
	private MemberService memberService;
	private AdminMemberService adminMemberService;
	private QnaService qnaService;
	
	public MainController(MemberService memberService, AdminMemberService adminMemberService, QnaService qnaService) {
		super();
		this.memberService = memberService;
		this.adminMemberService = adminMemberService;
		this.qnaService = qnaService;
		
	}

	// 메인페이지
	@RequestMapping("/")
	public String main(Model model) {
		model.addAttribute("index", "index");
		return "index";
	}

	//기본-----------------------------------------------------------
	// 로그인페이지
	@RequestMapping("login")
	public String loginView() {
		return "account/login";
	}

	// 로그인
	@RequestMapping("login.do")
	public String login(String id, String pwd, HttpSession session) {
		MemberDTO dto = memberService.login(id, pwd);
		if (dto != null) {
			session.setAttribute("login", true);
			session.setAttribute("loginDTO",dto);
			session.setAttribute("id", id);
			session.setAttribute("mno", dto.getMno());
			int result = memberService.updateLastLogin(dto.getMno());
			//업데이트 실패 시 로그파일 작성?
			return "redirect:/";
		} else {
			session.setAttribute("login", false);
			return "account/login";
		}
	}

	// 로그아웃
	@RequestMapping("logout.do")
	public String logout(HttpSession session) {
		session.removeAttribute("login");
		session.removeAttribute("loginDTO");
		session.removeAttribute("id");
		session.removeAttribute("mno");
		session.invalidate();
		return "redirect:/";
	}

	// 회원가입 페이지
	@RequestMapping("register")
	public String registerView() {
		return "account/register";
	}
	
	//id중복체크 | 추천인 계정 체크
	@RequestMapping("idCheck")
	public void idCheck(String id, HttpServletResponse res) throws IOException {
		int result = memberService.checkId(id);
		res.getWriter().write(String.valueOf(result));
	}
	
	// 회원가입
	@RequestMapping("register.do")
	public void register(String id, String pwd, String name, String address,
			@RequestParam(value = "birth", defaultValue = "1") String birth, String tel, 
			@RequestParam(value="recommender", defaultValue="1") String recommender, HttpServletResponse res)
			throws IOException {
		int result = memberService.register(id, pwd, name, Date.valueOf(birth), tel, address);
		if(result == 1) {
			MemberDTO dto = new MemberDTO();
			dto.setMno(memberService.selectMember(id).getMno());
			memberService.registerMemberDetail(dto.getMno(), recommender);
			dto.setMileage(500);
			adminMemberService.updateMileage(dto);
			adminMemberService.updateMileageLog(dto.getMno(), 500, "회원가입 마일리지 500");
			
			if(!recommender.equals("1")) {
				//신규가입회원 추천인 마일리지 등록
				dto.setMileage(dto.getMileage()+1000);
				adminMemberService.updateMileage(dto);
				adminMemberService.updateMileageLog(dto.getMno(), 1000, "추천인 등록 마일리지 1000");
				
				//추천대상자 마일리지 등록
				dto.setMno(memberService.selectMember(recommender).getMno());
				dto.setMileage(dto.getMileage()+500);
				adminMemberService.updateMileage(dto);
				adminMemberService.updateMileageLog(dto.getMno(), 500, "추천인 등록 마일리지 500");
				dto.setVno(memberService.selectVno(dto.getMno()));
				if(dto.getVno() < 2) {
					//다음 등급 기준 받아오기
					int vcondition = adminMemberService.selectVcondition(dto.getVno()+1);
					//현재 누적마일리지와 비교
					if(dto.getTotalmileage() >= vcondition) {
						//이상이면 등급 변경
						adminMemberService.updateVip(dto.getMno(),dto.getVno()+1);
					}
				}
			}
		}
		res.getWriter().write(String.valueOf(result));
	}
	
	// 아이디,비밀번호 찾기페이지
	@RequestMapping("findAccount")
	public String findAccountView() {
		return "account/find_account";
	}

	// 아이디 찾기(비밀번호는 ID정보만 보내기)
	@RequestMapping("findAccount.do")
	public void findAccount(HttpServletResponse res, String id, String name, String tel, String status)
			throws IOException {
		res.setContentType("text/html; charset=UTF-8");
		JSONObject obj = new JSONObject();
		MemberDTO dto = memberService.findAccount(id, name, tel, status);
		int result = dto.getId() != null ? 1 : 0;
		obj.put("result", result);
		obj.put("dto", dto);
		res.getWriter().print(obj);

	}

	// 비밀번호찾기 > 변경하기
	@RequestMapping("findChangePwd.do")
	public void findChangePwd(String mno, String id2, String pwd, HttpServletResponse res) throws IOException {
		int result = memberService.findChangePwd(id2, pwd);
		
		if(result == 1) {memberService.updatePchange(Integer.parseInt(mno));}
		res.getWriter().write(String.valueOf(result));
	}

	//멤버-----------------------------------------------------------
	// 회원정보페이지
	@RequestMapping("memberInfo")
	public String memberInfo(Model model, HttpSession session) {
		//마이페이지 들어갈 때
		int year = Calendar.getInstance().get(Calendar.YEAR);
		model.addAttribute("year",year);
		MemberDTO dto = (MemberDTO)session.getAttribute("loginDTO");
		if(dto == null) {return "redirect:/";}
		//장바구니 정보
		//select c.cno, c.ea, p.pno, p.pname from cart c, product p where c.pno = p.pno and mno = #{mno}
		//model.addAttribute("cartList",cartList);
		
		//주문목록/배송정보
		//
		//model.addAttribute("orderList",orderList);
		
		//등급정보 - 현재등급 - 다음 등급까지 얼마나 남았는지
		String vip = memberService.getVip(dto.getVno());
		model.addAttribute("vip",vip);
		//문의내역 정보
		//select * from qna where mno = #{mno}
		//model.addAttribute("qnaList",qnaList);
		return "member/member_info";
	}

	// 회원정보 수정 페이지
	@RequestMapping("updateMember")
	public String updateMemberView(HttpSession session, Model model) {
		MemberDTO dto = memberService.selectMember((String) session.getAttribute("id"));

		String add[] = dto.getAddress().split("||");
		model.addAttribute("postno", add[0]);
		model.addAttribute("address1", add[1]);
		model.addAttribute("address2", add[2]);
		model.addAttribute("dto", dto);
		return "member/update_member";
	}

	// 회원정보 수정
	@RequestMapping("updateMember.do")
	public void updateMember(String id, String address, String birth, String tel, HttpServletResponse res)
			throws IOException {
		int result = memberService.updateMember(id, address, Date.valueOf(birth), tel);
		res.getWriter().write(String.valueOf(result));
	}

	// 비밀번호 수정 페이지
	@RequestMapping("updatePwd")
	public String updatePwdView() {
		return "member/update_pwd";
	}

	// 비밀번호 수정
	@RequestMapping("updatePwd.do")
	public void updatePwd(HttpSession session, String pwd, String pwd2, HttpServletResponse res) throws IOException {
		String id = (String) session.getAttribute("id");
		int mno = (Integer)session.getAttribute("mno");
		int result = memberService.updatePwd(id, pwd, pwd2);
		if(result == 1) {
			int r = memberService.updatePchange(mno);
			//업데이트 실패 시 로그
		}
		res.getWriter().write(String.valueOf(result));
	}
	
	//관리자-----------------------------------------------------------
	//관리자 메인페이지
	@RequestMapping("admin")
	public String adminPage() {
		return "admin/admin_index";
	}
	//회원관리페이지
	@RequestMapping("memberManage")
	public String memberManageView(Model model) {
		List<JoinDTO> list = adminMemberService.selectAllMember();
		model.addAttribute("list", list);
		model.addAttribute("type","memberManage");
		return "admin/member_manage";
	}
	//회원삭제
	@RequestMapping("memberDelete.do")
	public void memberDelete(int mno,HttpServletResponse response) throws IOException {
		int result = adminMemberService.deleteMember(mno);
		response.getWriter().write(String.valueOf(result));
	}
	//회원정보수정
	@RequestMapping("memberUpdate.do")
	public void memberUpdate(MemberDTO dto, HttpServletResponse response) throws IOException {
		int result = adminMemberService.updateMember(dto);
		response.getWriter().write(String.valueOf(result));
	}
	//회원관리페이지에서 검색
	@RequestMapping("memberSearch.do")
	public ResponseEntity<List<JoinDTO>> memberSearch(String kind, String search) {
		List<JoinDTO> list;
		if(search.equals("") || search == null) list = adminMemberService.selectAllMember(); 
		else list = adminMemberService.searchMember(kind, search);
		return ResponseEntity.ok(list);
	}
	//등급 혜택 관리
	@RequestMapping("vipManage")
	public String vipManage(Model model) {
		List<MemberVipDTO> list = adminMemberService.selectAllVip();
		System.out.println(list.toString());
		model.addAttribute("list",list);
		model.addAttribute("type","vipManage");
		return "admin/vip_manage";
	}
	//회원 마일리지 관리 페이지
	@RequestMapping("mileageManage")
	public String mileageManage(Model model) {
		List<JoinDTO> list = adminMemberService.selectAllMember();
		model.addAttribute("list", list);
		model.addAttribute("type","mileageManage");
		return "admin/mileage_manage";
	}
	//회원 마일리지 수정
	@RequestMapping("mileageUpdate.do")
	public void mileageUpdate(MemberDTO dto, int cmile, String mlog, HttpServletResponse response) throws IOException {
		dto.setMileage(dto.getMileage()+cmile);
		dto.setTotalmileage(dto.getTotalmileage()+cmile);
		int result = adminMemberService.updateMileage(dto);
		if(result == 1) {
			adminMemberService.updateMileageLog(dto.getMno(), cmile, mlog);
			if(dto.getVno() < 2) {
				//다음 등급 기준 받아오기
				int vcondition = adminMemberService.selectVcondition(dto.getVno()+1);
				//현재 누적마일리지와 비교
				if(dto.getTotalmileage() >= vcondition) {
					//이상이면 등급 변경
					adminMemberService.updateVip(dto.getMno(),dto.getVno()+1);
				}
			}
		}
		response.getWriter().write(String.valueOf(result));
	}
	
	//관리자 QnA 페이지
	@RequestMapping("qnaMain")
	public String qna(Model model) {
		List<JoinDTO> list = qnaService.selectAllQna();
		model.addAttribute("list", list);
		model.addAttribute("type","qna");
		return "admin/qna_main";
	}
	//문의 1건 보기
	@RequestMapping("qnaDetail")
	public String qanswer(int qno, Model model) {
		JoinDTO dto = qnaService.selectQna(qno);
		model.addAttribute("dto", dto);
		model.addAttribute("type","qna");
		
		if(dto.getQna().getQstatus() == 0) {
			qnaService.changeQstatus(qno,1);
		}
		return "admin/qna_detail";
	}
	//문의 답변
	@RequestMapping("qanswer.do")
	public void insertQanswer(int qno, String qanswer, HttpServletResponse res) throws IOException {
		int result = qnaService.insertQanswer(qno,qanswer);
		if(result == 1) qnaService.changeQstatus(qno,2);
		res.getWriter().write(String.valueOf(result));
	}
	
	//쇼핑-----------------------------------------------------------
	@RequestMapping("shopList")
	public String shopList() {
		return "shop/shop_list";
	}
}
