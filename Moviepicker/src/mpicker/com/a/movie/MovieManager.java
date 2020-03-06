package mpicker.com.a.movie;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;

import mpicker.com.a.model.MovieDto;

public class MovieManager {

	// main page crowling
	public static List<MovieDto> getMaindata(String url){
		
		Document doc; 	//jsoup 소속의 Document
		
		List<MovieDto> list = new ArrayList<MovieDto>();
	//	String url = "https://movie.daum.net/premovie/released"; //크롤링할 url지정
		
		try {
			doc = Jsoup.connect(url).get();
			// 가져오려고 하는 사이트의 url 
			
			// 영화 제목만 가져오기
			Elements titles = doc.select("div.info_tit a.name_movie");
			
			// 좋아요 값 불러오기txt_dot
			Elements resereRate = doc.select("span.info_state");
			
			// 링크주소불러오기 
			Elements urls = doc.select("div.info_tit a.name_movie");
			
			// 이미지링크 
			Elements imgs = doc.select("div.info_movie span.thumb_movie img");
			
			// 영화줄거리 
			Elements strs = doc.select("div.wrap_desc a.desc_movie");
			
			// Parsing한 데이터 담기
			for (int i = 0; i < 4; i++) {
				Element eTitle = titles.get(i);
				String title = eTitle.text();
				
				
				Element eResereRate = resereRate.get(i);
				String _resereRate = eResereRate.text();
				
				Element eUrl = urls.get(i);
				String surl = eUrl.attr("href");
				
				Element eImg = imgs.get(i);
				String imgUrl = eImg.attr("src");
				
				Element e_str = strs.get(i);
				String str = e_str.text();
				
				
				MovieDto dto = new MovieDto(title,_resereRate,surl, null, imgUrl, str);
				
				list.add(dto);
				
				
			}
			// star rate
			Elements grades = doc.select("span.grade_netizen span.num_grade");
			
			
			// Parsing한 데이터 담기
			int w = 0;
			int index=0;
			String grade ="";
			while( w <= 12 ) {
				if( w % 3 == 0 && w != 0) {
					list.get(index).setStarrate(grade);
					grade="";
					index++;
				}
				if(w % 3 == 1 ) {
					Element e_grade = grades.get(w);
					grade += e_grade.text();
				}
				else {
					Element e_grade = grades.get(w);
					grade += e_grade.text().substring(1);
				}
				w++;
			}
			
			
		} catch (IOException e) {
			e.printStackTrace();
		}
	
		return list;
	}
		
		
	
// list page crowling
public static List<MovieDto> getMovieList(String choice){
		
		Document doc; 	//jsoup 소속의 Document
		String url;
		if(choice.equals("now")) {
			url = "https://movie.daum.net/premovie/released";
		}else {
			url = "https://movie.daum.net/premovie/scheduled";
		}
		List<MovieDto> list = new ArrayList<MovieDto>();
		
		try {
			// 가져오려고 하는 사이트의 url 
			doc = Jsoup.connect(url).get();
			
			// 영화 제목만 가져오기
			Elements titles = doc.select("div.info_tit a.name_movie");
			
			// 좋아요 값 불러오기txt_dot
			Elements resereRate = doc.select("span.info_state");
			
			// 링크주소불러오기 
			Elements urls = doc.select("div.info_tit a.name_movie");
			
			// 이미지링크 
			Elements imgs = doc.select("div.info_movie span.thumb_movie img");
			
			// 영화줄거리 
			Elements strs = doc.select("div.wrap_desc a.desc_movie");
			
			// Parsing한 데이터 담기
			for (int i = 0; i < 16; i++) {
				Element eTitle = titles.get(i);
				String title = eTitle.text();
				
				
				Element eResereRate = resereRate.get(i);
				String _resereRate = eResereRate.text();
				
				Element eUrl = urls.get(i);
				String surl = eUrl.attr("href");
				
				Element eImg = imgs.get(i);
				String imgUrl = eImg.attr("src");
				
				Element e_str = strs.get(i);
				String str = e_str.text();
				
				
				MovieDto dto = new MovieDto(title,_resereRate,surl, null, imgUrl, str);
				
				list.add(dto);
				
				
			}
			// star rate
			Elements grades = doc.select("span.grade_netizen span.num_grade");
			
			
			// Parsing한 데이터 담기
			int w = 0;
			int index=0;
			String grade ="";
			while( w <= 48 ) {
				if( w % 3 == 0 && w != 0) {
					list.get(index).setStarrate(grade);
					grade="";
					index++;
				}
				if(w % 3 == 1 ) {
					grade += ".";
				}
					Element e_grade = grades.get(w);
					grade += e_grade.text().substring(1);
				w++;
			}
			
		} catch (IOException e) {
			e.printStackTrace();
		}
	
		return list;
	}
	
// list detail
public static MovieDto getMovieDetail(String movieid){
	
	Document doc; 	//jsoup 소속의 Document
	String code_url= "https://movie.daum.net" + movieid;
	MovieDto dto = null;
	try {
		// 가져오려고 하는 사이트의 url 
		doc = Jsoup.connect(code_url).get();
		
		// 영화 제목 가져오기
		Element e_title = doc.selectFirst("div.subject_movie strong.tit_movie");
		String title = e_title.text();
		
		// 예매순위 
		Element e_reserveRate = doc.selectFirst(".emph_g");
		String reserveRate = "";
		if(e_reserveRate == null ) {
			reserveRate = "(티켓오픈미정)";
		}else {
			if(e_reserveRate.text().contains("예정") ) {
				reserveRate = e_reserveRate.text();
			}else {
				reserveRate = "예매순위 "+ e_reserveRate.text()+"위";
			}
		}
		// url 필요없음
		String url = "";
		
		// 평점 
		Element e_starrate = doc.selectFirst("div.subject_movie a.raking_grade em.emph_grade");
		String starrate = e_starrate.text();
		
		
//		Element e_starrate = doc.selectFirst("");
		// 이미지링크 
		Element e_img = doc.selectFirst("div.detail_summarize img.img_summary");
		String imgSrc = e_img.attr("src");
	
		// 영화줄거리 
		Element e_about = doc.selectFirst("div.desc_movie p");
		String aboutMovie = e_about.html();
		
		
		// 원제목 
		Element e_origin = doc.selectFirst("div.subject_movie span.txt_origin");
		String origintitle = e_origin.text();
		
		// 메이킹필름
		Element e_making = doc.selectFirst("div.making_note p.desc_movie");
		String makingNote ="";
		if(e_making != null) {
			makingNote = e_making.html();
		}
		
		// 장르
		Elements e_ganre = doc.select("dl.list_movie dd");
		String ganre = e_ganre.get(0).text()+" | "+e_ganre.get(1).text();
		
		
		// 개봉일
		Element e_date = null;
		String movieDate = "";
		if(doc.select("dd.txt_main").size() > 1) {
			e_date = doc.select("dd.txt_main").get(1);
			movieDate = e_date.text();
		}else {
			movieDate = "(개봉예정일 미정)";
		}
		
		
		// 감독 및 주연
		Elements casts = doc.select("a.link_person");
		String director = casts.get(0).text();
		String casting = casts.get(1).text();
		
		
		
		// dto에 담기
		dto = new MovieDto(title, reserveRate, url, starrate, imgSrc, aboutMovie, origintitle, makingNote, ganre, movieDate, director, casting, null);
	} catch (IOException e) {
		e.printStackTrace();
	}
	
	return dto;
}
	

// 예매하기 : 영화 제목만 크롤링
public static List<String> getAllMovieTitle(){
	
	List<String> list = new ArrayList<String>();
	Document doc; 	//jsoup 소속의 Document
	String release = "https://movie.daum.net/premovie/released";
	String scheduled = "https://movie.daum.net/premovie/scheduled";
	try {
		// 가져오려고 하는 사이트의 url 
		doc = Jsoup.connect(release).get();
		
		// 영화 제목만 가져오기
		Elements titles = doc.select("div.info_tit a.name_movie");
		// Parsing한 데이터 담기
		for (int i = 0; i < titles.size(); i++) {
			Element eTitle = titles.get(i);
			String title = eTitle.text();
			
			
			list.add(title);
		}
		doc = Jsoup.connect(scheduled).get();
		// 개봉예정 영화  
		// 영화 제목만 가져오기
		titles = doc.select("div.info_tit a.name_movie");
		Elements reserverate = doc.select("span.info_state span.txt_dot");
		// Parsing한 데이터 담기
		for (int i = 0; i < reserverate.size(); i++) {
			Element eTitle = titles.get(i);
			String title = eTitle.text();
			
			
				list.add(title);
		}
		
	} catch (IOException e) {
		e.printStackTrace();
	}

	return list;
}

}
