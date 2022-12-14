package com;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.sql.Date;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.JSONObject;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.project.dto.CartDTO;
import com.project.dto.CategoryBotDTO;
import com.project.dto.CategoryTopDTO;
import com.project.dto.JoinDTO;
import com.project.dto.MemberDTO;
import com.project.dto.MemberVipDTO;
import com.project.dto.NoticeDTO;
import com.project.dto.ProductFileDTO;
import com.project.dto.QnaDTO;
import com.project.service.AdminMemberService;
import com.project.service.CartService;
import com.project.service.MemberService;
import com.project.service.NoticeService;
import com.project.service.OrderedService;
import com.project.service.ProductService;
import com.project.service.QnaService;

@Controller
public class MainController {
	private MemberService memberService;
	private AdminMemberService adminMemberService;
	private QnaService qnaService;
	private NoticeService noticeService;
	private ProductService productService;
	private CartService cartService;
	private OrderedService orderedService;
	
	public MainController(MemberService memberService, AdminMemberService adminMemberService, 
			QnaService qnaService, NoticeService noticeService, ProductService productService,
			CartService cartService, OrderedService orderedService
			) {
		super();
		this.memberService = memberService;
		this.adminMemberService = adminMemberService;
		this.qnaService = qnaService;
		this.noticeService = noticeService;
		this.productService = productService;
		this.cartService = cartService;
		this.orderedService = orderedService;
		
	}
	public void setCategory(Model model) {
		List<CategoryTopDTO> cateTop = productService.selectAllCategoryTop();
		List<CategoryBotDTO> cateBot = productService.selectAllCategoryBot();
		model.addAttribute("cateTop",cateTop);
		model.addAttribute("cateBot",cateBot);
	}
	
