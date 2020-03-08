package mpicker.com.a.model;

public class MyReservationDto {

	private int page;
	private String email;
	
	public MyReservationDto() {
		// TODO Auto-generated constructor stub
	}

	public MyReservationDto(int page, String email) {
		super();
		this.page = page;
		this.email = email;
	}

	public int getPage() {
		return page;
	}

	public void setPage(int page) {
		this.page = page;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	@Override
	public String toString() {
		return "MyReservationDto [page=" + page + ", email=" + email + "]";
	}
	
	
	
}
