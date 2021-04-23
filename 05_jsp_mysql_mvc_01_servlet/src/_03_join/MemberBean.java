package _03_join;

public class MemberBean {

	private String id;
	private String pw;
	private String name;
	private String email;
	private String hobby;
	
	public MemberBean() {}
	public MemberBean(String id, String pw, String name, String email, String hobby) {
		setId(id);
		setPw(pw);
		setName(name);
		setEmail(email);
		setHobby(hobby);
	}

	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPw() {
		return pw;
	}
	public void setPw(String pw) {
		this.pw = pw;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getHobby() {
		return hobby;
	}
	public void setHobby(String hobby) {
		this.hobby = hobby;
	}
}
