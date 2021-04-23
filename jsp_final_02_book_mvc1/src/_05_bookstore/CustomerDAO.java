package _05_bookstore;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class CustomerDAO {

	private CustomerDAO() {}
	private static CustomerDAO instance = new CustomerDAO();
	public static CustomerDAO getInstance() { return instance; }
	
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	// DB연동
	private Connection getConnection() throws Exception {
		String dbURL = "jdbc:mysql://localhost:3306/bookstoredb05?serverTimezone=UTC";
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
	
	// 사용자 인증처리
	public int userCheck(String id, String passwd) {
		
		int check = -1;							// 해당 아이디 없음
		String dbPasswd = "";
		
		try {
			conn = getConnection();
			
			String sql = "SELECT passwd FROM member WHERE id=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				dbPasswd = rs.getString("passwd");
				if(dbPasswd.equals(passwd)) {
					check = 1;					// 인증 성공
				}else {
					check = 0;					// 비밀번호 틀림
				}
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			if(rs != null) {try {rs.close();} catch (SQLException e) {}}
			if(pstmt != null) {try {pstmt.close();} catch (SQLException e) {}}
			if(conn != null) {try {conn.close();} catch (SQLException e) {}}
		}
		return check;
	}
	
	// 회원정보를 수정하기 위해
	// 회원정보 가져오기
	public CustomerDTO getMember(String id) {
		
		CustomerDTO dto = null;
		
		try {
			
			conn = getConnection();
			
			String sql = "SELECT * FROM member WHERE id=?";
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, id);
			
			rs = pstmt.executeQuery();
			if(rs.next()) {
				dto = new CustomerDTO();
				
				dto.setId(rs.getString("id"));
				dto.setPasswd(rs.getString("passwd"));
				dto.setName(rs.getString("name"));
				dto.setReg_date(rs.getString("reg_date"));
				dto.setTel(rs.getString("tel"));
				dto.setAddress(rs.getString("address"));
			}
			
		}catch(Exception e){
			e.printStackTrace();
		}finally {
			if(rs != null) {try {rs.close();} catch (SQLException e) {}}
			if(pstmt != null) {try {pstmt.close();} catch (SQLException e) {}}
			if(conn != null) {try {conn.close();} catch (SQLException e) {}}
		}
		return dto;
	}
	
}

















