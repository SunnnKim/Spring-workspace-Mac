package mpicker.com.a.controller;

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

import mpicker.com.a.model.MemberDto;
import mpicker.com.a.service.MemberService;

@Controller
public class MemberController {

	// logger
	private static Logger logger = LoggerFactory.getLogger(MemberController.class);
	
	@Autowired
	MemberService memberService;
	
	@RequestMapping(value="mainview.do",method= {RequestMethod.GET,RequestMethod.POST})
	public String allMember(Model model){
		
		logger.info("MemberController mainview.do " + new Date());
		
		return "main";
	}
	
	
}
