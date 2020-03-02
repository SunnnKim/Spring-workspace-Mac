package bit.com.a;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MemberController {

	
	@RequestMapping(value="main.do")
	public String main() {
		return "main";
	}
	
}
