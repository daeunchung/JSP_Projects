package board;

public class Board {
	private int num;
	private String writer;
	private String email;
	private String subject;
	private String content;
	private String password;
	private String regDate;
	private int readcount;
	private int ref;
	private int reStep;
	private int reLevel;

	public Board() {}
	public Board(int num, String writer, String email, String subject, String content, String password, String regDate,
			int readcount, int ref, int reStep, int reLevel) {
		this.num = num;
		this.writer = writer;
		this.email = email;
		this.subject = subject;
		this.content = content;
		this.password = password;
		this.regDate = regDate;
		this.readcount = readcount;
		this.ref = ref;
		this.reStep = reStep;
		this.reLevel = reLevel;
	}
	
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getRegDate() {
		return regDate;
	}
	public void setRegDate(String regDate) {
		this.regDate = regDate;
	}
	public int getReadcount() {
		return readcount;
	}
	public void setReadcount(int readcount) {
		this.readcount = readcount;
	}
	public int getRef() {
		return ref;
	}
	public void setRef(int ref) {
		this.ref = ref;
	}
	public int getReStep() {
		return reStep;
	}
	public void setReStep(int reStep) {
		this.reStep = reStep;
	}
	public int getReLevel() {
		return reLevel;
	}
	public void setReLevel(int reLevel) {
		this.reLevel = reLevel;
	}
	
	@Override
	public String toString() {
		return num + "\t" + subject + "\t\t" + readcount + "\t" + ref + "\t" + reStep + "\t" + reLevel;
	}
	
}
