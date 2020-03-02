package mpicker.com.a.model;

import java.io.Serializable;

public class MovieDto implements Serializable {
	// 크롤링 한 데이터 정보들 
	private String title;	// 영화제목
	private String resereRate;		// 예매율
	private String url;		// detail 뷰의 링크 
	//private String rate;
	private String imgSrc;
	
	public MovieDto() {
		// TODO Auto-generated constructor stub
	}

	public MovieDto(String title, String resereRate, String url, String imgSrc) {
		super();
		this.title = title;
		this.resereRate = resereRate;
		this.url = url;
		this.imgSrc = imgSrc;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getResereRate() {
		return resereRate;
	}

	public void setResereRate(String resereRate) {
		this.resereRate = resereRate;
	}

	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}

	public String getImgSrc() {
		return imgSrc;
	}

	public void setImgSrc(String imgSrc) {
		this.imgSrc = imgSrc;
	}

	@Override
	public String toString() {
		return "MovieDto [title=" + title + ", resereRate=" + resereRate + ", url=" + url + ", imgSrc=" + imgSrc + "]";
	}

	
	
}
