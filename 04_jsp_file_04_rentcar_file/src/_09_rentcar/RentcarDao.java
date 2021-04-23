package _09_rentcar;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;
import java.io.FileWriter;
import java.util.ArrayList;
import java.util.Random;


public class RentcarDao {
	static public RentcarDao instance = new RentcarDao();
	public String realpath = "";
	String filename = "/rentcardata.txt";
	Random ran = new Random();

	ArrayList<Rentcar> rentcarList = new ArrayList<>();
	ArrayList<Member> memberList = new ArrayList<>();
	ArrayList<CarReserve> reserveList = new ArrayList<>();

	public void memberBasicSet() {
		Member mb = new Member();
		mb.setId("aa");
		mb.setPw("11");
		memberList.add(mb);
		mb = new Member();
		mb.setId("bb");
		mb.setPw("22");
		memberList.add(mb);
	}

	public void rentcarBasicSet() {
		rentcarList.clear();
		Rentcar rc;
		rc = new Rentcar(1, "아반테", 1, 2000, 4, "기아", "rent_1.jpg", "아반테 자동차 입니다.");
		rentcarList.add(rc);
		rc = new Rentcar(2, "BMW", 3, 6000, 4, "BMW", "rent_2.jpg", "BMW 자동차 입니다.");
		rentcarList.add(rc);
		rc = new Rentcar(3, "카니발", 1, 4000, 7, "기아", "rent_3.jpg", "카니발 자동차 입니다.");
		rentcarList.add(rc);
		rc = new Rentcar(4, "카렌스", 2, 2500, 4, "기아", "rent_4.jpg", "카렌스 자동차 입니다.");
		rentcarList.add(rc);
		rc = new Rentcar(5, "코란도", 1, 3000, 4, "현대", "rent_5.jpg", "코란도 자동차 입니다.");
		rentcarList.add(rc);
		rc = new Rentcar(6, "에쿠스", 3, 6000, 4, "BMW", "rent_6.jpg", "에쿠스 자동차 입니다.");
		rentcarList.add(rc);
		rc = new Rentcar(7, "제네시스", 1, 3000, 4, "기아", "rent_7.jpg", "제네시스 자동차 입니다.");
		rentcarList.add(rc);
		rc = new Rentcar(8, "그랜져", 1, 2400, 4, "현대", "rent_8.jpg", "그랜져 자동차 입니다.");
		rentcarList.add(rc);
		rc = new Rentcar(9, "k3", 1, 2700, 4, "현대", "rent_9.jpg", "k3 자동차 입니다.");
		rentcarList.add(rc);
		rc = new Rentcar(10, "k5", 2, 5000, 4, "기아", "rent_10.jpg", "k5 자동차 입니다.");
		rentcarList.add(rc);
		rc = new Rentcar(11, "k9", 1, 6000, 4, "현대", "rent_11.jpg", "k9 자동차 입니다.");
		rentcarList.add(rc);
		rc = new Rentcar(12, "라세티", 2, 2000, 5, "기아", "rent_12.jpg", "라세티 자동차 입니다.");
		rentcarList.add(rc);
		rc = new Rentcar(13, "lf소나타", 1, 2000, 4, "현대", "rent_13.jpg", "lf소나타 자동차 입니다.");
		rentcarList.add(rc);
		rc = new Rentcar(14, "말리부", 3, 2000, 4, "BMW", "rent_14.jpg", "말리부 자동차 입니다.");
		rentcarList.add(rc);
		rc = new Rentcar(15, "모닝", 1, 23000, 4, "현대", "rent_15.jpg", "모닝 자동차 입니다.");
		rentcarList.add(rc);
		rc = new Rentcar(16, "올라도", 3, 5000, 4, "BMW", "rent_16.jpg", "올라도 자동차 입니다.");
		rentcarList.add(rc);
		rc = new Rentcar(17, "레이", 2, 4000, 4, "현대", "rent_17.jpg", "레이 자동차 입니다.");
		rentcarList.add(rc);
		rc = new Rentcar(18, "SM5", 1, 2700, 4, "BMW", "rent_18.jpg", "SM5 자동차 입니다.");
		rentcarList.add(rc);
	}

