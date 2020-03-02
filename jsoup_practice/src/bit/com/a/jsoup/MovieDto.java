package bit.com.a.jsoup;

public class MovieDto {

	private String title;
	private int likes;
	
	
	public MovieDto() {
		// TODO Auto-generated constructor stub
	}


	public MovieDto(String title, int likes) {
		super();
		this.title = title;
		this.likes = likes;
	}


	public String getTitle() {
		return title;
	}


	public void setTitle(String title) {
		this.title = title;
	}


	public int getLikes() {
		return likes;
	}


	public void setLikes(int likes) {
		this.likes = likes;
	}


	@Override
	public String toString() {
		return "MovieDto [title=" + title + ", likes=" + likes + "]";
	}
	
	
	
	
}
