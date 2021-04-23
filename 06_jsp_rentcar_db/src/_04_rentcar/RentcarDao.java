package _04_rentcar;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Vector;



public class RentcarDao {
	private RentcarDao() {
	}

	private static RentcarDao dao = new RentcarDao();

	public static RentcarDao getInstance() {
		return dao;
	}

	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;

	public Connection getConnection() {
		String dbURL = "jdbc:mysql://localhost:3306/rentcardb04?serverTimezone=UTC";
		String dbID = "root";
		String dbPassword = "root";
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			conn = DriverManager.getConnection(dbURL, dbID, dbPassword);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return conn;
	}

	public int getMember(String id, String pw) {

		int result = 0; 

		conn = getConnection();
		try {

			String sql = "SELECT COUNT(*) FROM member WHERE id=? and pw1=?";
			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, id);
			pstmt.setString(2, pw);
			
			rs = pstmt.executeQuery();

			if (rs.next()) {
				result = rs.getInt(1); 
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (conn != null) {
				try {
					conn.close();
				} catch (SQLException e) {
				}
			}
			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException e) {
				}
			}
			if (rs != null) {
				try {
					rs.close();
				} catch (SQLException e) {
				}
			}
		}
		return result;
	}

	
	public Vector<RentcarBean> getSelectCar() {
		
		Vector<RentcarBean> v = new Vector<RentcarBean>();

		try {
			
			conn = getConnection();

			String sql = "SELECT * FROM rentcar ORDER BY no DESC";
			// String sql = "SELECT * FROM rentcar ORDER BY no DESC LIMIT 3";
			pstmt = conn.prepareStatement(sql);
			
			rs = pstmt.executeQuery();
			int count = 0;
			while (rs.next()) {

				RentcarBean bean = new RentcarBean();
				bean.setNo(rs.getInt(1));
				bean.setName(rs.getString(2));
				bean.setCategory(rs.getInt(3));
				bean.setPrice(rs.getInt(4));
				bean.setUsepeople(rs.getInt(5));
				bean.setCompany(rs.getString(6));
				bean.setImg(rs.getString(7));
				bean.setInfo(rs.getString(8));
				
				v.add(bean);
				count++;
				
				if (count > 2)
					break; 
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (conn != null) {
				try {
					conn.close();
				} catch (SQLException e) {
				}
			}
			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException e) {
				}
			}
			if (rs != null) {
				try {
					rs.close();
				} catch (SQLException e) {
				}
			}
		}

		return v;
	}

	
	public RentcarBean getOneCar(int no) {
		
		RentcarBean bean = new RentcarBean();
		conn = getConnection();

		try {
			
			String sql = "SELECT * FROM rentcar WHERE no=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, no);

			rs = pstmt.executeQuery();
			if (rs.next()) {
				bean.setNo(rs.getInt(1));
				bean.setName(rs.getString(2));
				bean.setCategory(rs.getInt(3));
				bean.setPrice(rs.getInt(4));
				bean.setUsepeople(rs.getInt(5));
				bean.setCompany(rs.getString(6));
				bean.setImg(rs.getString(7));
				bean.setInfo(rs.getString(8));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (conn != null) {
				try {
					conn.close();
				} catch (SQLException e) {
				}
			}
			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException e) {
				}
			}
			if (rs != null) {
				try {
					rs.close();
				} catch (SQLException e) {
				}
			}
		}
		return bean;
	}

	
	public void setReserveCar(CarReserveBean bean) {

		conn = getConnection();
		int num = 0;
		try {

			String numSql = "SELECT MAX(reserve_seq) FROM carreserve";
			pstmt = conn.prepareStatement(numSql);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				num = rs.getInt(1) + 1;
			}

			String sql = "INSERT INTO carreserve (reserve_seq , no, id, qty, dday, rday, "
					+ "usein, usewifi, usenavi, useseat)" + " VALUES(?, ?,?,?,?,?,?,?,?,?)";
			pstmt = conn.prepareStatement(sql);
		
			pstmt.setInt(1, num);
			pstmt.setInt(2, bean.getNo());
			pstmt.setString(3, bean.getId());
			pstmt.setInt(4, bean.getQty());
			pstmt.setInt(5, bean.getDday());
			pstmt.setString(6, bean.getRday());
			pstmt.setInt(7, bean.getUsein());
			pstmt.setInt(8, bean.getUsewifi());
			pstmt.setInt(9, bean.getUsenavi());
			pstmt.setInt(10, bean.getUseseat());

			pstmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (conn != null) {
				try {
					conn.close();
				} catch (SQLException e) {
				}
			}
			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException e) {
				}
			}
		}
	}

	
	public Vector<RentcarBean> getAllCar() {
		Vector<RentcarBean> v = new Vector<>();
		
		RentcarBean bean = null;

		conn = getConnection();
		try {
			String sql = "SELECT * FROM rentcar";
			pstmt = conn.prepareStatement(sql);
			
			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				
				bean = new RentcarBean();
				bean.setNo(rs.getInt(1));
				bean.setName(rs.getString(2));
				bean.setCategory(rs.getInt(3));
				bean.setPrice(rs.getInt(4));
				bean.setUsepeople(rs.getInt(5));
				bean.setCompany(rs.getString(6));
				bean.setImg(rs.getString(7));
				bean.setInfo(rs.getString(8));
				
				v.add(bean);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (conn != null) {
				try {
					conn.close();
				} catch (SQLException e) {
				}
			}
			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException e) {
				}
			}
			if (rs != null) {
				try {
					rs.close();
				} catch (SQLException e) {
				}
			}
		}
		return v;

	}

	
	public Vector<RentcarBean> getCategoryCar(int cate) {

		Vector<RentcarBean> v = new Vector<>();
		
		RentcarBean bean = null;

		conn = getConnection();
		try {
			String sql = "SELECT * FROM rentcar WHERE category=?";
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, cate);
			
			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				
				bean = new RentcarBean();
				bean.setNo(rs.getInt(1));
				bean.setName(rs.getString(2));
				bean.setCategory(rs.getInt(3));
				bean.setPrice(rs.getInt(4));
				bean.setUsepeople(rs.getInt(5));
				bean.setCompany(rs.getString(6));
				bean.setImg(rs.getString(7));
				bean.setInfo(rs.getString(8));
				
				v.add(bean);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (conn != null) {
				try {
					conn.close();
				} catch (SQLException e) {
				}
			}
			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException e) {
				}
			}
			if (rs != null) {
				try {
					rs.close();
				} catch (SQLException e) {
				}
			}
		}
		return v;
	}

	
	public Vector<CarViewBean> getAllReserve(String id) {

		Vector<CarViewBean> v = new Vector<>();
		CarViewBean bean = null;

		conn = getConnection();

		try {
			String sql = "select * from rentcar a2  ,carreserve a1  "
					+ "where a1.id = ? and curdate() < date_format(a1.rday , '%y-%m-%d')"
					+ " and a1.no = a2.no;";
			System.out.println(id);
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				bean = new CarViewBean();
				bean.setName(rs.getString(2));
				bean.setPrice(rs.getInt(4));
				bean.setImg(rs.getString(7));
				bean.setQty(rs.getInt(12));
				bean.setDday(rs.getInt(13));
				bean.setRday(rs.getString(14));
				bean.setUsein(rs.getInt(15));
				bean.setUsewifi(rs.getInt(16));
				bean.setUsenavi(rs.getInt(17));
				bean.setUseseat(rs.getInt(18));		
				v.add(bean);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (conn != null) {
				try {
					conn.close();
				} catch (SQLException e) {
				}
			}
			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException e) {
				}
			}
			if (rs != null) {
				try {
					rs.close();
				} catch (SQLException e) {
				}
			}
		}

		return v;
	}

	
	public void carRemoveReserve(String id, String rday) {

		conn = getConnection();

		try {

			String sql = "DELETE FROM carreserve WHERE id=? AND rday=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, rday);
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (conn != null) {
				try {
					conn.close();
				} catch (SQLException e) {
				}
			}
			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException e) {
				}
			}
		}
	}
}
