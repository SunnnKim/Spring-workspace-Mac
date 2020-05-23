package pickme.com.a.model;

public class UserDto {
	private int seq;
	private String email;
	private String pwd;
	private String name;
	private int auth;
	
	public UserDto() {
		// TODO Auto-generated constructor stub
	}

	public UserDto(int seq, String email, String pwd, String name, int auth) {
		super();
		this.seq = seq;
		this.email = email;
		this.pwd = pwd;
		this.name = name;
		this.auth = auth;
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

	public String getPwd() {
		return pwd;
	}

	public void setPwd(String pwd) {
		this.pwd = pwd;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getAuth() {
		return auth;
	}

	public void setAuth(int auth) {
		this.auth = auth;
	}

	@Override
	public String toString() {
		return "UserDto [seq=" + seq + ", email=" + email + ", pwd=" + pwd + ", name=" + name + ", auth=" + auth + "]";
	}
	
	
	
}
