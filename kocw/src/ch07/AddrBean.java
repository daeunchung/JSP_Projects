package ch07;
/* DO 클래스, 주소록 데이터를 매핑할 때 사용하는 빈즈 클래스 */

public class AddrBean {
	// 맴버변수 선언 -> 입력할 내용
	private String username;
	private String tel;
	private String email;
	private String gender;
	
	// source -> Generate Getters and Setters 
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
}