	// ???????????????
	@RequestMapping("/")
	public String main(Model model, 
			@RequestParam(value = "ctno", defaultValue = "-1")int ctno,
			@RequestParam(value = "cbno", defaultValue = "-1")int cbno) {
		List<JoinDTO> proList;
		
		if(ctno == -1 && cbno == -1) proList = productService.selectAllProduct(1);
		else if(ctno != -1) proList = productService.selectCaProduct("ctno",ctno, 1);
		else  proList = productService.selectCaProduct("cbno",cbno, 1);
		
		model.addAttribute("proList",proList);
		setCategory(model);
		model.addAttribute("index", "index");
		return "index";
	}
	//imageUpload
	public void fileUpload(MultipartHttpServletRequest request, int pno) {
		//String root = "C:\\Users\\JANG JUN\\Desktop\\project\\workspace\\project\\Project\\src\\main\\webapp\\shop\\img\\product";
		//String root = "\\usr\\local\\docker\\team4\\shop\\img\\product";
		String root = "/usr/local/docker/team4/fileUpload/shop/product/img/";
		//String root = "/usr/local";
		
        File userRoot = new File(root);
        if (!userRoot.exists())
           userRoot.mkdirs();
		List<MultipartFile> fileList = request.getFiles("file");
        for (MultipartFile f : fileList) {
        	try {
        		String originalFileName = f.getOriginalFilename();
        		if (f.getSize() == 0)
        			continue;
        		//File uploadFile = new File(root + "\\" + originalFileName);
        		//productService.insertFileList(root + "\\" + originalFileName, pno);
        		File uploadFile = new File(root + originalFileName);
        		productService.insertFileList(originalFileName, pno);
        		f.transferTo(uploadFile);
        	} catch (IllegalStateException e) {
        		e.printStackTrace();
        	} catch (IOException e) {
        		e.printStackTrace();
        	}
        }
	}
	//imageLoad
	@RequestMapping("fileDown.do")
	public void fileDown(int fno, int pno, HttpServletResponse res) {
		String root = "/usr/local/docker/team4/fileUpload/shop/product/img/";
		// String path = productService.selectFilePath(pno, fno);
		String fileName = productService.selectFileName(pno, fno);
//		File file = new File(root + fileName);
		File file = new File(fileName);

		res.setHeader("Content-Disposition", "attachement;fileName=" + file.getName());
		res.setHeader("Content-Transfer-Encoding", "binary");
		res.setContentLength((int) file.length());

		try {
			FileInputStream fis = new FileInputStream(file);
			BufferedOutputStream bos = new BufferedOutputStream(res.getOutputStream());
			byte[] buffer = new byte[1024 * 1024];
			while (true) {
				int size = fis.read(buffer);
				if (size == -1)
					break;
				bos.write(buffer, 0, size);
				bos.flush();
			}
			bos.close();
			fis.close();
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	@RequestMapping("notice")
	public String notice(Model model) {
		List<NoticeDTO> list = noticeService.selectNoticeList();
		model.addAttribute("list", list);
		setCategory(model);
		return "shop/notice";
	}
	//??????-----------------------------------------------------------
	// ??????????????????
	@RequestMapping("login")
	public String loginView(Model model) {
		setCategory(model);
		return "account/login";
	}

	// ?????????
	@RequestMapping("login.do")
	public String login(String id, String pwd, HttpSession session) {
		MemberDTO dto = memberService.login(id, pwd);
		if (dto != null) {
			session.setAttribute("login", true);
			session.setAttribute("loginDTO",dto);
			session.setAttribute("id", id);
			session.setAttribute("mno", dto.getMno());
			int result = memberService.updateLastLogin(dto.getMno());
			//???????????? ?????? ??? ???????????? ???????
			return "redirect:/";
		} else {
			session.setAttribute("login", false);
			return "account/login";
		}
	}

	// ????????????
	@RequestMapping("logout.do")
	public String logout(HttpSession session) {
		session.removeAttribute("login");
		session.removeAttribute("loginDTO");
		session.removeAttribute("id");
		session.removeAttribute("mno");
		session.invalidate();
		return "redirect:/";
	}

	// ???????????? ?????????
	@RequestMapping("register")
	public String registerView(Model model) {
		setCategory(model);
		return "account/register";
	}
	
	//id???????????? | ????????? ?????? ??????
	@RequestMapping("idCheck")
	public void idCheck(String id, HttpServletResponse res) throws IOException {
		int result = memberService.checkId(id);
		res.getWriter().write(String.valueOf(result));
	}
	
	// ????????????
	@RequestMapping("register.do")
	public void register(String id, String pwd, String name, String postno, String address1, String address2,
			@RequestParam(value = "birth", defaultValue = "1") String birth, String tel, 
			@RequestParam(value="recommender", defaultValue="1") String recommender, HttpServletResponse res)
			throws IOException {
		int regi = 500; //????????????
		int rer = 1000; //???????????????
		int red = 500; //??????????????????
		int result = memberService.register(id, pwd, name, birth, tel, postno, address1, address2);
		if(result == 1) {
			MemberDTO dto = new MemberDTO();
			dto.setMno(memberService.selectMember(id).getMno());
			memberService.registerMemberDetail(dto.getMno(), recommender);
			dto.setMileage(regi);
			dto.setTotalmileage(regi);
			adminMemberService.updateMileage(dto);
			adminMemberService.updateMileageLog(dto.getMno(), regi, "???????????? ???????????? 500");
			
			if(!recommender.equals("1")) {
				//?????????????????? ????????? ???????????? ??????
				dto.setMileage(dto.getMileage()+rer);
				dto.setTotalmileage(dto.getTotalmileage()+rer);
				adminMemberService.updateMileage(dto);
				adminMemberService.updateMileageLog(dto.getMno(), rer, "????????? ?????? ???????????? 1000");
				
				//??????????????? ???????????? ??????
				MemberDTO dto2 = memberService.selectMember(recommender);
				dto2.setMileage(dto2.getMileage()+red);
				dto2.setTotalmileage(dto2.getTotalmileage()+red);
				adminMemberService.updateMileage(dto2);
				adminMemberService.updateMileageLog(dto2.getMno(), red, "????????? ?????? ???????????? 500");
				dto.setVno(memberService.selectVno(dto2.getMno()));
				if(dto2.getVno() < 2) {
					//?????? ?????? ?????? ????????????
					int vcondition = adminMemberService.selectVcondition(dto2.getVno()+1);
					//?????? ????????????????????? ??????
					if(dto2.getTotalmileage() >= vcondition) {
						//???????????? ?????? ??????
						adminMemberService.updateVip(dto2.getMno(),dto2.getVno()+1);
					}
				}
			}
		}
		res.getWriter().write(String.valueOf(result));
	}
	
	// ?????????,???????????? ???????????????
	@RequestMapping("findAccount")
	public String findAccountView() {
		return "account/find_account";
	}

	// ????????? ??????(??????????????? ID????????? ?????????)
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

	// ?????????????????? > ????????????
	@RequestMapping("findChangePwd.do")
	public void findChangePwd(String mno, String id2, String pwd, HttpServletResponse res) throws IOException {
		int result = memberService.findChangePwd(id2, pwd);
		
		if(result == 1) {memberService.updatePchange(Integer.parseInt(mno));}
		res.getWriter().write(String.valueOf(result));
	}

	//??????-----------------------------------------------------------
	// ?????????????????????
	@RequestMapping("memberInfo")
	public String memberInfo(Model model, HttpSession session) {
		//??????????????? ????????? ???
		MemberDTO dto = (MemberDTO)session.getAttribute("loginDTO");
		setCategory(model);
		if(dto == null) {return "redirect:/";}
		
		//???????????? ??????
		//select c.cno, c.ea, p.pno, p.pname from cart c, product p where c.pno = p.pno and mno = #{mno}
		List<CartDTO> cartList = cartService.selectCart(dto.getMno());
		List<JoinDTO> product = new ArrayList<JoinDTO>();
		List<Integer> pno = cartService.getPnoList(dto.getMno());
		
		for(int i=0;i<pno.size();i++) {
			product.add(productService.selectProduct(pno.get(i)));
		}
		model.addAttribute("product",product);
		model.addAttribute("cartList",cartList);
		
		//????????????/????????????
		List<JoinDTO> orderList = orderedService.selectMyOrder(dto.getMno());
		model.addAttribute("orderList",orderList);
		
		//???????????? - ???????????? - ?????? ???????????? ????????? ????????????
		String vip = memberService.getVip(dto.getVno());
		model.addAttribute("vip",vip);
		
		//???????????? ??????
		List<QnaDTO> qnaList = qnaService.selectMemberQna(dto.getMno());
		model.addAttribute("qnaList",qnaList);
		
		return "member/member_info";
	}

	// ???????????? ?????? ?????????
	@RequestMapping("updateMember")
	public String updateMemberView(HttpSession session, Model model) {
		MemberDTO dto = memberService.selectMember((String) session.getAttribute("id"));
		model.addAttribute("dto", dto);
		model.addAttribute("type","updateMember");
		setCategory(model);
		return "member/update_member";
	}

	// ???????????? ??????
	@RequestMapping("updateMember.do")
	public void updateMember(String id, String postno, String address1, String address2, String birth, String tel, HttpServletResponse res)
			throws IOException {
		int result = memberService.updateMember(id, postno, address1, address2, Date.valueOf(birth), tel);
		res.getWriter().write(String.valueOf(result));
	}

	// ???????????? ?????? ?????????
	@RequestMapping("updatePwd")
	public String updatePwdView(Model model) {
		model.addAttribute("type","updatePwd");
		setCategory(model);
		return "member/update_pwd";
	}

	// ???????????? ??????
	@RequestMapping("updatePwd.do")
	public void updatePwd(HttpSession session, String pwd, String pwd2, HttpServletResponse res) throws IOException {
		String id = (String) session.getAttribute("id");
		int mno = (Integer)session.getAttribute("mno");
		int result = memberService.updatePwd(id, pwd, pwd2);
		if(result == 1) {
			int r = memberService.updatePchange(mno);
			//???????????? ?????? ??? ??????
		}
		res.getWriter().write(String.valueOf(result));
	}
	
	//???????????? ?????????
	@RequestMapping("vipInfo")
	public String vipInfoView(Model model, HttpSession session) {
		MemberDTO dto = memberService.selectMember((String)session.getAttribute("id"));
		List<MemberVipDTO> vip = memberService.selectVipAll();
		model.addAttribute("vno", dto.getVno());
		model.addAttribute("total", dto.getTotalmileage());
		model.addAttribute("vip", vip);
		model.addAttribute("type","vipInfo");
		setCategory(model);
		return "member/vip_info";
	}
	
	@RequestMapping("qnaInsert")
	public String qnaInsertView() {
		return "member/qna_insert";
	}
	@RequestMapping("qnaInsert.do")
	public String qnaInsertView(QnaDTO dto) {
		qnaService.insertQna(dto);
		return "redirect:/qnaList";
	}
	@RequestMapping("qnaList")
	public String qnaList(Model model, HttpSession session) {
		List<QnaDTO> list = qnaService.selectMemberQna((int)session.getAttribute("mno"));
		model.addAttribute("list", list);
		model.addAttribute("type","qna");
		setCategory(model);
		return "/member/qna_list";
	}
	//?????????-----------------------------------------------------------
	//????????? ???????????????
	@RequestMapping("admin")
	public String adminPage(Model model) {
		List<JoinDTO> memList = adminMemberService.selectAllMember();
		model.addAttribute("memList", memList);
		List<JoinDTO> qnaList = qnaService.selectAllQna();
		model.addAttribute("qnaList", qnaList);
		List<JoinDTO> proList = productService.selectAllProduct(0);
		model.addAttribute("proList", proList);
		return "admin/admin_index";
	}
	//?????????????????????
	@RequestMapping("memberManage")
	public String memberManageView(Model model) {
		List<JoinDTO> list = adminMemberService.selectAllMember();
		model.addAttribute("list", list);
		model.addAttribute("type","memberManage");
		return "admin/member_manage";
	}
	//????????????????????? ??????
	@RequestMapping("adminAddMember")
	public String adminAddMember() {
		return "admin/admin_add_member";
	}
	//????????????
	@RequestMapping("memberDelete.do")
	public void memberDelete(int mno,HttpServletResponse response) throws IOException {
		int result = adminMemberService.deleteMember(mno);
		response.getWriter().write(String.valueOf(result));
	}
	//??????????????????
	@RequestMapping("memberUpdate.do")
	public void memberUpdate(MemberDTO dto, HttpServletResponse response) throws IOException {
		int result = adminMemberService.updateMember(dto);
		response.getWriter().write(String.valueOf(result));
	}
	//??????????????????????????? ??????
	@RequestMapping("memberSearch.do")
	public ResponseEntity<List<JoinDTO>> memberSearch(String kind, String search) {
		List<JoinDTO> list;
		if(search.equals("") || search == null) list = adminMemberService.selectAllMember(); 
		else list = adminMemberService.searchMember(kind, search);
		return ResponseEntity.ok(list);
	}
	//?????? ?????? ??????
	@RequestMapping("vipManage")
	public String vipManage(Model model) {
		List<MemberVipDTO> list = adminMemberService.selectAllVip();
		System.out.println(list.toString());
		model.addAttribute("list",list);
		model.addAttribute("type","vipManage");
		return "admin/vip_manage";
	}
	//?????? ???????????? ?????? ?????????
	@RequestMapping("mileageManage")
	public String mileageManage(Model model) {
		List<JoinDTO> list = adminMemberService.selectAllMember();
		model.addAttribute("list", list);
		model.addAttribute("type","mileageManage");
		return "admin/mileage_manage";
	}
	//?????? ???????????? ??????
	@RequestMapping("mileageUpdate.do")
	public void mileageUpdate(MemberDTO dto, int cmile, String mlog, HttpServletResponse response) throws IOException {
		dto.setMileage(dto.getMileage()+cmile);
		dto.setTotalmileage(dto.getTotalmileage()+cmile);
		int result = adminMemberService.updateMileage(dto);
		if(result == 1) {
			adminMemberService.updateMileageLog(dto.getMno(), cmile, mlog);
			if(dto.getVno() < 2) {
				//?????? ?????? ?????? ????????????
				int vcondition = adminMemberService.selectVcondition(dto.getVno()+1);
				//?????? ????????????????????? ??????
				if(dto.getTotalmileage() >= vcondition) {
					//???????????? ?????? ??????
					adminMemberService.updateVip(dto.getMno(),dto.getVno()+1);
				}
			}
		}
		response.getWriter().write(String.valueOf(result));
	}
	
	//????????? QnA ?????????
	@RequestMapping("qnaMain")
	public String qna(Model model) {
		List<JoinDTO> list = qnaService.selectAllQna();
		model.addAttribute("list", list);
		model.addAttribute("type","qna");
		return "admin/qna_main";
	}
	//?????? 1??? ??????
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
	//?????? ??????
	@RequestMapping("qanswer.do")
	public void insertQanswer(int qno, String qanswer, HttpServletResponse res) throws IOException {
		int result = qnaService.insertQanswer(qno,qanswer);
		if(result == 1) qnaService.changeQstatus(qno,2);
		res.getWriter().write(String.valueOf(result));
	}
	
	//????????? ??????
	@RequestMapping("deleteQna.do")
	public void deleteQna(QnaDTO qdto, HttpSession session, HttpServletResponse res) throws IOException {
		MemberDTO dto = (MemberDTO)session.getAttribute("loginDTO");
		//???????????? ?????? ?????? + ?????? ????????? ?????? ??????
		if(dto.getVno() == 4) {
			qdto.setQtitle("???????????? ?????? ????????? ??????????????????. ????????? ????????? ??????????????????.");
			int result = qnaService.adminDeleteQna(qdto);
			res.getWriter().write(String.valueOf(result));
		}
		//???????????? ?????? ?????????
		else {
			int result = qnaService.deleteQna(qdto.getQno());
			res.getWriter().write(String.valueOf(result));
		}
	}
	
	//???????????? ?????????
	@RequestMapping("noticeList")
	public String noticeList(Model model) {
		List<NoticeDTO> list = noticeService.selectNoticeList();
		model.addAttribute("list", list);
		model.addAttribute("type", "noticeList");
		return "admin/notice_list";
	}
	
	//???????????? ???????????????
	@RequestMapping("noticeWrite")
	public String noticeWriteView(Model model) {
		model.addAttribute("type", "noticeWrite");
		return "admin/notice_write";
	}
	
	//???????????? ??????
	@RequestMapping("noticeWrite.do")
	public String noticeWrite(NoticeDTO dto) {
		noticeService.insertNotice(dto);
		return "redirect:/noticeList";
	}
	
	//???????????? ??????
	@RequestMapping("deleteNotice.do")
	public String deleteNotice(int nno, HttpSession session) {
		noticeService.deleteNotice(nno);
		return "redirect:/noticeList";
	}

	//???????????? ?????? ?????????
	@RequestMapping("updateNotice")
	public String updateNoticeView(int nno, Model model) {
		NoticeDTO dto = noticeService.selectNotice(nno);
		model.addAttribute("dto", dto);
		return "admin/notice_update";
	}
	
	//???????????? ??????
	@RequestMapping("updateNotice.do")
	public String updateBorder(NoticeDTO dto) {
		noticeService.updateNotice(dto);
		return "redirect:/noticeList";
	}
	
	//???????????? ????????? ???????????? ????????? ????????? ????????????
	@RequestMapping("adminProductList") //productborder.do
	public String productList(Model model, @RequestParam(value="type", defaultValue = "0")int type) {
		List<JoinDTO> list = productService.selectAllProduct(type);
		model.addAttribute("list", list);
		model.addAttribute("type","proList");
		return "admin/product_list"; 
		
	}
	
	//????????????
	@RequestMapping("updateProduct")
	public String updateProductView(int pno, Model model) {
		JoinDTO dto = productService.selectProduct(pno);
		
		List<ProductFileDTO> Filelist = productService.selectPathList(pno);
		setCategory(model);
		model.addAttribute("dto", dto);
		model.addAttribute("Filelist", Filelist);
		return "admin/product_update";
	}
	
	//???????????????????????????
		@RequestMapping("productInsert")
		public String productInsertBorder(Model model) throws IOException {
			setCategory(model);
			model.addAttribute("type","productInsert");
			return "admin/product_insert";
		}
		//?????????????????????????????? ?????? ajax??? ???????????? select??? ??? ???????????????
		@RequestMapping("adminGetCategoryBot")
		public ResponseEntity<List<CategoryBotDTO>> adminGetCategoryBot(int ctno) {
			List<CategoryBotDTO> list = productService.selectCategoryBot(ctno);
			return ResponseEntity.ok(list);
		}
		
		@RequestMapping("productInsert.do")
		public String productInsert(String pname, int ctno, int cbno, String seller,
				int price, int ea, String detail, String maker, MultipartHttpServletRequest request) {
			int pno = -1;
			int result = productService.productInsert(pname,ctno,cbno,seller);
			
			if(result == 1) {
				pno = productService.getPno(pname,seller);
				productService.productDetailInsert(pno, price, ea, detail, maker);
			}
			if(request.getFile("file") != null) fileUpload(request, pno);
			return "redirect:/adminProductList";
		}

		// ???????????? ?????? ?????? ?????? ??????
		@RequestMapping("productUpdate.do")
		public String productUpdateBorder(int pno, String pname, String detail, String seller, int price, String maker,
				int ea, // int[] dImage,
				int ctno, int cbno, MultipartHttpServletRequest request) {
			if (request.getParameterValues("dImage") != null) {
				String dImage[] = request.getParameterValues("dImage");
				for (int i = 0; i < dImage.length; i++) {
					System.out.println(dImage[i]);
					productService.deleteImage(pno, Integer.parseInt(dImage[i]));
				}
			}

			productService.productUpdate(pno, pname, seller, ctno, cbno);
			productService.productDetailUpdate(pno, price, ea, detail, maker);

			if (request.getFiles("file") != null)
				fileUpload(request, pno);
			return "redirect:/adminProductList";
		}
		
		// **????????? ????????????--------------------------------------------------------------
		// ???????????? ?????? ?????????
		@RequestMapping("orderManage")
		public String orderManageView(Model model) {
			List<JoinDTO> list = orderedService.selectAllOrder();
			model.addAttribute("list", list);
			model.addAttribute("type", "orderManage");
			return "admin/order_manage";
		}

		@RequestMapping("orderSearch.do")
		public ResponseEntity<List<JoinDTO>> orderSearch(String kind, String search) {
			List<JoinDTO> list;
			if (search.equals("") || search == null)
				list = orderedService.selectAllOrder();
			else
				list = orderedService.searchOrder(kind, search);
			return ResponseEntity.ok(list);
		}

		@RequestMapping("orderDetail")
		public String orderDetailView(int ono, Model model) {
			List<JoinDTO> list = orderedService.selectOrderDetail(ono);
			model.addAttribute("list", list);
			model.addAttribute("type", "orderManage");
			
			return "admin/order_detail";
		}

		@RequestMapping("updateOrderAddress.do")
		public void updateOrderAddress(int ono, String postno, String address1, String address2, HttpServletResponse res)
				throws IOException {
			int result = orderedService.updateOrderAddress(ono, postno, address1, address2);
			res.getWriter().write(String.valueOf(result));
		}

		@RequestMapping("updateOrderDNO.do")
		public ResponseEntity<Integer> updateOrderDNO(int dno, int ono) throws IOException {
			int result = orderedService.updateOrderDNO(dno, ono);
			return ResponseEntity.ok(result);
		}
	//??????-----------------------------------------------------------
	@RequestMapping("productList")
	public String product_ListView(Model model,
			@RequestParam(value = "ctno", defaultValue = "-1") int ctno,
			@RequestParam(value = "cbno", defaultValue = "-1") int cbno,
			@RequestParam(value = "type", defaultValue = "0") int type
			) {
		//????????? ?????? ????????? ?????????
		List<JoinDTO> list;
		if(ctno == -1 && cbno == -1) list = productService.selectAllProduct(type);
		else if(ctno != -1) list = productService.selectCaProduct("ctno",ctno, type);
		else  list = productService.selectCaProduct("cbno",cbno, type);
		
		setCategory(model);
		model.addAttribute("list", list);
		
		model.addAttribute("ctno", ctno);
		model.addAttribute("cbno", cbno);
		model.addAttribute("type", type);
		
		return "shop/product_list";
	}
	
//	dto??? ??????????????? ????????? ?????? ?????????????????? ???????????? 
	@RequestMapping("productDetail")
	public String productView(int pno, Model model, HttpSession session) {
		JoinDTO dto = productService.selectProduct(pno);
		model.addAttribute("dto", dto);
		//List<ProductFileDTO> path =  productService.getPath(pno);
		setCategory(model);
		return "shop/product_details";
	}
	
	//???????????? ???????????? ???????????? ???????????? ???????????? ??? ??????
	@RequestMapping("insertCart")
	public String insertCart(int pno,@RequestParam(value="ea",defaultValue = "1")int ea,HttpSession session, HttpServletResponse res) throws IOException {
		int mno = (int)session.getAttribute("mno");
		int result = cartService.insertCart(mno, pno, ea);
		//model.addAttribute("ea",ea);
		
		res.getWriter().write(String.valueOf(result));
		return "shop/cart";
	}
	
	@RequestMapping("cart")
	public String cart(Model model, HttpSession session) {
		int mno = (int)session.getAttribute("mno");
		List<CartDTO> cartList = cartService.selectCart(mno); 
		List<Integer> pno = cartService.getPnoList(mno);
		List<JoinDTO> product = new ArrayList<JoinDTO>();
		List<ProductFileDTO> file = new ArrayList<ProductFileDTO>();
		
		for(int i=0;i<pno.size();i++) {
			product.add(productService.selectProduct(pno.get(i)));
			file.add(productService.selectPathList(pno.get(i)).get(0));
		}
		model.addAttribute(file);
		model.addAttribute("cartList",cartList);
		model.addAttribute("product",product);
		setCategory(model);
		return "shop/cart";
	}
	@RequestMapping("updateCart")
	public void updateCart(HttpServletResponse res, int cno,int ea) throws IOException {
		int result = cartService.updateCart(cno,ea);
		res.getWriter().write(String.valueOf(result));
	}
	@RequestMapping("deleteCart")
	public String deleteCart(int cno) {
		cartService.deleteCart(cno);
		return "redirect:cart";
	}
	
	@RequestMapping("deleteCartAll")
	public String deleteCartAll(HttpSession session) {
		int mno = (int)session.getAttribute("mno");
		cartService.deleteCartAll(mno);
		return "redirect:cart";
	}
	@RequestMapping("pay")
	public String payPage(@RequestParam(value="type", defaultValue = "-1") String type,
			@RequestParam(value="pno", defaultValue = "-1")int pno,
			@RequestParam(value="ea", defaultValue="1")int ea,
			Model model, HttpSession session) {
		if(type.equals("cart")) {
			int mno = (int)session.getAttribute("mno");
			List<CartDTO> cartList = cartService.selectCart(mno); 
			List<Integer> pnoList = cartService.getPnoList(mno);
			List<JoinDTO> product = new ArrayList<JoinDTO>();
			List<ProductFileDTO> file = new ArrayList<ProductFileDTO>();
			
			for(int i=0;i<pnoList.size();i++) {
				product.add(productService.selectProduct(pnoList.get(i)));
				file.add(productService.selectPathList(pno).get(0));
			}
			
			model.addAttribute(file);
			model.addAttribute("cartList",cartList);
			model.addAttribute("product",product);
		}else {
			JoinDTO product = productService.selectProduct(pno);
			model.addAttribute("product",product);
			List<ProductFileDTO> file = productService.selectPathList(pno);
			model.addAttribute(file);
			model.addAttribute("ea",ea);
		}
		MemberDTO dto = memberService.selectMember((String)session.getAttribute("id"));
		model.addAttribute("dto",dto);
		model.addAttribute("type",type);
		setCategory(model);
		return "shop/checkout";
	}
}
