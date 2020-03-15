package mpicker.com.a.controller;

import java.util.Date;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import mpicker.com.a.model.MovieDto;
import mpicker.com.a.model.ReserveDto;
import mpicker.com.a.movie.MovieManager;

@Controller
public class ViewController {

		// login view
		@RequestMapping(value="login.do",method= {RequestMethod.GET,RequestMethod.POST})
		public String login(){
			return "login";
		}
		
		// join view
		@RequestMapping(value="join.do",method= {RequestMethod.GET,RequestMethod.POST})
		public String join(){
			return "join";
		}
		
		// Main view
		@RequestMapping(value="main.do",method= {RequestMethod.GET,RequestMethod.POST})
		public String allMember(Model model, String choice){
			
			List<MovieDto> list = null;
			if(choice.equals("scheduled")) {	// 개봉예정작
				list = MovieManager.getMaindata("https://movie.daum.net/premovie/scheduled");
			}else {
				list = MovieManager.getMaindata("https://movie.daum.net/premovie/released");
			}
			model.addAttribute("list", list);
			
			return "main";
		}
		
		
		// boxoffice(movie list) view
		@RequestMapping(value="movielist.do",method= {RequestMethod.GET,RequestMethod.POST})
		public String movielist( Model model, String choice){
			
			List<MovieDto> list = MovieManager.getMovieList(choice);
			model.addAttribute("list",list);
			return "movielist";
		}
		
		@RequestMapping(value="moviedetail.do",method= {RequestMethod.GET,RequestMethod.POST})
		public String moviedetail(Model model, String movieid){
			
			MovieDto dto = MovieManager.getMovieDetail(movieid);
			model.addAttribute("dto",dto);
			
			
			return "moviedetail";
		}
		
		// reservation view
		@RequestMapping(value="reserve.do",method= {RequestMethod.GET,RequestMethod.POST})
		public String reserve(Model model){
			
			List<String> list = MovieManager.getAllMovieTitle();
			model.addAttribute("list",list);
			return "reserve";
		}
		
		// reservationOne view
		@RequestMapping(value="reserveone.do",method= {RequestMethod.GET,RequestMethod.POST})
		public String reserveOne(String tit,Model model) {
			return "reserveone";
		}
		
		
		//	beforePay view
		@RequestMapping(value="beforepay.do",method= {RequestMethod.GET,RequestMethod.POST})
		public String beforePay(ReserveDto dto, Model model){
			model.addAttribute("dto",dto);
			return "beforepay";
		}
		
		
		
		
}
