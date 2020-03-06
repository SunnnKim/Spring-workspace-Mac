package mpicker.com.a.model;

import java.io.Serializable;

public class MovieDto implements Serializable {
	// 크롤링 한 데이터 정보들 
	
	// 1. 메인+디테일 뷰에서 필요 
	private String title;	// 영화제목
	private String resereRate;		// 예매율
	private String url;		// detail 뷰의 링크 
	private String starrate;
	private String imgSrc;
	private String aboutMovie;
	// 2. 디테일뷰에서 추가로 필요 
	private String origintitle;
	private String makingNote;
	private String ganre;
	private String movieDate;
	private String director;
	private String casting;
	private String numOfViewers;
	
	
	
	public MovieDto() {
		// TODO Auto-generated constructor stub
	}

	
	// 메인용 생성자 
	public MovieDto(String title, String resereRate, String url, String starrate, String imgSrc, String aboutMovie) {
		super();
		this.title = title;
		this.resereRate = resereRate;
		this.url = url;
		this.starrate = starrate;
		this.imgSrc = imgSrc;
		this.aboutMovie = aboutMovie;
	}
	

	// 모두 다있는 생성자 
	public MovieDto(String title, String resereRate, String url, String starrate, String imgSrc, String aboutMovie,
			String origintitle, String makingNote, String ganre, String movieDate, String director, String casting,
			String numOfViewers) {
		super();
		this.title = title;
		this.resereRate = resereRate;
		this.url = url;
		this.starrate = starrate;
		this.imgSrc = imgSrc;
		this.aboutMovie = aboutMovie;
		this.origintitle = origintitle;
		this.makingNote = makingNote;
		this.ganre = ganre;
		this.movieDate = movieDate;
		this.director = director;
		this.casting = casting;
		this.numOfViewers = numOfViewers;
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

	public String getStarrate() {
		return starrate;
	}

	public void setStarrate(String starrate) {
		this.starrate = starrate;
	}

	public String getAboutMovie() {
		return aboutMovie;
	}

	public void setAboutMovie(String aboutMovie) {
		this.aboutMovie = aboutMovie;
	}

	public String getMakingNote() {
		return makingNote;
	}

	public void setMakingNote(String makingNote) {
		this.makingNote = makingNote;
	}

	public String getGanre() {
		return ganre;
	}

	public void setGanre(String ganre) {
		this.ganre = ganre;
	}

	public String getMovieDate() {
		return movieDate;
	}







	public void setMovieDate(String movieDate) {
		this.movieDate = movieDate;
	}







	public String getDirector() {
		return director;
	}

	public void setDirector(String director) {
		this.director = director;
	}


	public String getCasting() {
		return casting;
	}


	public void setCasting(String casting) {
		this.casting = casting;
	}


	public String getNumOfViewers() {
		return numOfViewers;
	}


	public void setNumOfViewers(String numOfViewers) {
		this.numOfViewers = numOfViewers;
	}

	public String getOrigintitle() {
		return origintitle;
	}


	public void setOrigintitle(String origintitle) {
		this.origintitle = origintitle;
	}


	@Override
	public String toString() {
		return "MovieDto [title=" + title + ", resereRate=" + resereRate + ", url=" + url + ", starrate=" + starrate
				+ ", imgSrc=" + imgSrc + ", aboutMovie=" + aboutMovie + ", origintitle=" + origintitle + ", makingNote="
				+ makingNote + ", ganre=" + ganre + ", movieDate=" + movieDate + ", director=" + director + ", casting="
				+ casting + ", numOfViewers=" + numOfViewers + "]";
	}

	
	
	
	
	
	
	
	

}
