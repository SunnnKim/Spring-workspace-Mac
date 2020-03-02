package main;

import java.io.IOException;
import java.util.Iterator;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;

public class mainClass {
	 public static void main(String[] args) {
	        // Jsoup를 이용해서 네이버 스포츠 크롤링
//	        String url = "http://www.maxmovie.com/Chart/Rank/List";
	        String url = "https://movie.daum.net/premovie/released";
	        Document doc = null;
	         
	        try {
	            doc = Jsoup.connect(url).get();
	        } catch (IOException e) {
	            e.printStackTrace();
	        }
	         
	        // 주요 뉴스로 나오는 태그를 찾아서 가져오도록 한다.
//	        Elements element = doc.select("table.rank_body");
	        Elements element = doc.select("div.info_tit");
/*
 // 영화 제목만 가져오기
			Elements titles = doc.select("div.info_tit a.name_movie");
			/*
			 <div class="box-contents">
                        <a href="/movies/detail-view/?midx=82999">
                            <strong class="title">남산의 부장들</strong>
                        </a>
			 
			
			// 좋아요 값 불러오기txt_dot
			Elements likes = doc.select("span.info_state span.txt_dot");
 
 */
	         
	        // 1. 헤더 부분의 제목을 가져온다.
	        String title = element.select("a.name_movie").text();
	 
	        System.out.println("============================================================");
	        System.out.println(title);
	        System.out.println("============================================================");
	         
	        for(Element el : element.select("a.name_movie")) {    // 하위 뉴스 기사들을 for문 돌면서 출력
	            System.out.println(el.attr("href"));
	        }
	         
	        System.out.println("============================================================");
	    }

}
