package bit.com.a.controller;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MySqlCotroller {

	@Autowired
	SqlSession sqlSession;
	
	@RequestMapping(value="sample.do")
	public String sample(Model model) {
		int count = sqlSession.selectOne("Sample.sample");
		model.addAttribute("count", count);
		return "index2";
	}
}
