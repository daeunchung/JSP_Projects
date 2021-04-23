package _05_user;
import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;
import java.io.FileWriter;
import java.util.ArrayList;
public class UserDao {
	static public UserDao instance = new UserDao();
	ArrayList<User> userList = new ArrayList<>();
	public String realpath = "";
	String filename = "/userdata.txt";
	public void insertUser(User user) {
		userList.add(user);
		saveData();
	}
	public void updateUser(User user) {
		System.out.println(user.id);
		System.out.println(user.pw);
		System.out.println(user.name);
		System.out.println(user.reg_date);
		for(User temp : userList) {
			if(temp.id.equals(user.id)) {
				temp = user;
				saveData();
				break;
			}
		}	
		
	}
	public void deleteUserId(String id) {
		int i = 0;
		for(User temp : userList) {
			if(temp.id.equals(id)) {				
				userList.remove(i);
				saveData();
				break;
			}
			i += 1;
		}	
	}
	public boolean checkUserId(User user) {
		for(User temp : userList) {
			if(temp.id.equals(user.id)) {				
				return true;
			}
		}		
		return false;
	}
	public boolean checkUserIdPw(String id , String pw) {
		for(User temp : userList) {
			if(temp.id.equals(id) && temp.pw.equals(pw)) {
				return true;
			}
		}	
		return false;
	}
	public User getUserId(String id) {
		for(User temp : userList) {
			if(temp.id.equals(id)) {
				return temp;
			}
		}	
		return null;
	}
	
	public void loadData() {		
		File file  = new File(realpath + filename);
		if(file.exists()) {
			userList.clear();	
			try {
				FileReader fr = new FileReader(file);
				BufferedReader br = new BufferedReader(fr);
				String line = br.readLine();
				while(line != null) {					
					String arr[] = line.split("/");
					User user = new User();
					user.id = arr[0];
					user.pw = arr[1];
					user.name = arr[2];
					user.reg_date = arr[3];
					userList.add(user);
					line = br.readLine();
				}
				fr.close();
				br.close();
			}catch(Exception e) {
				e.printStackTrace();
			}
		}
	}
	
	public void saveData() {
		String data = "";
		for(User temp : userList) {
			data += temp.id;
			data += "/";
			data += temp.pw;
			data += "/";
			data += temp.name;
			data += "/";
			data += temp.reg_date;
			data += "\r\n";
		}	
		try {
			System.out.println(realpath);
			FileWriter fw = new FileWriter(realpath + filename);
			fw.write(data);
			fw.close();
		}catch(Exception e) {
			e.printStackTrace();
		}				
	}
}
