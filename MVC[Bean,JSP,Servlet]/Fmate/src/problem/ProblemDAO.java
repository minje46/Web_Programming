package problem;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class ProblemDAO {
	private Connection conn; 		// DB에 접근하기 위한 객체
	//private PreparedStatement pstmt;
	private ResultSet rs; 			// 정보를 담을 수 있는 변수를 만들어 준다.

	// mysql 처리부분
	public ProblemDAO() {
		//생성자를 만들어준다.
		try {
			String dbURL = "jdbc:mysql://localhost:3306/BBS";
			String dbID = "root";
			String dbPassword = "myslfm24";
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection(dbURL, dbID, dbPassword);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}	
	
	// 현재의 시간을 가져오는 함수
	public String getDate() { 
		String SQL = "SELECT NOW()";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				return rs.getString(1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return ""; //DB error.
	}
	
	//prID load함수
	public int getNext() { 
		String SQL = "SELECT prID FROM problem ORDER BY prID DESC";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				return rs.getInt(1) + 1;
			}
			return 1;//첫 번째 게시물인 경우
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1; //DB error.
	}
	
	//실제로 글을 작성하는 함수.
	public int write(String prTitle, String prAuth, String userID, String prContent) { 
		String SQL = "INSERT INTO problem VALUES(?, ?, ?, ?, ?, ?, ?)";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, getNext());
			pstmt.setString(2, prAuth);
			pstmt.setString(3, prTitle);
			pstmt.setString(4, userID);
			pstmt.setString(5, getDate());
			pstmt.setString(6, prContent);
			pstmt.setInt(7,1);
			return pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1; //DB error.
	}		
	
	// 게시판 목록 구현하기
	public ArrayList<Problem> getList(int pageNumber){
		String SQL = "SELECT * FROM problem WHERE prID < ? AND prAvailable = 1 ORDER BY prID DESC LIMIT 10";
		ArrayList<Problem> list = new ArrayList<Problem>();
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1,  getNext() - (pageNumber - 1) * 10);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				Problem prob = new Problem();
				prob.setPrID(rs.getInt(1));
				prob.setPrAuth(rs.getString(2));				
				prob.setPrTitle(rs.getString(3));
				prob.setUserID(rs.getString(4));
				prob.setPrDate(rs.getString(5));
				prob.setPrContent(rs.getString(6));
				prob.setPrAvailable(rs.getInt(7));
				list.add(prob);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}	
	
	
	// 게시물이 10,20단위로 할 때, 게시물이 10개라면 다음 페이지가 없어야 하므로..
	public boolean nextPage(int pageNumber) {
		String SQL = "SELECT * FROM problem WHERE prID < ? AND prAvailable = 1 ORDER BY prID DESC LIMIT 10";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1,  getNext() - (pageNumber - 1) * 10);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				return true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return false;
	}
	
	
	public Problem getProblem(int prID) {
		String SQL = "SELECT * FROM problem WHERE prID = ?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, prID);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				Problem prob = new Problem();
				prob.setPrID(rs.getInt(1));
				prob.setPrAuth(rs.getString(2));				
				prob.setPrTitle(rs.getString(3));
				prob.setUserID(rs.getString(4));
				prob.setPrDate(rs.getString(5));
				prob.setPrContent(rs.getString(6));
				prob.setPrAvailable(rs.getInt(7));
				return prob;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}	
	
	// Update 함수
	public int update(int prID, String prTitle, String prContent){
		String SQL = "UPDATE problem SET prTitle = ?, prContent = ? WHERE prID = ?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, prTitle);
			pstmt.setString(2, prContent);
			pstmt.setInt(3, prID);
			return pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1; //DB error.
	}
	
	//글 delete 함수
	public int delete(int prID) {
		String SQL = "UPDATE problem SET prAvailable = 0 WHERE prID = ?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, prID);
			return pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1; //DB error.
	}	
	
}
