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

	public static List<MovieDto> getMaindata(String url){
		
		Document doc; 	//jsoup 소속의 Document
		
		List<MovieDto> list = new ArrayList<MovieDto>();
	//	String url = "https://movie.daum.net/premovie/released"; //크롤링할 url지정
		
		try {
			doc = Jsoup.connect(url).get();
			// 가져오려고 하는 사이트의 url 
			
			// 영화 제목만 가져오기
			Elements titles = doc.select("div.info_tit a.name_movie");
			/*
			 <div class="box-contents">
                        <a href="/movies/detail-view/?midx=82999">
                            <strong class="title">남산의 부장들</strong>
                        </a>
			 
			 */
			
			// 좋아요 값 불러오기txt_dot
			Elements resereRate = doc.select("span.info_state");
			/*
			<div class="box-contents">
			 <span class="count"> 
                <strong><i>6,673</i><span>명이 선택</span></strong> 
			 */
			
			// 링크주소불러오기 
			Elements urls = doc.select("div.info_tit a.name_movie");

			
			// 이미지링크 
			Elements imgs = doc.select("div.info_movie span.thumb_movie img");
					
					
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

				
				
				MovieDto dto = new MovieDto(title,_resereRate,surl, imgUrl);
				
				list.add(dto);
				
//				System.out.println(title+ " Like: " + sLike);
//				System.out.println(i+ " title: " + title);
//				System.out.println(i+ " url: " + surl);
				
			}
		} catch (IOException e) {
			e.printStackTrace();
		}
	
		return list;
	}
	
}
