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
	
	// my page
	// 회원 정보보기
	@RequestMapping(value="mypage.do",method=RequestMethod.GET)
	public String myPage(Model model, HttpSession session) {
		
		return "mypage";
	}
	
	
	// pwd check
	@ResponseBody
	@RequestMapping(value="pwdcheck.do", method=RequestMethod.POST,produces = "application/String; charset=utf-8")
	public String pwdCheck(String pwd, HttpSession session) {
		MemberDto dto = (MemberDto)session.getAttribute("loginuser");
		dto.setPwd(pwd);
		boolean exist = memberService.pwdCheck(dto);
		return exist + "";
	}
	
	// 회원 정보 수정하기
	@ResponseBody
	@RequestMapping(value="updatemember.do",method=RequestMethod.POST,produces = "application/String; charset=utf-8")
	public String updateMember(MemberDto dto,HttpSession session) {
		boolean success = false;
		// 이름만 바꾸기 
		if( dto.getPwd() == null || dto.getPwd().equals("")) {
			success = memberService.updateName(dto);
		}
		// 비번 이름 바꾸기 
		else {
			success = memberService.updateAll(dto);
			dto.setPwd("");
		}
		session.setAttribute("loginuser", dto);
		return success+"";
	}
	
	// 회원 탈퇴 뷰 
	@RequestMapping(value="deleteaccountview.do",method=RequestMethod.GET)
	public String deleteAccountView() {
		return "deleteaccount";
	}
	// 회원 탈퇴하기
	@ResponseBody
	@RequestMapping(value="deleteaccount.do",method=RequestMethod.POST,produces = "application/String; charset=utf-8")
	public String deleteAccount(String email) {
		boolean success = memberService.deleteAccount(email);
		return success + "";
	}
	
		
}
