/**
 * 
 */
package projects;
// DAO 클래스
/**
 * @author user
 *
 */

// Connection, DriverManager, PreparedStatement, ResultSet, SQLException 등 활용하기 위해 와일드카드 * 사용
import java.sql.*;
// ArrayList 활용
import java.util.*;
//import java.sql.Connection;
//import java.sql.PreparedStatement;

public class AddressBook {

	Connection conn = null;
	PreparedStatement pstmt = null;
	
	String jdbc_driver = "com.mysql.cj.jdbc.Driver";
	String jdbc_url = "jdbc:mysql://127.0.0.1:3307/addressbook?serverTimezone=UTC";
    String jdbc_user="root";
    String jdbc_passwd="mx9caj";
    
    // DB 연결
    void connect() {
    	try {
    		// 드라이버 포트
    		Class.forName(jdbc_driver);
    		// Connection 객체 생성
    		conn = DriverManager.getConnection(jdbc_url, jdbc_user, jdbc_passwd);
    	} catch(Exception e) {
    			e.printStackTrace();
    	}
    }
    
    // DB 연결 해체 --> 리소스 반환
    void disconnect() {
    	// PreparedStatement 객체가 존재하면 닫기
    	if(pstmt != null) {
    		try {
    			pstmt.close();
    		} catch(SQLException e) {
    			e.printStackTrace();
    		}
    	}
    	// Connection 객체가 존재하면 닫기 
    	if(conn != null) {
    		
    		try {
    			conn.close();
    		} catch(SQLException e) {
    			e.printStackTrace();
    		}
    	}
    }
    
