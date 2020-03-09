package bit.com.a.model;

public class SearchDto {
	private String choice;
	private String searchword;
	
	public SearchDto() {
		// TODO Auto-generated constructor stub
	}

	public SearchDto(String choice, String searchword) {
		super();
		this.choice = choice;
		this.searchword = searchword;
	}

	public String getChoice() {
		return choice;
	}

	public void setChoice(String choice) {
		this.choice = choice;
	}

	public String getSearchword() {
		return searchword;
	}

	public void setSearchword(String searchword) {
		this.searchword = searchword;
	}

	@Override
	public String toString() {
		return "SearchDto [choice=" + choice + ", searchword=" + searchword + "]";
	}
	
	
}
