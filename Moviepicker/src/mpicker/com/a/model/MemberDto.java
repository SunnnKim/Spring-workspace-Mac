package mpicker.com.a.model;

import java.io.Serializable;

/*
  -- DROP TABLE
DROP TABLE MOVIEMEMBER
CASCADE CONSTRAINTS;


-- MOVIEMEMBER TABLE
CREATE TABLE MOVIEMEMBER(
    EMAIL VARCHAR2(100) PRIMARY KEY,
    PWD VARCHAR2(50) NOT NULL,
    NAME VARCHAR2(30) NOT NULL,
    AUTH NUMBER(8) NOT NULL
);


 */
public class MemberDto implements Serializable {
	// 회원정보 클래스
	private String email;
	private String pwd;
	private String name;
	private int auth;	// 사용자는 3, 관리자 1
	
	public MemberDto() {

		// TODO Auto-generated constructor stub
	}

	public MemberDto(String email, String pwd, String name, int auth) {
		super();
		this.email = email;
		this.pwd = pwd;
		this.name = name;
		this.auth = auth;
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
		return "MemberDto [email=" + email + ", pwd=" + pwd + ", name=" + name + ", auth=" + auth + "]";
	}

	
	
	
	
}
