package bit.com.a.controller;

import java.util.Date;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import bit.com.a.model.BbsDto;
import bit.com.a.model.SearchDto;
import bit.com.a.service.BbsService;

@Controller
public class BbsController {
	
	// logger
	private static Logger logger = LoggerFactory.getLogger(MemberController.class);
	
	// service
	@Autowired
	BbsService bbsService;
	
	
	// go to main view
		@RequestMapping(value="bbslist.do",method=RequestMethod.GET)
		public String bbslist(Model model) {
			logger.info("BbsController bbsview.do");
			
			List<BbsDto> list = bbsService.getBbsList();
			model.addAttribute("list",list);
			
			return "bbslist";
		}
		
	// show Bbs all list ( paging)
		@RequestMapping(value="bbslistpage.do",method=RequestMethod.GET)
		public String BbsList(Model model, int page) {
			logger.info("BbsController bbslist.do");
			
			return"bbslist";
		}
		
	// go to bbswrite
		@RequestMapping(value="bbswrite.do",method=RequestMethod.GET)
		public String bbsWrite() {
			logger.info("BbsController bbswrite.do");
			
			return"bbswrite";
		}
		// new Bbs insert
		@ResponseBody
		@RequestMapping(value="bbsinsert.do",method=RequestMethod.GET,produces = "application/String; charset=utf-8")
		public String bbsInsert(BbsDto dto) {
			logger.info("BbsController bbsinsert.do" + new Date());
			
			boolean success = bbsService.insertBbs(dto);
			
			return success+"";
		}
		
		// Bbs Detail
		@RequestMapping(value="bbsdetail.do",method=RequestMethod.GET)
		public String bbsDetail(int seq, Model model) {
			logger.info("BbsController bbsdetail.do" + new Date());
			//readcount
			bbsService.readcount(seq);
			BbsDto dto = bbsService.bbsDetail(seq);
			
			model.addAttribute("dto",dto);
			return "bbsdetail";
		}
		// go to update view
		@RequestMapping(value="update.do")
		public String update(int seq, Model model) {
			logger.info("BbsController update.do" + new Date());
			BbsDto dto = bbsService.bbsDetail(seq);
			
			model.addAttribute("dto",dto);
			return "update";
		}
		
		// update Bbs
		@ResponseBody
		@RequestMapping(value="bbsupdate.do",produces = "application/String; charset=utf-8")
		public String bbsUpdate(BbsDto dto) {
			logger.info("BbsController bbsupdate.do" + new Date());
			logger.info("dto : " + dto.toString());
			boolean success = bbsService.updateBbs(dto);
			
			return success + "";
		}
		
		// Bbs Delete
		@ResponseBody
		@RequestMapping(value="bbsdelete.do",produces = "application/String; charset=utf-8")
		public String bbsDelete(int seq) {
			logger.info("BbsController bbsdelete.do" + new Date());
			boolean delete = bbsService.deleteBbs(seq);
			return delete + "";
		}
		
		
		// reply view
		@RequestMapping(value="reply.do")
		public String reply(int seq, Model model) {
			logger.info("BbsController reply.do" + new Date());
			BbsDto dto = bbsService.bbsDetail(seq);
			
			model.addAttribute("dto",dto);
			return "reply";
		}
		
		
		// reply insert
		@ResponseBody
		@RequestMapping(value="replyinsert.do",produces = "application/String; charset=utf-8")
		public String replyInsert(BbsDto dto) {
			logger.info("BbsController replyinsert.do" + new Date());
			logger.info("dto" + dto.toString());
			boolean success = bbsService.replyInsert(dto);
			return success + "";
		}
		//search
		@RequestMapping(value="search.do")
		public String search(SearchDto dto, Model model) {
			List<BbsDto> list = bbsService.searchBbs(dto);
			model.addAttribute("list",list);
			return "search";
		}
}
