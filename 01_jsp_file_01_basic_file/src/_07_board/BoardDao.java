package _07_board;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;
import java.io.FileWriter;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Random;

public class BoardDao {
	static public BoardDao instance = new BoardDao();
	ArrayList<Board> boardList = new ArrayList<>();
	public String realpath = "";
	String filename = "/boarddata.txt";
	Random ran = new Random();

	public void insertDummy() {
		Board board = new Board();
		String[] a = { "aa", "bb", "cc", "dd", "ee", "ff", "gg" };
		String[] b = { "hh", "kk", "jj", "ll", "oo", "pp", "qq" };
		
		String temp = "";
		int r = 0;
		for (int i = 0; i < 2; i++) {
			r = ran.nextInt(a.length);
			temp += a[r];
			r = ran.nextInt(a.length);
			temp += b[r];
			
		}
		board.setWriter(temp);
		temp = "";

		r = ran.nextInt(a.length);
		temp += a[r];	
		temp += "@";
		r = ran.nextInt(a.length);
		temp += b[r];

		board.setEmail(temp);
		
		temp = "";
		for (int i = 0; i < 2; i++) {
			r = ran.nextInt(a.length);
			temp += a[r];
			r = ran.nextInt(a.length);
			temp += b[r];			
		}
		board.setSubject(temp);
		board.setPassword("1234");
		temp = "";
		for (int i = 0; i < 4; i++) {
			r = ran.nextInt(a.length);
			temp += a[r];
			r = ran.nextInt(a.length);
			temp += b[r];			
		}
		board.setContent(temp);
		insertBoard(board);
	}

	public void insertBoard(Board board) {
		// board.printBoard();
		int max_num = 0;
		int max_ref = 0;
		if (boardList.size() > 0) {
			int last = boardList.size() - 1;
			max_num = boardList.get(last).getNum();
			max_ref = boardList.get(last).getRef();
		}
		Date d = new Date();
		String s = d.toString();
		System.out.println("현재날짜 : " + s);

		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		System.out.println("현재날짜 : " + sdf.format(d));

		String reg_date = sdf.format(d);
		board.setNum(max_num + 1);
		board.setRef(max_ref + 1);
		board.setRe_step(1);
		board.setRe_level(1);
		board.setReadcount(0);
		board.setReg_date(reg_date);
		boardList.add(board);
		saveData();
	}

	public ArrayList<Board> getAllBoard(int start, int end) {
		
		ArrayList<Board> vec = new ArrayList<Board>();
		for (int i = start; i < boardList.size(); i++) {
			if (i < end) {
				vec.add(boardList.get(i));
			}
		}
		for(int i = 0; i < vec.size();i++) {
			Board a = vec.get(i);
			int max = a.getRef();
			int index = i;
			for(int n = i; n < vec.size(); n++) {
				Board b = vec.get(n);
				if(a.getRef() < b.getRef()) {				
						max = b.getRe_level();
						index = n;					
				}
			}
			Board temp = vec.get(i);
			vec.set(i , vec.get(index));
			vec.set(index , temp);
		}		
		
		for(int i = 0; i < vec.size();i++) {
			Board a = vec.get(i);
			int min = a.getRe_level();
			int index = i;
			for(int n = i; n < vec.size(); n++) {
				Board b = vec.get(n);
				if(a.getRef() == b.getRef()) {
					if(min > b.getRe_level()) {
						min = b.getRe_level();
						index = n;
					}
				}
			}
			Board temp = vec.get(i);
			vec.set(i , vec.get(index));
			vec.set(index , temp);
		}		
		return vec;
	}

	public int getAllCount() {
		return boardList.size();
	}

	public Board getOneBoard(int num) {
		num = num - 1;
		int readcount = boardList.get(num).getReadcount();
		boardList.get(num).setReadcount(readcount + 1);
		return boardList.get(num);
	}

	public Board getOneUpdateBoard(int num) {
		num = num - 1;
		return boardList.get(num);
	}

	public String getPass(int num) {
		num = num - 1;
		String pass = boardList.get(num).getPassword();

		return pass;
	}

	public void updateBoard(Board bean) {
		bean.printBoard();
		for (int i = 0; i < boardList.size(); i++) {
			if (boardList.get(i).getNum() == bean.getNum()) {
				boardList.set(i, bean);
				saveData();
				break;
			}
		}
	}
	public void deleteBoard(int num) {
		num = num - 1;
		boardList.remove(num);
		saveData();
	}
	public void reWriteBoard(Board bean) {
		int ref = bean.getRef();
		int re_step = bean.getRe_step();
		int re_level = bean.getRe_level();
		
		int num = boardList.size();
		
		for(int i = 0; i < boardList.size(); i++) {
			if(boardList.get(i).getRef() == ref) {
				int relevel = boardList.get(i).getRe_level();
				if(relevel > re_level) {					
					boardList.get(i).setRe_level(relevel + 1);				
				}
			}
		}
		Date d = new Date();
		String s = d.toString();
		System.out.println("현재날짜 : " + s);
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		System.out.println("현재날짜 : " + sdf.format(d));
		String reg_date = sdf.format(d);	
		bean.setNum(num + 1);
		bean.setRef(ref);
		bean.setRe_step( re_step + 1);
		bean.setRe_level(re_level + 1);
		bean.setReg_date(reg_date);
		bean.setReadcount(0);
		boardList.add(bean);
		saveData();
	}

	
	public void saveData() {
		String data = "";
		for (int i = 0; i < boardList.size(); i++) {
			data += boardList.get(i).getNum();
			data += "/";
			data += boardList.get(i).getWriter();
			data += "/";
			data += boardList.get(i).getEmail();
			data += "/";
			data += boardList.get(i).getSubject();
			data += "/";
			data += boardList.get(i).getPassword();
			data += "/";
			data += boardList.get(i).getReg_date();
			data += "/";
			data += boardList.get(i).getRef();
			data += "/";
			data += boardList.get(i).getRe_step();
			data += "/";
			data += boardList.get(i).getRe_level();
			data += "/";
			data += boardList.get(i).getReadcount();
			data += "/";
			data += boardList.get(i).getContent();
			data += "\n";
//			if (i < boardList.size() - 1) {
//				data += "\n";
//			}
		}
		try {
			FileWriter fw = new FileWriter(realpath + filename);
			fw.write(data);
			fw.close();
		} catch (Exception e) {
		}

		System.out.println(data);
	}

	public void loadData() {
		File file = new File(realpath + filename);
		if (file.exists()) {
			try {
				FileReader fr = new FileReader(file);
				BufferedReader br = new BufferedReader(fr);
				String line = br.readLine();
				boardList.clear();
				while (line != null) {
					String arr[] = line.split("/");
					Board board = new Board(Integer.parseInt(arr[0]), arr[1], arr[2], arr[3], arr[4], arr[5],
							Integer.parseInt(arr[6]), Integer.parseInt(arr[7]), Integer.parseInt(arr[8]),
							Integer.parseInt(arr[9]), arr[10]);
					boardList.add(board);
					line = br.readLine();
				}
				fr.close();
				br.close();
			} catch (Exception e) {
			}
		}
	}
}
