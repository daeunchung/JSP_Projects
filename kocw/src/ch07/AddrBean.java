package ch07;
/* DO Ŭ����, �ּҷ� �����͸� ������ �� ����ϴ� ���� Ŭ���� */

public class AddrBean {
	// �ɹ����� ���� -> �Է��� ����
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
