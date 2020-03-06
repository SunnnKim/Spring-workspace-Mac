package mpicker.com.a.dao;

public class ReserveDto {
	
	private int seq;
	private String email;	// 결제창에서 
	private String movieTitle;
	private String location;
	private String theater;
	private String movieDate;
	private String movieTime;
	private String payment;	// 결제창에서 
	private String seats;	// 결제창에서 
	private int ticketNum;	// 결제창에서 
	private int price;		// 결제창에서 
	private String pdate;	// 결제일 -> 디비에서 
	
	public ReserveDto() {
		// TODO Auto-generated constructor stub
	}

	public ReserveDto(int seq, String email, String movieTitle, String location, String theater, String movieDate,
			String movieTime, String payment, String seats, int ticketNum, int price, String pdate) {
		super();
		this.seq = seq;
		this.email = email;
		this.movieTitle = movieTitle;
		this.location = location;
		this.theater = theater;
		this.movieDate = movieDate;
		this.movieTime = movieTime;
		this.payment = payment;
		this.seats = seats;
		this.ticketNum = ticketNum;
		this.price = price;
		this.pdate = pdate;
	}

	public int getSeq() {
		return seq;
	}

	public void setSeq(int seq) {
		this.seq = seq;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getMovieTitle() {
		return movieTitle;
	}

	public void setMovieTitle(String movieTitle) {
		this.movieTitle = movieTitle;
	}

	public String getLocation() {
		return location;
	}

	public void setLocation(String location) {
		this.location = location;
	}

	public String getTheater() {
		return theater;
	}

	public void setTheater(String theater) {
		this.theater = theater;
	}

	public String getMovieDate() {
		return movieDate;
	}

	public void setMovieDate(String movieDate) {
		this.movieDate = movieDate;
	}

	public String getMovieTime() {
		return movieTime;
	}

	public void setMovieTime(String movieTime) {
		this.movieTime = movieTime;
	}

	public String getPayment() {
		return payment;
	}

	public void setPayment(String payment) {
		this.payment = payment;
	}

	public String getSeats() {
		return seats;
	}

	public void setSeats(String seats) {
		this.seats = seats;
	}

	public int getTicketNum() {
		return ticketNum;
	}

	public void setTicketNum(int ticketNum) {
		this.ticketNum = ticketNum;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public String getPdate() {
		return pdate;
	}

	public void setPdate(String pdate) {
		this.pdate = pdate;
	}

	@Override
	public String toString() {
		return "ReserveDto [seq=" + seq + ", email=" + email + ", movieTitle=" + movieTitle + ", location=" + location
				+ ", theater=" + theater + ", movieDate=" + movieDate + ", movieTime=" + movieTime + ", payment="
				+ payment + ", seats=" + seats + ", ticketNum=" + ticketNum + ", price=" + price + ", pdate=" + pdate
				+ "]";
	}


}


