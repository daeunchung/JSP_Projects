/**
 * 
 */
package projects;
// DAO Ŭ����
/**
 * @author user
 *
 */

// Connection, DriverManager, PreparedStatement, ResultSet, SQLException �� Ȱ���ϱ� ���� ���ϵ�ī�� * ���
import java.sql.*;
// ArrayList Ȱ��
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
    
    // DB ����
    void connect() {
    	try {
    		// ����̹� ��Ʈ
    		Class.forName(jdbc_driver);
    		// Connection ��ü ����
    		conn = DriverManager.getConnection(jdbc_url, jdbc_user, jdbc_passwd);
    	} catch(Exception e) {
    			e.printStackTrace();
    	}
    }
    
    // DB ���� ��ü --> ���ҽ� ��ȯ
    void disconnect() {
    	// PreparedStatement ��ü�� �����ϸ� �ݱ�
    	if(pstmt != null) {
    		try {
    			pstmt.close();
    		} catch(SQLException e) {
    			e.printStackTrace();
    		}
    	}
    	// Connection ��ü�� �����ϸ� �ݱ� 
    	if(conn != null) {
    		
    		try {
    			conn.close();
    		} catch(SQLException e) {
    			e.printStackTrace();
    		}
    	}
    }
    
    // �ּҷ� ��ü ��� --> ���׸����� �̿��Ͽ� ArrayList �������� ǥ��
    public ArrayList<AddressBean> getAddrList(){
    	// �����ͺ��̽� ����
    	this.connect();
    	// �ּҷ� ����� �����ϱ� ���� ArrayList ����
    	// ResultSet �� ������ �����̶� �����ͺ��̽� ������ �����Ǹ� ����� �� ����. ��, jsp �� ����� �������� ����ϱ⿡�� ��������
    	// ���� ArrayList �� ����� �����Ͽ� ������
    	ArrayList <AddressBean> addresses = new ArrayList<AddressBean>();
    	// �ּҷ� ����� ������ ������ �ۼ�
    	String sql = "select * from addressbook";
    	try {
    		// ���๮ ����
    		pstmt = conn.prepareStatement(sql);
    		// ����� ResultSet �� ������ ���� �̸�  ArrayList ��ü�� ���� 
    		// ResultSet �� Read only Forward only �Ӽ��� ������ �ִ�. �����а� ó���ϰ� �����а� ó���ϰ�...
    		ResultSet rs = pstmt.executeQuery();
    			
    		while(rs.next()) {
    			// ���� ó�� �ϴ� �� ���� field �̸����� ó���ϴ� ���� ���� ȿ����
    			
    			AddressBean addr = new AddressBean();
    			addr.setId(rs.getInt("id"));
    			addr.setName(rs.getString("name"));
    			addr.setEmail(rs.getString("email"));
    			addr.setTel(rs.getString("tel"));
    			addr.setBirth(rs.getString("birth"));
    			addr.setCompany(rs.getString("company"));
    			addr.setMemo(rs.getString("memo"));
    			// ArrayList ��ü�� �߰�
    			addresses.add(addr);
    		}
    		// ResultSet ��ü�� ���ҽ� ��ȯ
    		rs.close();
    	} catch(SQLException e) {
    		e.printStackTrace();
    	} finally {
    		// �����ͺ��̽� ���� ����
    		this.disconnect();
    	}
    	return addresses;
    }
    
    
    // ���ο� �ּ� ���
    public boolean insertAddr(AddressBean addr) {
    	// �����ͺ��̽� ����
    	this.connect();
    	
    	// ���ο� �ּҸ� �Է��� ������ �ۼ�
    	// id�� �ڵ��������(ID���)�� �����Ǿ� �־� �Է����� �ƴ���
    	// �Է��ʵ带 ��Ȯ�� �ϱ� ���� PrepareStatement ���� ���
    	String sql = "insert into addressbook (name, email, tel, birth, company, memo) values (?,?,?,?,?,?)";
    	try {
    		// ���๮ ����
    		pstmt = conn.prepareStatement(sql);
    		// ���޵Ǿ�� ���� �̿��Ͽ� pstmt���� �Է¿�� ����
    		pstmt.setString(1, addr.getName());
    		pstmt.setString(2, addr.getEmail());
    		pstmt.setString(3, addr.getTel());
    		pstmt.setString(4, addr.getBirth());
    		pstmt.setString(5, addr.getCompany());
    		pstmt.setString(6, addr.getMemo());
    		// ������ ����
    		pstmt.executeUpdate();
    	} catch(SQLException e) {
    		e.printStackTrace();
    		// ���ο� �ּ� ��Ͽ� ���������� �˸�
    		return false;
    		
    	}finally {
    		// �����ͺ��̽� ���� ����
    		this.disconnect();
    	}
    	// ���ο� �ּ� ��Ͽ� ���������� �˸�
    	return true;
    }
    
    
    // id ���� �Է����� �޾� �ּҷ� ����Ʈ �ϳ��� ��ȯ
    public AddressBean getAddr(int id) {
    	// �����ͺ��̽� ����
    	this.connect();
    	
    	//����� ��ȯ�� Address Ŭ������ ��ü ����
    	AddressBean addr = new AddressBean();
    	
    	// id�� �Է����� �޾� �ڷḦ ��ȸ�ϴ� ������ �ۼ�
    	String sql = "select * from addressbook where id=?";
    	
    	try {
    		// ���๮ ����
    		pstmt = conn.prepareStatement(sql);
    		// �μ��� ���޵� ���� pstmt�� �μ��� ����
    		pstmt.setInt(1, id);
    		// �������� �����Ͽ� ����� ResultSet���� ����
    		ResultSet rs = pstmt.executeQuery();
    		
    		// id ���� ������ �Ѿ�ö� �����ϴ� id���� �߿� "�Ѱ�"�� ������ ���̶�  id���� ���°��� ����. �ݵ�� �����Ѵ�
    		// ���� �ڷḦ Address Ŭ������ ��ü�� ������. ����� ���ڵ尡 ������ �ϳ��ۿ� �����Ƿ�, rs.next()�� �ѹ��� �����ϸ� ��
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
    		// ���ο� �ּ� ��Ͽ� ���������� �˸�
    	} finally {
    		// �����ͺ��̽� ���� ����
    		this.disconnect();
    	}
    	// �����͹����̽��κ��� ���� ������ ��ȯ
    	return addr;
    }
    
    
    // �ּ� ����
    public boolean modifyAddr(AddressBean addr) {
    	// �����ͺ��̽� ����
    	this.connect();
    	// �ּҸ� �����ϴ� ������ �ۼ�
    	String sql = "update addressbook set name=?, email=?, tel=?, birth=?, company=?, memo=? where id=?";
    	
    	try {
    		// ���๮ ����
    		pstmt = conn.prepareStatement(sql);
    		// ���޵Ǿ�� ���� �̿��Ͽ� pstmt���� �Է¿�� ����
    		pstmt.setString(1, addr.getName());
    		pstmt.setString(2, addr.getEmail());
    		pstmt.setString(3, addr.getTel());
    		pstmt.setString(4, addr.getBirth());
    		pstmt.setString(5, addr.getCompany());
    		pstmt.setString(6, addr.getMemo());
    		pstmt.setInt(7, addr.getId());
    		// ������ ����
    		pstmt.executeUpdate();
    	} catch (SQLException e) {
    		e.printStackTrace();
    		// �ּ� ������ ���������� �˸�
    		return false;
    	} finally {
    		// �����ͺ��̽� ���� ����
    		this.disconnect();
    	}
    	// �ּ� ������ ���������� �˸�
    	return true;
    }
    
    
    // �ּ� ����
    public boolean deleteAddr(int id) {
    	// �����ͺ��̽� ����
    	this.connect();
    	// �ּҸ� �����ϴ� ������ �ۼ�
    	String sql = "delete from addressbook where id=?";
    	try {
    		// ���๮ ����
    		pstmt = conn.prepareStatement(sql);
    		// ���޵Ǿ�� ���� �̿��Ͽ� pstmt���� �Է¿�� ����
    		pstmt.setInt(1, id);
    		// ������ ����
    		pstmt.executeUpdate();
    		// ������ ����
    	} catch (SQLException e) {
    		e.printStackTrace();
    	} finally {
    		// �����ͺ��̽� ���� ����
    		this.disconnect();
    	}
    	// �ּ� ������ ���������� �˸�
    	return true;
    }
}
