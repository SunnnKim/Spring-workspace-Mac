package mpicker.com.a.controller;

import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import mpicker.com.a.model.MemberDto;
import mpicker.com.a.model.MovieDto;
import mpicker.com.a.model.ReserveDto;
import mpicker.com.a.movie.MovieManager;
import mpicker.com.a.service.MemberService;

@Controller
public class MemberController {

	// logger
	private static Logger logger = LoggerFactory.getLogger(MemberController.class);
	
	@Autowired
	MemberService memberService;
	
	/******************************************************************************/
	// member controller
	
	// 회원가입하기  
	@ResponseBody	//	- AJax
	@RequestMapping(value="insertmember.do", method=RequestMethod.POST,produces = "application/String; charset=utf-8")
	public String insertMember( MemberDto dto ) {	// Ajax 
		boolean success = memberService.insertMember(dto);
		//boolean success = true;
		return success + "";
	}
	// 이메일 중복체크
	@ResponseBody
	@RequestMapping(value="emailcheck.do",method=RequestMethod.POST,produces = "application/String; charset=utf-8")
	public String emailCheck(String email) {
		boolean exists = true;
		// 이메일 있으면 true (사용불가이메일) / 없으면 false(사용가능 이메일)
		exists = memberService.emailCheck(email);
		
		return exists + "";
	}
	
	// 로그인 체크
	@ResponseBody // - Ajax
	@RequestMapping(value="logincheck.do", method=RequestMethod.POST,produces = "application/String; charset=utf-8")
	public String loginCheck(MemberDto dto, HttpSession session) {
		System.out.println(dto);
		MemberDto loginuser = memberService.loginCheck(dto);
		if(loginuser == null || loginuser.getEmail().equals("") ) {
			return "false";
		}
		// session에 저장 
		session.setAttribute("loginuser", loginuser); 
		return "true";
	}
	
	// 로그아웃
	@RequestMapping(value="logout.do")
	public String logout(HttpSession session) {
		session.removeAttribute("loginuser");
		return "redirect: main.do?choice=now";
	}
	
	
}
