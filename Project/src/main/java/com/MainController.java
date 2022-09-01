package com;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.project.dto.MemberDTO;
import com.project.service.MemberService;

@Controller
public class MainController {
	private MemberService memberService;

	public MainController(MemberService memberService) {
		super();
		this.memberService = memberService;
	}
	
	@RequestMapping("/")
	public String main() {
		
		return "index";
	}
	
	@RequestMapping("login")
	public String loginView() {
		return "login";
	}
	
	@RequestMapping("login.do")
	public String login(String id, String pwd, HttpSession session) {
		System.out.println(id+","+pwd);
		MemberDTO dto = memberService.login(id, pwd);
		if (dto != null) {
			session.setAttribute("login", true);
			session.setAttribute("id", dto.getId());
			session.setAttribute("name", dto.getName());
			return "redirect:/";
		} else {
			session.setAttribute("login", false);
			return "login";
		}
	}
	
	@RequestMapping("logout.do")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/";
	}
	
	@RequestMapping("register")
	public String registerView() {
		return "register";
	}
}
