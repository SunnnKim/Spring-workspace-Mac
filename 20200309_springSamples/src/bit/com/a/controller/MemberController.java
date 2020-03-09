package bit.com.a.controller;

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
	
	
	
	
	// test
	@RequestMapping(value="test.do",method= {RequestMethod.GET,RequestMethod.POST})
	public String allMember(Model model){
		return "test";	// tiles로 가게됨
	}
	
	
	
	// login
	@RequestMapping(value="login.do",method= {RequestMethod.GET,RequestMethod.POST})
	public String login(Model model, HttpSession session ){
		session.removeAttribute("loginuser");
		return "login.tiles";	// tiles로 가게됨
	}
	
	// register
	@RequestMapping(value="regi.do",method= {RequestMethod.GET,RequestMethod.POST})
	public String regi(Model model){
		return "regi.tiles";	// tiles로 가게됨
	}
	
	// id check
	@ResponseBody
	@RequestMapping(value="idcheck.do", method={RequestMethod.GET,RequestMethod.POST},produces = "application/String; charset=utf-8")
	public String idCheck(String id) {
		boolean success = memberService.idCheck(id);
		return success+"";
		
	}
	// regi member
	@ResponseBody
	@RequestMapping(value="regimember.do", method={RequestMethod.GET,RequestMethod.POST},produces = "application/String; charset=utf-8")
	public String registerMember(MemberDto dto) {
		System.out.println(dto);
		boolean success = memberService.insertMember(dto);
		return success+"";
	}
	// logincheck 
//	@RequestMapping(value="loginAf.do", method={RequestMethod.GET,RequestMethod.POST})
//	public String loginAf(MemberDto dto, HttpSession session) {
//		MemberDto loginuser = memberService.login(dto);
//		if(loginuser != null) {
//			session.setAttribute("loginuser", loginuser);
//			return "bbslist.tiles";
//		}else {
//			return "login.tiles";
//		}
//	}
	@RequestMapping(value="loginAf.do",method=RequestMethod.POST)
	public String loginCheck(MemberDto mem, HttpServletRequest request) {
		
		MemberDto loginuser = memberService.login(mem);
		
		if( loginuser != null && !loginuser.getId().equals("") ) {
			// login success
			request.getSession().setAttribute("loginuser", loginuser);
			request.getSession().setMaxInactiveInterval(60 * 60 * 2 ); // 세션 만료 시간
			
			return "redirect:/bbslist.do";
		}else {
			return "redirect:/login.do";
		}
	}
	
	
	

//	
//	@RequestMapping(value="regi.do",method=RequestMethod.GET)
//	public String regi(){
//		return "regi.tiles";
//	}
//	// insert new member
//	@RequestMapping(value="regiAf.do",method=RequestMethod.POST)
//	public String insert(MemberDto mem, Model model) {
//		logger.info("MemberController insert.do " + new Date());
//		
//		boolean success = memberService.insertMember(mem);
//		model.addAttribute("success",success);
//		return "regiAf.tiles";
//	}
//	
}