    // 주소록 전체 목록 --> 제네릭스를 이용하여 ArrayList 형식으로 표현
    public ArrayList<AddressBean> getAddrList(){
    	// 데이터베이스 연결
    	this.connect();
    	// 주소록 목록을 전달하기 위한 ArrayList 선언
    	// ResultSet 은 참조형 집합이라 데이터베이스 연결이 해제되면 사용할 수 없다. 즉, jsp 로 결과를 가져가서 사용하기에는 부적합함
    	// 따라서 ArrayList 에 결과를 저장하여 가저감
    	ArrayList <AddressBean> addresses = new ArrayList<AddressBean>();
    	// 주소록 목록을 가져올 쿼리문 작성
    	String sql = "select * from addressbook";
    	try {
    		// 실행문 구성
    		pstmt = conn.prepareStatement(sql);
    		// 결과를 ResultSet 에 가져온 다음 이를  ArrayList 객체에 저장 
    		// ResultSet 은 Read only Forward only 속성을 가지고 있다. 한줄읽고 처리하고 한줄읽고 처리하고...
    		ResultSet rs = pstmt.executeQuery();
    			
    		while(rs.next()) {
    			// 순서 처리 하는 것 보다 field 이름으로 처리하는 것이 더욱 효과적
    			
    			AddressBean addr = new AddressBean();
    			addr.setId(rs.getInt("id"));
    			addr.setName(rs.getString("name"));
    			addr.setEmail(rs.getString("email"));
    			addr.setTel(rs.getString("tel"));
    			addr.setBirth(rs.getString("birth"));
    			addr.setCompany(rs.getString("company"));
    			addr.setMemo(rs.getString("memo"));
    			// ArrayList 객체에 추가
    			addresses.add(addr);
    		}
    		// ResultSet 객체의 리소스 반환
    		rs.close();
    	} catch(SQLException e) {
    		e.printStackTrace();
    	} finally {
    		// 데이터베이스 연결 해제
    		this.disconnect();
    	}
    	return addresses;
    }
    
    
    // 새로운 주소 등록
    public boolean insertAddr(AddressBean addr) {
    	// 데이터베이스 연결
    	this.connect();
    	
    	// 새로운 주소를 입력할 쿼리문 작성
    	// id는 자동증가기능(ID사양)이 지정되어 있어 입력하지 아니함
    	// 입력필드를 명확히 하기 위해 PrepareStatement 문을 사용
    	String sql = "insert into addressbook (name, email, tel, birth, company, memo) values (?,?,?,?,?,?)";
    	try {
    		// 실행문 구성
    		pstmt = conn.prepareStatement(sql);
    		// 전달되어온 값을 이용하여 pstmt문의 입력요소 설정
    		pstmt.setString(1, addr.getName());
    		pstmt.setString(2, addr.getEmail());
    		pstmt.setString(3, addr.getTel());
    		pstmt.setString(4, addr.getBirth());
    		pstmt.setString(5, addr.getCompany());
    		pstmt.setString(6, addr.getMemo());
    		// 쿼리문 실행
    		pstmt.executeUpdate();
    	} catch(SQLException e) {
    		e.printStackTrace();
    		// 새로운 주소 등록에 실패했음을 알림
    		return false;
    		
    	}finally {
    		// 데이터베이스 연결 해제
    		this.disconnect();
    	}
    	// 새로운 주소 등록에 성공했음을 알림
    	return true;
    }
    
    
    // id 값을 입력으로 받아 주소록 레포트 하나를 반환
    public AddressBean getAddr(int id) {
    	// 데이터베이스 연결
    	this.connect();
    	
    	//결과를 반환할 Address 클래스의 객체 생성
    	AddressBean addr = new AddressBean();
    	
    	// id를 입력으로 받아 자료를 조회하는 쿼리뭔 작성
    	String sql = "select * from addressbook where id=?";
    	
    	try {
    		// 실행문 구성
    		pstmt = conn.prepareStatement(sql);
    		// 인수로 전달된 값을 pstmt의 인수로 전달
    		pstmt.setInt(1, id);
    		// 쿼리문을 실행하여 결과를 ResultSet으로 받음
    		ResultSet rs = pstmt.executeQuery();
    		
    		// id 값을 가지고 넘어올때 존재하는 id값들 중에 "한개"를 가져올 것이라서  id값이 없는경우는 없다. 반드시 존재한다
    		// 읽은 자료를 Address 클래스의 객체에 전달함. 현재는 레코드가 오로지 하나밖에 없으므로, rs.next()는 한번만 실행하면 됨
    		rs.next();
    		addr.setId(rs.getInt("id"));
    		addr.setName(rs.getString("name"));
    		addr.setEmail(rs.getString("email"));
    		addr.setTel(rs.getString("tel"));
    		addr.setBirth(rs.getString("birth"));
    		addr.setCompany(rs.getString("company"));
    		addr.setMemo(rs.getString("memo"));
    		rs.close();
    	} catch (SQLException e) {
    		e.printStackTrace();
    		// 새로운 주소 등록에 실패했음을 알림
    	} finally {
    		// 데이터베이스 연결 해제
    		this.disconnect();
    	}
    	// 데이터버세이스로부터 읽은 정보를 반환
    	return addr;
    }
    
    
    // 주소 수정
    public boolean modifyAddr(AddressBean addr) {
    	// 데이터베이스 연결
    	this.connect();
    	// 주소를 수정하는 쿼리문 작성
    	String sql = "update addressbook set name=?, email=?, tel=?, birth=?, company=?, memo=? where id=?";
    	
    	try {
    		// 실행문 구성
    		pstmt = conn.prepareStatement(sql);
    		// 전달되어온 값을 이용하여 pstmt문의 입력요소 설정
    		pstmt.setString(1, addr.getName());
    		pstmt.setString(2, addr.getEmail());
    		pstmt.setString(3, addr.getTel());
    		pstmt.setString(4, addr.getBirth());
    		pstmt.setString(5, addr.getCompany());
    		pstmt.setString(6, addr.getMemo());
    		pstmt.setInt(7, addr.getId());
    		// 쿼리문 실행
    		pstmt.executeUpdate();
    	} catch (SQLException e) {
    		e.printStackTrace();
    		// 주소 수정에 실패했음을 알림
    		return false;
    	} finally {
    		// 데이터베이스 연결 해제
    		this.disconnect();
    	}
    	// 주소 수정에 성공했음을 알림
    	return true;
    }
    
    
    // 주소 삭제
    public boolean deleteAddr(int id) {
    	// 데이터베이스 연결
    	this.connect();
    	// 주소를 삭제하는 쿼리문 작성
    	String sql = "delete from addressbook where id=?";
    	try {
    		// 실행문 구성
    		pstmt = conn.prepareStatement(sql);
    		// 전달되어온 값을 이용하여 pstmt문의 입력요소 설정
    		pstmt.setInt(1, id);
    		// 쿼리문 실행
    		pstmt.executeUpdate();
    		// 쿼리문 실행
    	} catch (SQLException e) {
    		e.printStackTrace();
    	} finally {
    		// 데이터베이스 연결 해제
    		this.disconnect();
    	}
    	// 주소 삭제에 성공했음을 알림
    	return true;
    }
}
