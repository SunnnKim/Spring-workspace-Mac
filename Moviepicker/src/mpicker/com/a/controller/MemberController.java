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

import mpicker.com.a.dao.ReserveDto;
import mpicker.com.a.model.MemberDto;
import mpicker.com.a.model.MovieDto;
import mpicker.com.a.movie.MovieManager;
import mpicker.com.a.service.MemberService;

@Controller
public class MemberController {

	// logger
	private static Logger logger = LoggerFactory.getLogger(MemberController.class);
	
	@Autowired
	MemberService memberService;
	
	@RequestMapping(value="main.do",method= {RequestMethod.GET,RequestMethod.POST})
	public String allMember(Model model, String choice){
		
		logger.info("MemberController mainview.do " + new Date());
		List<MovieDto> list = null;
		if(choice.equals("scheduled")) {	// 개봉예정작
			list = MovieManager.getMaindata("https://movie.daum.net/premovie/scheduled");
		}else {
			list = MovieManager.getMaindata("https://movie.daum.net/premovie/released");
		}
		model.addAttribute("list", list);
		
		return "main";
	}
	
	@RequestMapping(value="movielist.do",method= {RequestMethod.GET,RequestMethod.POST})
	public String movielist(){
		
		logger.info("MemberController movielist.do " + new Date());
		
		return "movielist";
	}
	
	@RequestMapping(value="moviedetail.do",method= {RequestMethod.GET,RequestMethod.POST})
	public String moviedetail(){
		
		logger.info("MemberController moviedetail.do " + new Date());
		
		return "moviedetail";
	}
	
	
	@RequestMapping(value="reserve.do",method= {RequestMethod.GET,RequestMethod.POST})
	public String reserve(){
		
		logger.info("MemberController reserve.do " + new Date());
		
		return "reserve";
	}
	
	@RequestMapping(value="login.do",method= {RequestMethod.GET,RequestMethod.POST})
	public String login(){
		
		logger.info("MemberController login.do " + new Date());
		
		return "login";
	}
	
	@RequestMapping(value="join.do",method= {RequestMethod.GET,RequestMethod.POST})
	public String join(){
		
		logger.info("MemberController join.do " + new Date());
		
		return "join";
	}
	//	payment page
	@RequestMapping(value="beforepay.do",method= {RequestMethod.GET,RequestMethod.POST})
	public String beforePay(ReserveDto dto, Model model){
		
		logger.info("MemberController beforepay.do " + new Date());
		logger.info("dto:" + dto.toString());
		
		model.addAttribute("dto",dto);
		return "beforepay";
	}
	
	
}
