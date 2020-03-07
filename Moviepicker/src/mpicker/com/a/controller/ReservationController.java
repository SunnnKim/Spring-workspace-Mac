package mpicker.com.a.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

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
	public String reservationList(int page, Model model) {
		
		List<ReserveDto> list = reservationService.getAllReservation(page);
		int allcontents = reservationService.getAllContents();
		
		model.addAttribute("list",list);
		model.addAttribute("allcontents",allcontents);
		
		return "reservationlist";
	}
	
	
	
	
}