	public int getMember(String id, String pw) {

		int result = 0;// 0이면, 회원 없음
		for (int i = 0; i < memberList.size(); i++) {
			if (id.equals(memberList.get(i).getId()) && pw.equals(memberList.get(i).getPw())) {
				result = 1;
				break;
			}
		}
		return result;
	}

	public ArrayList<Rentcar> getSelectCar3() {
		ArrayList<Rentcar> list = new ArrayList<Rentcar>();
		for (int i = 0; i < rentcarList.size(); i++) {
			list.add(rentcarList.get(i));
			if (i >= 2) {
				return list;
			}
		}
		return list;
	}

	public ArrayList<Rentcar> getAllCar() {
		return rentcarList;
	}

	public Rentcar getOneCar(int no) {
		no = no - 1;
		return rentcarList.get(no);
	}

	public void setReserveCar(CarReserve bean) {
		int max_num = 0;

		if (reserveList.size() > 0) {
			int last = reserveList.size() - 1;
			max_num = reserveList.get(last).getNo();
		}
		bean.setReserve_seq(max_num);
		reserveList.add(bean);
		saveData();
	}

	public ArrayList<Rentcar> getCategoryCar(int cate) {
		ArrayList<Rentcar> list = new ArrayList<>();
		for (int i = 0; i < rentcarList.size(); i++) {
			if (rentcarList.get(i).getCategory() == cate) {

				list.add(rentcarList.get(i));
			}
		}

		return list;
	}

	public ArrayList<CarView> getAllReserve(String id) {
		ArrayList<CarView> vec = new ArrayList<>();

		for (int i = 0; i < reserveList.size(); i++) {
			CarReserve reserve = reserveList.get(i);
			if (reserve.getId().equals(id)) {

				for (int n = 0; n < rentcarList.size(); n++) {
					if (reserve.getNo() == rentcarList.get(n).getNo()) {
						Rentcar car = rentcarList.get(n);
						CarView view = new CarView();
						view.setName(car.getName());
						view.setPrice(car.getPrice());
						view.setImg(car.getImg());
						view.setQty(reserve.getQty());
						view.setDday(reserve.getDday());
						view.setRday(reserve.getRday());
						view.setUsein(reserve.getUsein());
						view.setUsewifi(reserve.getUsewifi());
						view.setUsenavi(reserve.getUsenavi());
						view.setUseseat(reserve.getUseseat());
						vec.add(view);
					}
				}

			}
		}
		return vec;
	}

	public void carRemoveReserve(String id, String rday) {

		for (int i = 0; i < reserveList.size(); i++) {
			CarReserve reserve = reserveList.get(i);
			if (id.equals(reserve.getId())) {
				if (rday.equals(reserve.getRday())) {
					reserveList.remove(i);
					saveData();
					break;
				}
			}
		}
	}

	public void saveData() {
		String data = "";
		for (int i = 0; i < reserveList.size(); i++) {
			data += reserveList.get(i).getReserve_seq();
			data += "/";
			data += reserveList.get(i).getNo();
			data += "/";
			data += reserveList.get(i).getId();
			data += "/";
			data += reserveList.get(i).getQty();
			data += "/";
			data += reserveList.get(i).getDday();
			data += "/";
			data += reserveList.get(i).getRday();
			data += "/";
			data += reserveList.get(i).getUsein();
			data += "/";
			data += reserveList.get(i).getUsewifi();
			data += "/";
			data += reserveList.get(i).getUsenavi();
			data += "/";
			data += reserveList.get(i).getUseseat();

			if (i < reserveList.size() - 1) {
				data += "\n";
			}
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
				reserveList.clear();
				while (line != null) {
					String arr[] = line.split("/");
					CarReserve reserve = new CarReserve(Integer.parseInt(arr[0]), Integer.parseInt(arr[1]), arr[2],
							Integer.parseInt(arr[3]), Integer.parseInt(arr[4]), arr[5], Integer.parseInt(arr[6]),
							Integer.parseInt(arr[7]), Integer.parseInt(arr[8]), Integer.parseInt(arr[9]));
					reserveList.add(reserve);
					line = br.readLine();
				}
				printReserveList();
				fr.close();
				br.close();
			} catch (Exception e) {
			}
		}
	}

	public void printReserveList() {
		for (int i = 0; i < reserveList.size(); i++) {
			reserveList.get(i).printReserve();
		}
	}
}
