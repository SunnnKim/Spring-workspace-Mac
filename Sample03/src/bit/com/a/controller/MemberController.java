package bit.com.a.controller;

import java.util.Date;
import java.util.List;

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

import bit.com.a.model.MemberDto;
import bit.com.a.service.MemberService;

@Controller
public class MemberController {

	// logger
	private static Logger logger = LoggerFactory.getLogger(MemberController.class);
	
	@Autowired
	MemberService memberService;
	
	@RequestMapping(value="allmember.do",method= {RequestMethod.GET,RequestMethod.POST})
	public String allMember(Model model){
		
		logger.info("MemberController allmember.do " + new Date());
		model.addAttribute("memlist",memberService.allMember());
		
		return "allMember";
	}
	// Go to Login view
	@RequestMapping(value="login.do",method=RequestMethod.GET)
	public String loginView( HttpServletRequest request ) {
		logger.info("MemberController login.do " + new Date());
		
		// 세션 삭제
		if(request.getSession().getAttribute("loginuser")!=null) {
			request.getSession().removeAttribute("loginuser");
		}
		
		return "login";
	}
	
	
	// Go to Register View
	@RequestMapping(value="join.do",method=RequestMethod.GET)
	public String joinView() {
		logger.info("MemberController join.do " + new Date());
		return "regi";
	}
	
	// Ajax : idCheck
	@ResponseBody
	@RequestMapping(value="idcheck.do",method= {RequestMethod.POST,RequestMethod.GET},produces = "application/String; charset=utf-8")
	public String idCheck(String id) {
		logger.info("MemberController idcheck.do " + new Date());
		logger.info("id : " + id);

		boolean exist = memberService.idCheck(id);
		return exist+"";
	}
	// insert new member
	@RequestMapping(value="insert.do",method=RequestMethod.POST)
	public String insert(MemberDto mem, Model model) {
		logger.info("MemberController insert.do " + new Date());
		
		boolean success = memberService.insertMember(mem);
		model.addAttribute("success",success);
		return "regiAf";
	}
	
	// login check(id, pwd)
	@RequestMapping(value="logincheck.do",method=RequestMethod.POST)
	public String loginCheck(MemberDto mem, HttpServletRequest request) {
		logger.info("MemberController insert.do " + new Date());
//		logger.info("id:"+mem.getId());
//		logger.info("pwd:"+mem.getPwd());
		
		MemberDto loginuser = memberService.login(mem);
		if( loginuser != null && !loginuser.getId().equals("") ) {
			// login success
			request.getSession().setAttribute("loginuser", loginuser);
			request.getSession().setMaxInactiveInterval(60 * 60 * 2 ); // 세션 만료 시간

		}else {
			
		}
		return "loginAf";
	}
	
	
}
