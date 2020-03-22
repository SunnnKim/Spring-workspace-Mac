package sample.com.a.controller;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import sample.com.a.model.MemberDto;
import sample.com.a.service.MemberService;

@Controller
public class MemberController {

	@Autowired
	MemberService service;
	
	@RequestMapping(value="test.do")
	public String test( Model model ) {
		MemberDto dto = service.test();
		model.addAttribute("dto",dto);
		return "main";
	}

	@RequestMapping(value="login.do")
	public String loginView( ) {
		return "login/login";
	}
	
	@RequestMapping(value="join.do")
	public String joinView( ) {
		return "login/join";
	}
	
	
}
