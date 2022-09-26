package com;

import java.util.List;

import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.project.dto.BoardDTO;
import com.project.dto.ProductDTO;
import com.project.dto.QnaDTO;
import com.project.service.AdminService;
import com.project.service.BoardService;
import com.project.service.ProductService;
import com.project.service.QnaService;

@Controller
public class MainController {
	private AdminService adminService;
	private BoardService boardService;
	private QnaService qnaService;
	private ProductService productService; 
	
	public MainController(AdminService adminService, BoardService boardService, QnaService qnaService,
			ProductService productService) {
		super();
		this.boardService = boardService;
		this.adminService = adminService;
		this.qnaService = qnaService;
		this.productService = productService;
	}

	@RequestMapping("/")
	public String admin() {
		
		return "manager";
	}
	
	@RequestMapping("/pages-blank.do")
	public String pages_blank() {
		
		return "pages-blank";
	}

	

	//상품품목 리스트 불러온후 리스트 페이지 이동코드
	@RequestMapping("productborder.do")
	public String productborder(Model model) {
		System.out.println("리스트 불러오기전");
		List<ProductDTO> list = productService.selectAllBoard();
		System.out.println("리스트: "+list.toString());
		model.addAttribute("list", list);
		return "productborder"; 
		
	}//상품품목 수정 태그 클릭 코드
	@RequestMapping("updateProductBorder.do")
	public String updateProduct(int pno, Model model) {
		System.out.println("수정할 번호 : "+pno);
		ProductDTO dto = productService.selectproduct(pno);
		System.out.println("아아아앙아아아아ㅏㅇ : "+dto.toString());
		model.addAttribute("dto", dto);
		return "productUpdateBorder";
		
		//
	}@RequestMapping("productUpdate.do")
	public String productUpdateBorder(int pno, String pname, String image, String detail, int price, String dImage, String file, String maker, int ea) {
		//String [] arr = {file};
		//System.out.println("배열 : "+arr[0]);
		if(image == null) {
			int delete = productService.deleteImage(pno,image);
		}
		int result = productService.productUpdate(pno,detail,price,file,maker,ea,pname);
		System.out.println(pno+" "+pname+" "+image+" "+detail+" "+price+" "+dImage+" "+file+" "+maker+" "+ea);
		return "redirect:/productborder.do";
	}
	@RequestMapping("deleteProductBorder.do")
	public ResponseEntity<Integer> deleteProductBorder(String pno) {
		System.out.println("ajax : "+pno);
		int result = productService.deleteProduct(pno);
		return ResponseEntity.ok(result);
	}
	
}
