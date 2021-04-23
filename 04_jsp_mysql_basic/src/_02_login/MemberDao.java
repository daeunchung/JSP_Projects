package _02_login;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class MemberDao {
	private static MemberDao instance = new MemberDao();
	private MemberDao () {}
	public static MemberDao getInstance() {
		return instance;
	}
	
	private Connection conn;   //데이터베이스에 접근하기 위한 객체
    private PreparedStatement pstmt;  
    private ResultSet rs;   //정보를 담을 수 있는 변수를 생성
	public Connection getConnection() {
		String dbURL="jdbc:mysql://localhost:3306/joindb01?serverTimezone=UTC";                             
        String dbID="root";
        String dbPassword="root";
        try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			conn=DriverManager.getConnection(dbURL,dbID,dbPassword);
		} catch (Exception e) {			
			e.printStackTrace();
		}	
	    return conn;
	}	
	public int insertMember(Member user) {
       
        try {
        	//String dbURL="jdbc:mysql://localhost:3306/logindb02?serverTimezone=UTC";                             
            // String dbID="root";
            // String dbPassword="root";
            // Class.forName("com.mysql.cj.jdbc.Driver");
			//conn=DriverManager.getConnection(dbURL,dbID,dbPassword);
			
        	conn = getConnection();
        	String SQL= "INSERT INTO MEMBER VALUES(?, ?, ?, now()) ";
            pstmt = conn.prepareStatement(SQL);
            pstmt.setString(1,user.getId());
            pstmt.setString(2,user.getPasswd());
            pstmt.setString(3,user.getName());            
            return pstmt.executeUpdate();
        }
        catch(Exception e) {
            e.printStackTrace();
        }finally{
			if (pstmt != null) 
				try { pstmt.close(); } catch(Exception ex) {}
			if (conn != null) 
				try { conn.close(); } catch(Exception ex) {}
		}
        return -1;
    }
	public int userCheck(String id, String passwd)  {
		
		String dbpasswd = "";
		int x = -1;	
		try{
			conn = getConnection();			            
			pstmt = conn.prepareStatement(
			    "select passwd from MEMBER where id = ?");
			pstmt.setString(1, id);
			rs= pstmt.executeQuery();
			if(rs.next()){
				dbpasswd= rs.getString("passwd"); 
				if(dbpasswd.equals(passwd))
					x = 1; //인증 성공
				else
					x = 0; //비밀번호 틀림
			}else
				x = -1;//해당 아이디 없음
						
		}catch(Exception ex) {
			ex.printStackTrace();
		}finally{
			if (rs != null) 
				try { rs.close(); } catch(SQLException ex) {}
			if (pstmt != null) 
				try { pstmt.close(); } catch(SQLException ex) {}
			if (conn != null) 
				try { conn.close(); } catch(SQLException ex) {}
		}
		return x;
}
}
