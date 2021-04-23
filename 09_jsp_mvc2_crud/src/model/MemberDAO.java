package model;
 
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
 
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;
 
public class MemberDAO {
 
    // 싱글톤 패턴
    private MemberDAO() {}
    private static MemberDAO instance = new MemberDAO();
    public static MemberDAO getInstance() {
        return instance;
    }
    
    // MySQL DB 연동
    // 1) JDBC
    // 2) Connection Pool(*)
    Connection conn = null;
    PreparedStatement pstmt = null;
    ResultSet rs = null;
    
    public Connection getConn() throws Exception {
        
        Context initCtx = new InitialContext();
        // lookup 메서드를 통해
        // server.xml 파일에 접근하여 자바환경 코드를 검색
        Context envCtx = (Context)initCtx.lookup("java:comp/env");
        // <Context>태그안의 <Resource> 환경설정의
        // name이 jdbc/pool인 것을 검색
        DataSource ds = (DataSource)envCtx.lookup("jdbc/pool");
        conn = ds.getConnection();
        
        return conn;
    }
    
    // 아이디 중복체크
    public int checkId(String id) {
        // check = 1 (중복X)
        // check = -1(중복O)
        int check = 1;
        try {
            // 1.DB 연동
            conn = getConn();
            
            // 2.쿼리문 작성
            String sql = "SELECT * FROM member ";
            sql += "WHERE id=?";
            // 3.쿼리 객체 생성
            pstmt = conn.prepareStatement(sql);
            // 4.? 맵핑
            pstmt.setString(1, id);
            // 5.쿼리 실행
            // 1) executeUpdate()  : SELECT를 제외한 나머지
            // 2) executeQuery()   : SELECT
            rs = pstmt.executeQuery();
            // rs.next()메서드의 리턴값이 true이면
            // 아이디가 중복된다는 의미
            if(rs.next()) {
                check = -1;
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if(conn != null) {try {conn.close();} catch (SQLException e) {}}
            if(pstmt != null) {try {pstmt.close();} catch (SQLException e) {}}
            if(rs != null) {try {rs.close();} catch (SQLException e) {}}
        }
        return check;
    }
    
    
    // 회원가입
    public int joinMember(MemberBean bean) {
        int check = 1;
        try {
            
            //--------------------------------
            // id중복체크
            // check = 1(가입 허용)
            // check =-1(가입 불가)
            check = checkId(bean.getId());
 
            //--------------------------------
            // 1.DB연동
            conn = getConn();
            
            if(check == 1) {
                // 2.쿼리문 작성
                String sql = "INSERT INTO member";
                sql += "(id,pw,name,tel,email) ";
                sql += "VALUES(?,?,?,?,?)";
                // 3.쿼리를 실행하기 위한 객체 생성
                pstmt = conn.prepareStatement(sql);
                // ? 값을 맵핑
                pstmt.setString(1, bean.getId());
                pstmt.setString(2, bean.getPw());
                pstmt.setString(3, bean.getName());
                pstmt.setString(4, bean.getTel());
                pstmt.setString(5, bean.getEmail());
                // 4.쿼리 실행
                pstmt.executeUpdate();
            }
        }catch(Exception e) {
            e.printStackTrace();
        }finally {
            if(conn != null) {try {conn.close();} catch (SQLException e) {}}
            if(pstmt != null) {try {pstmt.close();} catch (SQLException e) {}}
        }
        return check;
    }
    
    // 로그인
    public int loginCheck(String id, String pw) {
        int check = -1;
        try {
            // 1.DB 연동
            conn = getConn();
            // 2.쿼리문 작성
            String sql = "SELECT pw FROM member ";
            sql += "WHERE id=?";
            // 3.쿼리문 실행을 위한 객체(pstmt) 생성
            pstmt = conn.prepareStatement(sql);
            // 4.?에 값 맵핑
            pstmt.setString(1, id);
            // 5.쿼리문 실행
            rs = pstmt.executeQuery();
            if(rs.next()) {
                String dbPw = rs.getString("pw");
                if(dbPw.equals(pw)) {
                    // 로그인 성공
                    check = 1;
                }
            }
            
        }catch(Exception e) {
            e.printStackTrace();
        }finally {
            if(conn != null) {try {conn.close();} catch (SQLException e) {}}
            if(pstmt != null) {try {pstmt.close();} catch (SQLException e) {}}
            if(rs != null) {try {rs.close();} catch (SQLException e) {}}
        }
        return check;
    }
    
    // 회원 한명의 정보 꺼내오기
    public MemberBean getOneMember(String id) {
        MemberBean bean = null;
        try {
            // 1.DB연동
            conn = getConn();
            // 2.쿼리문 작성
            String sql = "SELECT * FROM member ";
            sql += "WHERE id=?";
            // 3.쿼리문 실행을 위한 객체(pstmt)생성
            pstmt = conn.prepareStatement(sql);
            // 4.? 맵핑
            pstmt.setString(1, id);
            // 5.쿼리 실행
            rs = pstmt.executeQuery();
            if(rs.next()) {
                // String id = rs.getString("id");
                String pw = rs.getString("pw");
                String name = rs.getString("name");
                String tel = rs.getString("tel");
                String email = rs.getString("email");
                String field = rs.getString("field");
                String skill = rs.getString("skill");
                String major = rs.getString("major");
 
                bean = new MemberBean(id, pw, name, tel, email, field, skill, major);
            }
        }catch(Exception e) {
            e.printStackTrace();
        }finally {
            if(conn != null) {try {conn.close();} catch (SQLException e) {}}
            if(pstmt != null) {try {pstmt.close();} catch (SQLException e) {}}
            if(rs != null) {try {rs.close();} catch (SQLException e) {}}            
        }
        return bean;
    }
    
    // 회원정보 수정
    public void updateMember(String id, MemberBean bean) {
        try {
            // 1.DB연동
            conn = getConn();
            // 2.쿼리문 작성
            String sql = "UPDATE member SET ";
            sql += "pw=?, name=?, tel=?, ";
            sql += "email=?, field=?, skill=?, major=? ";
            sql += "WHERE id=?";
            // 3.쿼리문 실행을 위한 객체(pstmt) 생성
            pstmt = conn.prepareStatement(sql);
            // 4.?맵핑
            pstmt.setString(1, bean.getPw());
            pstmt.setString(2, bean.getName());
            pstmt.setString(3, bean.getTel());
            pstmt.setString(4, bean.getEmail());
            pstmt.setString(5, bean.getField());
            pstmt.setString(6, bean.getSkill());
            pstmt.setString(7, bean.getMajor());
            pstmt.setString(8, id);
            // 5.쿼리 실행
            pstmt.executeUpdate();
            // 6.결과값에 대한 처리(select만 진행)
        }catch(Exception e) {
            e.printStackTrace();
        }finally {
            if(conn != null) {try {conn.close();} catch (SQLException e) {}}
            if(pstmt != null) {try {pstmt.close();} catch (SQLException e) {}}
        }
    }
    
    // 입사지원하기
    public void apply(String id, String field, String skill, String major) {
 
        try {
            
            conn = getConn();
            
            String sql = "UPDATE member SET field=?, ";
            sql += "skill=?, major=? ";
            sql += "WHERE id=?";
            
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, field);
            pstmt.setString(2, skill);
            pstmt.setString(3, major);
            pstmt.setString(4, id);
            
            pstmt.executeUpdate();
            
        }catch(Exception e) {
            e.printStackTrace();
        }finally {
            if(conn != null) {try {conn.close();} catch (SQLException e) {}}
            if(pstmt != null) {try {pstmt.close();} catch (SQLException e) {}}
        }
        
    }
    
    // 탈퇴하기
    public void delete(String id) {
    	
    	try {
    		conn = getConn();
    		
    		String sql = "DELETE FROM member WHERE id=?";
    		pstmt = conn.prepareStatement(sql);
    		pstmt.setString(1, id);
    		pstmt.executeUpdate();
    		
    	}catch(Exception e) {
    		e.printStackTrace();
    	}finally {
    		if(conn != null) {try {conn.close();} catch (SQLException e) {}}
    		if(pstmt != null) {try {pstmt.close();} catch (SQLException e) {}}
    	}
    }
}
