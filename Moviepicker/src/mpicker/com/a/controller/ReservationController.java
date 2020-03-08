package mpicker.com.a.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import mpicker.com.a.model.MemberDto;
import mpicker.com.a.model.MyReservationDto;
import mpicker.com.a.model.ReserveDto;
import mpicker.com.a.service.ReservationService;

@Controller
public class ReservationController {

	@Autowired
	ReservationService reservationService;
	
	// 결제하기
	@RequestMapping(value="pay.do",method=RequestMethod.POST)
	public String pay(ReserveDto dto, Model model) {
		System.out.println(dto);
		boolean success = reservationService.insertReservation(dto);
		model.addAttribute("success",success);
		model.addAttribute("dto",dto);
		return "afterpay";
	}
	
	// 모든 예매내역불러오기 + 페이징 
	@RequestMapping(value="reservationlist.do",method= {RequestMethod.GET,RequestMethod.POST})
	public String reservationList(MyReservationDto dto, Model model,HttpSession session) {
		
		String email = (String)((MemberDto) session.getAttribute("loginuser")).getEmail();
		dto.setEmail(email);
		
		List<ReserveDto> list = reservationService.getAllReservation(dto);
		int allcontents = reservationService.getAllContents();
		
		model.addAttribute("list",list);
		model.addAttribute("allcontents",allcontents);
		
		return "reservationlist";
	}
	
	// 예매 디테일 보기
	//reservedetail.do
	@RequestMapping(value="reservedetail.do")
	public String reserveDetail( Model model, int seq) {
		ReserveDto dto = reservationService.getReserveDetail(seq);
		model.addAttribute("dto", dto);
		return "reservedetail";
	}
	
	// 결제 취소하기
	@ResponseBody
	@RequestMapping(value="deletereserve.do",method=RequestMethod.POST, produces="application/String; charset=utf-8")
	public String deleteReservation(int seq) {
		boolean success = reservationService.deleteReservation(seq);
		return success + "";
	}
	
	
	
}
