package com;

import java.io.IOException;
import java.sql.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.project.dto.CartDTO;
import com.project.dto.MemberDTO;
import com.project.dto.OrderedDTO;
import com.project.dto.ProductDTO;
import com.project.service.CartService;
import com.project.service.MemberService;
import com.project.service.OrderedService;
import com.project.service.ProductService;

@Controller
public class MainController {
	private MemberService memberService;
	private CartService	cartService;
	private ProductService productService;
	private OrderedService orderedService;
	

	public MainController(MemberService memberService, CartService cartService, ProductService productService,
			OrderedService orderedService) {
		this.memberService = memberService;
		this.cartService = cartService;
		this.productService = productService;
		this.orderedService = orderedService;
	}


	@RequestMapping("checkout")
	public String checkout() {
		return "checkout";
	}


//	dto에 상품정보를 담아서 상품 상세페이지로 이동하기 
	@RequestMapping("productDetails.do")
	public String productView(int pno, Model model,HttpServletRequest request) {
		ProductDTO dto = productService.selectProductDTO(pno);
		HttpSession session = request.getSession();
		System.out.println("세션에 저장되어 있는 값= "+session.getAttribute("mno"));
		
		//System.out.println(dto.toString());
		model.addAttribute("dto", dto);
		System.out.println(pno);

		return "shop_details";
		
	}

	
	//장바구니 페이지로 이동하고 장바구니 테이블에 값 저장
	@RequestMapping("insertCart")
	public String insertCart(int pno,int ea,Model model,HttpServletRequest request) {
		HttpSession session = request.getSession();
		System.out.println("여기까지 실행1");
		int mno=0;
		if(session.getAttribute("mno") != null) { //세션 값이 null일 때 mno=0 --> 비회원 
			mno = (int)session.getAttribute("mno"); //세션에 mno값이 있으면 mno에 담는다.
			System.out.println("실행 2-1");
		}else{
			mno = 0;
			System.out.println("실행 2-2");
		}
		cartService.insertCart(mno, pno, ea);
		System.out.println("실행 3");
		ProductDTO dto = productService.selectProductDTO(pno);
		System.out.println("실행 4");
		model.addAttribute("ea",ea);
		System.out.println("실행 5");
		model.addAttribute("dto",dto);
		System.out.println("실행 6");
		
		return "shoping_cart";
	}
	
//	//주문하기 장바구니에서 넘어올때 창 보기
//	@RequestMapping(value = {"fromDetail", "fromCart"})
//	public String checkoutView(HttpServletRequest request, HttpServletResponse response, Model model) {
//		//상품 디테일에서 넘어올 때
//		if(request.getServletPath().equals("fromDetail")) {
//			System.out.println("디테일에서 넘어옴");
//		}else { //장바구니에서 넘어올 때
//			System.out.println("장바구니에서 넘어옴");
//		}
//		CartDTO cdto = 
//		List<CartDTO> list = cartService.selectCart(cno);
//		회원이면 멤버 테이블에서 이름, 주소, 등등 가져오기.
//		HttpSession session = request.getSession();
//		int mno=0;
//		if(session.getAttribute("mno") != null) { 
//			mno = (int)session.getAttribute("mno");
//			System.out.println("회원입니다");
//		}else{
//			mno = 0;
//			System.out.println("비회원입니다");
//		}
//		MemberDTO mdto  = memberService.selectMemberInfo(mno);
//		
//		return "checkout";
//	}
	
	// 상품 디테일에서 바로 체크아웃으로 넘어올때
	// 주문하기 창에 출력해야 할 것과 입력 받아야 할 것
	// 1. 세션에서 mno를 받아서 회원인지 아닌지 확인해야함
	// 2. 회원일때 창에서 체크박스를 누르면 회원정보에 저장되어 있는 이름, 주소1,2,우편번호, 전화번호, 이메일
	// or 새로 입력받기.
	// 3. 주문 내역을 출력하기 위해선 상품 디테일창 세션에 pno,pname,ea,price를 출력
	
	//장바구니 창에서 넘어올때는
	// 1. 장바구니 테이블에 담겨있는 정보를 출력
	//수량이 바뀌고 결제하기나 상품 업데이트를 누르면 장바구니 테이블을 업데이트 해서 수량만 바꿔준다.
	// 2. 회원일때는 위의 2번과 같음

	
	
	
	//상품 디테일에 주문하기 버튼 눌렀을때
	@RequestMapping("checkout.do")
	public String checkout(@RequestParam(value="mno", defaultValue = "0")int mno,int pno, int dno,String postno,String address1, String address2, int oea, int totalprice, int price, Model model,HttpServletRequest request,HttpServletResponse response) throws IOException {
		int nmno =0; //회원이면 nmno값이 null
		HttpSession session = request.getSession();
		System.out.println("MNO, NMNO 체크 시작");
		if(session.getAttribute("mno") != null) { //세션 값이 null일 때 mno=0 --> 비회원 
			mno = (int)session.getAttribute("mno"); //세션에 mno값이 있으면 mno에 담는다.
			System.out.println("실행 2-1");
			
		}else{
			//(int) Math.random() * (최댓값-최소값+1) + 최소값 --> 랜덤함수
			while (true) {
				nmno=(int)(Math.random() * 5000) + 5000;
				//nmno가 중복되는지 체크하기.
				System.out.println("실행 2-2");
				//sql문에서 카운트로 nmno갯수를 세서 중복 확인.
				if(orderedService.checkNmno(nmno) == 0) break;
				System.out.println("NMNO 중복조회 실행");
			}
		}
		System.out.println("MNO, NMNO 체크 종료");
		
		//장바구니 테이블에서 값을 가져와야됨.
		
		//주문 테이블에 넣기
		int result1 = orderedService.insertOrdered(mno, nmno, pno, dno,postno,address1,address2, oea, totalprice);
		response.getWriter().write(String.valueOf(result1)); //잘 들어갔는지 확인

		//주문내역에 먼저 넣고 ono 현재 시퀀스 값으로 주문상세테이블에도 넣어주면 됨
		//주문 상세 테이블에 넣기
		int ptotalprice = price * oea;
		int result2 = orderedService.insertOrderedDetail(pno,price,oea,ptotalprice);
		response.getWriter().write(String.valueOf(result2)); //잘 들어갔는지 확인
		
		//결제가 완료되면 카트 테이블에 있던 내용은 삭제.
		
		
		return "done_checkout";
	}
	
	@RequestMapping("done_checkout")
	public void done_checkout() {
		System.out.println("결제가 완료되었습니다.");
	}	
	
	
	@RequestMapping("register.do")
	public void register(String id, String pwd, String name, String address, @RequestParam(value="birth", defaultValue = "1")String birth, String tel, HttpServletResponse res) throws IOException {
		int result = memberService.register(id,pwd,name,Date.valueOf(birth),tel,address);
		res.getWriter().write(String.valueOf(result));
	}
	
	@RequestMapping("memberInfo")
	public String memberInfo() {
		return "member_info";
	}
		

}
