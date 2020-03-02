package bit.com.a.jsoup;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;


public class MovieManager {
public static List<MovieDto> getCGVdata(){
		
		Document doc; 	//jsoup 소속의 Document
		
		List<MovieDto> list = new ArrayList<MovieDto>();
		
		try {
			doc = Jsoup.connect("https://movie.daum.net/premovie/released").get();
			// 가져오려고 하는 사이트의 url 
			
			// 영화 제목만 가져오기
			Elements titles = doc.select("div.info_tit a.name_movie");
			/*
			 <div class="box-contents">
                        <a href="/movies/detail-view/?midx=82999">
                            <strong class="title">남산의 부장들</strong>
                        </a>
			 
			 */
			
			// 좋아요 값 불러오기
			Elements likes = doc.select("div.info_tit a.name_movie");
			/*
			<div class="box-contents">
			 <span class="count"> 
                <strong><i>6,673</i><span>명이 선택</span></strong> 
			 */
					
					
			// Parsing한 데이터 담기
			for (int i = 0; i < 7; i++) {
				Element eTitle = titles.get(i);
				String title = eTitle.text();
				
				
				Element eLike = likes.get(i);
				String sLike = eLike.text();
				
//				int like = Integer.parseInt(sLike);
				
				MovieDto vo = new MovieDto(title,3);
				
				list.add(vo);
				
//				System.out.println(title+ " Like: " + sLike);
//				System.out.println(i+ " title: " + title);
				
			}
		} catch (IOException e) {
			e.printStackTrace();
		}
	
		return list;
	}

	
}
