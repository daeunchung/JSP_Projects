package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Vector;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class BoardDAO {

	private static BoardDAO dao = new BoardDAO();
	public static BoardDAO getInstance() {
		return dao;
	}

	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;

	// 데이터 베이스의 커넥션풀을 사용하도록 설정하는 메서드
	public Connection getConnection() {
		try {
			Context initctx = new InitialContext();
			Context envctx = (Context) initctx.lookup("java:comp/env");
			// server.xml에서 작성한 내용과 동일해야 한다.
			DataSource ds = (DataSource) envctx.lookup("jdbc/pool");
			conn = ds.getConnection();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return conn;
	}

	public void insertBoard(BoardBean board) {

		int ref = 0;
		int num = 0;
		try {
			conn = getConnection();
			String refSql = "SELECT MAX(ref) FROM board";
			pstmt = conn.prepareStatement(refSql);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				ref = rs.getInt(1) + 1;
			}
			String numSql = "SELECT MAX(num) FROM board";
			pstmt = conn.prepareStatement(numSql);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				num = rs.getInt(1) + 1;
			}

			String sql = "INSERT INTO board (num , writer, email, subject, "
					+ "password, reg_date, ref, re_step, re_level, "
					+ "readcount, content) VALUES(?, ?, ?, ?, ?, now(),?, 1, 1, 0, ?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, num);
			pstmt.setString(2, board.getWriter());
			pstmt.setString(3, board.getEmail());
			pstmt.setString(4, board.getSubject());
			pstmt.setString(5, board.getPassword());
			pstmt.setInt(6, ref);
			pstmt.setString(7, board.getContent());
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

	public int getAllCount() {
		int count = 0;
		try {
			conn = getConnection();
			String sql = "SELECT COUNT(*) FROM board";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				count = rs.getInt(1); // 전체 게시글의 수
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
		}
		return count;
	}

	public Vector<BoardBean> getAllBoard(int start, int count) {
		
		// 리턴할 객체 선언
		Vector<BoardBean> vec = new Vector<BoardBean>();
		
		try {
			conn = getConnection();
			// 쿼리 준비
			String sql = "SELECT * FROM board ORDER BY ref DESC , re_level LIMIT ?, ?;";

			// 쿼리를 실행할 객체 선언
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, start);
			pstmt.setInt(2, count);
			// 쿼리 실행 후 결과 저장
			rs = pstmt.executeQuery();
			// 데이터 개수가 몇 개인지 모르기에 반복문을 이용하여 데이터를 추출
			while (rs.next()) {

				BoardBean bean = new BoardBean();
				bean.setNum(rs.getInt(1));
				bean.setWriter(rs.getString(2));
				bean.setEmail(rs.getString(3));
				bean.setSubject(rs.getString(4));
				bean.setPassword(rs.getString(5));
				bean.setReg_date(rs.getDate(6).toString());
				bean.setRef(rs.getInt(7));
				bean.setRe_step(rs.getInt(8));
				bean.setRe_level(rs.getInt(9));
				bean.setReadcount(rs.getInt(10));
				bean.setContent(rs.getString(11));
				// 패키징한 데이터를 벡터에 저장
				vec.add(bean);
				
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
		return vec;
	}

	public BoardBean getOneBoard(int num) {

		// 리턴타입 선언
		BoardBean bean = new BoardBean();

		try {
			conn = getConnection();

			// 조회수 증가쿼리
			String readsql = "UPDATE board SET readcount=readcount+1 WHERE NUM=?";
			pstmt = conn.prepareStatement(readsql);
			pstmt.setInt(1, num);
			pstmt.executeUpdate();

			// 쿼리준비
			String sql = "SELECT * FROM board WHERE NUM=?";
			// 쿼리 실행 객체
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, num);
			// 쿼리 실행 후 결과를 리턴
			rs = pstmt.executeQuery();
			if (rs.next()) {
				bean.setNum(rs.getInt(1));
				bean.setWriter(rs.getString(2));
				bean.setEmail(rs.getString(3));
				bean.setSubject(rs.getString(4));
				bean.setPassword(rs.getString(5));
				bean.setReg_date(rs.getDate(6).toString());
				bean.setRef(rs.getInt(7));
				bean.setRe_step(rs.getInt(8));
				bean.setRe_level(rs.getInt(9));
				bean.setReadcount(rs.getInt(10));
				bean.setContent(rs.getString(11));
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

	public BoardBean getOneUpdateBoard(int num) {

		// 리턴타입 선언
		BoardBean bean = new BoardBean();

		try {
			conn = getConnection();

			// 쿼리준비
			String sql = "SELECT * FROM board WHERE NUM=?";
			// 쿼리 실행 객체
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, num);
			// 쿼리 실행 후 결과를 리턴
			rs = pstmt.executeQuery();
			if (rs.next()) {
				bean.setNum(rs.getInt(1));
				bean.setWriter(rs.getString(2));
				bean.setEmail(rs.getString(3));
				bean.setSubject(rs.getString(4));
				bean.setPassword(rs.getString(5));
				bean.setReg_date(rs.getDate(6).toString());
				bean.setRef(rs.getInt(7));
				bean.setRe_step(rs.getInt(8));
				bean.setRe_level(rs.getInt(9));
				bean.setReadcount(rs.getInt(10));
				bean.setContent(rs.getString(11));
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
	public String getPass(int num) {
		
		// 리턴할 변수 객체 선언
		String pass = "";
		
		
		try {
			conn = getConnection();
			
			// 쿼리 작성
			String sql = "SELECT password FROM board WHERE num=?";
			// 쿼리 실행할 객체 선언
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, num);
			// 쿼리 실행
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				pass = rs.getString(1);
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			// 자원 반납
			if(pstmt != null) { try { pstmt.close(); } catch (SQLException e) {}}
			if(rs != null) { try { rs.close(); } catch (SQLException e) {}}
			if(conn != null) { try { conn.close(); } catch (SQLException e) {}}
		}
		
		return pass;
	}
// 하나의 게시글을 수정하는 메서드
	public void updateBoard(BoardBean bean) {
		
		System.out.println(bean.getSubject());
		System.out.println(bean.getContent());
		System.out.println(bean.getNum());
		
		try {
			conn = getConnection();

			String sql = "UPDATE board SET subject=?, content=? WHERE num=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, bean.getSubject());
			pstmt.setString(2, bean.getContent());
			pstmt.setInt(3, bean.getNum());

			pstmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			// 자원 반납
			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException e) {
				}
			}
			if (conn != null) {
				try {
					conn.close();
				} catch (SQLException e) {
				}
			}
		}
	}
	// 하나의 게시글을 삭제하는 메서드
	public void deleteBoard(int num) {
		
		try {
			conn = getConnection();
			
			String sql = "DELETE FROM board WHERE num=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, num);
			
			pstmt.executeUpdate();
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			// 자원 반납
			if(pstmt != null) { try { pstmt.close(); } catch (SQLException e) {}}
			if(conn != null) { try { conn.close(); } catch (SQLException e) {}}
		}
	}
	public void reWriteBoard(BoardBean bean) {
		
		int ref = bean.getRef();
		int re_step = bean.getRe_step();
		int re_level = bean.getRe_level();
		
		int num = 0;
		
		try {
			conn = getConnection();	
			
			String numSql = "SELECT MAX(num) FROM board";
			pstmt = conn.prepareStatement(numSql);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				num = rs.getInt(1) + 1;
			}

					
			////// 핵심 코드 //////		
			String levelsql = "UPDATE board SET re_level=re_level+1 WHERE ref=? and re_level > ?";
			// 쿼리실행객체 선언
			pstmt = conn.prepareStatement(levelsql);
			pstmt.setInt(1, ref);
			pstmt.setInt(2, re_level);
			// 쿼리 실행
			pstmt.executeUpdate();		
			// 답변글 데이터를 저장
			String sql = "INSERT INTO board (num , writer, email, subject, password, "
					+ "reg_date, ref, re_step, re_level, readcount, content) "
					+ "VALUES (?,?,?,?,?,now(),?,?,?,0,?)";
			pstmt = conn.prepareStatement(sql);
			// ? 에 값을 대입
			pstmt.setInt(1, num);
			pstmt.setString(2, bean.getWriter());
			pstmt.setString(3, bean.getEmail());
			pstmt.setString(4, bean.getSubject());
			pstmt.setString(5, bean.getPassword());
			pstmt.setInt(6, ref);				// 부모의 ref 값을 넣어줌
			pstmt.setInt(7, re_step + 1);		// 답글이기에  re_step에 1을 더해줌
			pstmt.setInt(8, re_level + 1);
			pstmt.setString(9, bean.getContent());			
			pstmt.executeUpdate();			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			if(pstmt != null) { try { pstmt.close(); } catch (SQLException e) {}}
			if(rs != null) { try { rs.close(); } catch (SQLException e) {}}
			if(conn != null) { try { conn.close(); } catch (SQLException e) {}}
		}
	}
	
}
