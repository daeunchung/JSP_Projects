package board;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Random;

public class BoardDAO {
	
	private static BoardDAO instance = new BoardDAO();
	private BoardDAO() {}
	public static BoardDAO getInstance() {	return instance; }
	
	public String filePath = "";
	String fileName = "board.txt";
	
	ArrayList<Board> boardList = new ArrayList<Board>();
	Random ran = new Random();
	
	public void loadData() {
		
		File file = new File(filePath + fileName);
		FileReader fr = null;
		BufferedReader br = null;
		
		try {
			if(file.exists()) {
				fr = new FileReader(file);
				br = new BufferedReader(fr);
				
				boardList.clear();
				
				while(true) {
					String line = br.readLine();
					if(line == null) break;

					String[] info = line.split("/");
					Board board = new Board(Integer.parseInt(info[0]), info[1], info[2], info[3], info[4], info[5], info[6], 
							Integer.parseInt(info[7]), Integer.parseInt(info[8]), Integer.parseInt(info[9]), Integer.parseInt(info[10]));
					
					boardList.add(board);
				}
				System.out.println("[메세지]파일을 로드하였습니다.");
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			if(fr != null) {try {fr.close();} catch (IOException e) {}}
			if(br != null) {try {br.close();} catch (IOException e) {}}
		}
	}

	public void saveDate() {
		
		sortBoard();
		
		String data = "";
		
		for(int i=0; i<boardList.size(); i++) {
			Board board = boardList.get(i);
			data += board.getNum();
			data += "/";
			data += board.getWriter();
			data += "/";
			data += board.getEmail();
			data += "/";
			data += board.getSubject();
			data += "/";
			data += board.getContent();
			data += "/";
			data += board.getPassword();
			data += "/";
			data += board.getRegDate();
			data += "/";
			data += board.getReadcount();
			data += "/";
			data += board.getRef();
			data += "/";
			data += board.getReStep();
			data += "/";
			data += board.getReLevel();
			
			if(i != boardList.size()-1) {
				data += "\n";
			}
		}
		
		FileWriter fw = null;
		try {
			fw = new FileWriter(filePath + fileName);
			fw.write(data);
			System.out.println("[메세지]파일을 저장하였습니다.");
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			if(fw != null) {try {fw.close();} catch (IOException e) {}}
		}
		
		System.out.println("번호\t제목\t조회수\tref\treStep\treLevel");
		for(int i=0; i<boardList.size(); i++) {
			System.out.println("----------------------------------------------------------");
			System.out.println(boardList.get(i).toString());
		}
	}
	
	public void insertBoard(Board board) {
		int maxNum = 0;
		for(int i=0; i<boardList.size(); i++) {
			if(maxNum < boardList.get(i).getNum()) {
				maxNum = boardList.get(i).getNum();
			}
		}		

		int maxRef = 0;
		for(int i=0; i<boardList.size(); i++) {
			if(maxRef < boardList.get(i).getRef()) {
				maxRef = boardList.get(i).getRef();
			}
		}
		
		board.setNum(maxNum + 1);
		board.setRef(maxRef + 1);
		board.setReStep(1);
		board.setReLevel(1);
		board.setReadcount(0);
		
		Date date =  new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		String regDate = sdf.format(date);
		board.setRegDate(regDate);
		
		boardList.add(board);
		
		saveDate();
	}

	public void insertDummy() {
		Board board = new Board();
		
		String[] a = { "이", "최", "박", "김" , "조" , "신" , "유" , "윤"};
		String[] b = { "민", "여", "명", "조" , "승" , "난" , "재" , "홍"};
		String[] c = { "수", "정", "수", "한" , "모" , "다" , "석" , "만"};
		
		String temp = "";
		int r = 0;
		for(int i=0; i<3; i++) {
			r = ran.nextInt(a.length);
			temp += a[r];
			r = ran.nextInt(b.length);
			temp += b[r];
			r = ran.nextInt(c.length);
			temp += c[r];
		}
		board.setWriter(temp);
		
		temp = "";
		r = ran.nextInt(a.length);
		temp += a[r];
		temp += "@";
		r = ran.nextInt(b.length);
		temp += b[r];
		board.setEmail(temp);
		
		temp = "";
		for(int i=0; i<2; i++) {
			r = ran.nextInt(a.length);
			temp += a[r];
			r = ran.nextInt(b.length);
			temp += b[r];
		}
		board.setSubject(temp);
		
		temp = "";
		for(int i=0; i<4; i++) {
			r = ran.nextInt(a.length);
			temp += a[r];
			r = ran.nextInt(b.length);
			temp += b[r];
		}
		board.setContent(temp);

		board.setPassword("1234");
		
		insertBoard(board);
		
		saveDate();
	}
	
	public int getAllCount() {
		return boardList.size();
	}

	public void sortBoard() {
		for(int i=0; i<boardList.size(); i++) {
			Board temp = boardList.get(i);
			for(int j=i; j<boardList.size(); j++) {
				if(temp.getRef() < boardList.get(j).getRef()) {
					temp = boardList.get(i);
					
					Board info = boardList.get(i);
					boardList.set(i, boardList.get(j));
					boardList.set(j, info);
				}
			}
		}

		for(int i=0; i<boardList.size(); i++) {
			Board temp = boardList.get(i);
			for(int j=i; j<boardList.size(); j++) {
				if(temp.getRef() == boardList.get(j).getRef()) {
					if(temp.getReLevel() > boardList.get(j).getReLevel()) {
						temp = boardList.get(i);
						
						Board info = boardList.get(i);
						boardList.set(i, boardList.get(j));
						boardList.set(j, info);
					}
				}
			}
		}		
		
		System.out.println("번  호\t제  목\t\t\t조회수\tref\treStep\treLevel");
		for(int i=0; i<boardList.size(); i++) {
			System.out.println("---------------------------------------------------------------");
			System.out.println(boardList.get(i).toString());
		}
	}
	
	public ArrayList<Board> getAllBoard(int startRow, int endRow){
		
		ArrayList<Board> temp = new ArrayList<Board>();
		for(int i=startRow; i<endRow; i++) {
			temp.add(boardList.get(i));
		}
		
		return temp;
	}

	public int checkNum(int num) {
		int index = -1;
		
		for(int i=0; i<boardList.size(); i++) {
			if(num == boardList.get(i).getNum()) {
				index = i;
			}
		}
		return index;
	}
	
	public Board getOneBoard(int num) {
		int index = checkNum(num);
		Board board = boardList.get(index);

		int readcount = board.getReadcount();
		board.setReadcount(readcount + 1);
		
		saveDate();
		
		return board;
	}
	
	public Board getOneUpdateBoard(int num) {
		int index = checkNum(num);
		Board board = boardList.get(index);
		
		return board;
	}
	
	public boolean checkPassword(int num, String password) {
		int index = checkNum(num);
		
		boolean check = false;
		String dbPassword = boardList.get(index).getPassword();
		if(password.equals(dbPassword)) {
			check = !check;
		}
		
		return check;
	}

	public void updateBoard(int num, String subject, String content) {
		int index = checkNum(num);
		
		Board board = boardList.get(index);
		board.setSubject(subject);
		board.setContent(content);
		
		saveDate();
	}

	public void deleteBoard(int num) {
		int index = checkNum(num);
		boardList.remove(index);
		
		saveDate();
	}

	public void reWriteBoard(Board board) {
		int maxNum = 0;
		for(int i=0; i<boardList.size(); i++) {
			if(maxNum < boardList.get(i).getNum()) {
				maxNum = boardList.get(i).getNum();
			}
		}		
		
		int ref = board.getRef();
		int reStep = board.getReStep();
		
		int reLevel = board.getReLevel();
		for(int i=0; i<boardList.size(); i++) {
			Board temp = boardList.get(i);
			if(ref == temp.getRef()) {
				if(reLevel < temp.getReLevel()) {
					temp.setReLevel(temp.getReLevel() + 1);
				}
			}
		}
		
		board.setNum(maxNum + 1);
		board.setRef(ref);
		board.setReStep(reStep + 1);
		board.setReLevel(reLevel + 1);
		board.setReadcount(0);

		Date date =  new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		String regDate = sdf.format(date);
		board.setRegDate(regDate);	
		
		boardList.add(board);
		
		saveDate();
	}
	
}
