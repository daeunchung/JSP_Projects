package ch07;

public class LoginBean {
	// 멤버 변수 선언
	private String userid;
	private String passwd;
	
	// 미리 설정해둘 아이디, 비밀번호 값 
	final String _userid="daeun";
	final String _passwd="1234";
	
	// 사용자 메서드
	public boolean checkUser() {
		if(userid.equals(_userid)&&passwd.equals(_passwd))
			return true;
		else
			return false;
	}

	public String getUserid() {
		return userid;
	}

	public void setUserid(String userid) {
		this.userid = userid;
	}

	public String getPasswd() {
		return passwd;
	}

	public void setPasswd(String passwd) {
		this.passwd = passwd;
	}
	
	
}
