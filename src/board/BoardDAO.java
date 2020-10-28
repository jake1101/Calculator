package board;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class BoardDAO {

	
	private Connection conn;
	private ResultSet rSet;
	
	public BoardDAO() {
		try {
			String dbURL = "jdbc:mysql://localhost:3306/noticeboarddb? serverTimezone=Asia/Seoul&useSSL=false";
			String dbID = "root";
			String dbPW = "root";
			Class.forName("com.mysql.cj.jdbc.Driver");
			conn = DriverManager.getConnection(dbURL, dbID, dbPW);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public String getDate() {
		String SQL = "SELECT NOW()";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			rSet = pstmt.executeQuery();
			if (rSet.next()) {
				return rSet.getString(1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "";
	}
	
	public int getNext() {
		String SQL = "SELECT boardID FROM BOARDTABLE ORDER BY boardID DESC";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			rSet = pstmt.executeQuery();
			if(rSet.next()) {
				return rSet.getInt(1) + 1;
			}
			return 1; // 첫번째 게시물인 경우
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1; //데이터베이스 오류
	}
	
	public int write(String boardTitle, String userID, String boardContent) {
		String SQL = "INSERT INTO BOARDTABLE VALUES (?,?,?,?,?,?)";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, getNext());
			pstmt.setString(2, boardTitle);
			pstmt.setString(3, userID);
			pstmt.setString(4, getDate());
			pstmt.setString(5, boardContent);
			pstmt.setInt(6, 1);
			
			return pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1; //데이터베이스 오류
	}
	
	public ArrayList<BoardDTO> getList(int pageNumber) {
		String SQL = "SELECT * FROM BOARDTABLE "
					+ "WHERE BOARDID < ? AND BOARDAVAILABLE = 1 "
					+ "ORDER BY BOARDID DESC LIMIT 5";
		ArrayList<BoardDTO> list = new ArrayList<>();
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, getNext() - (pageNumber - 1) * 10);
			rSet = pstmt.executeQuery();
			while (rSet.next()) {
				BoardDTO boardDTO = new BoardDTO();
				
				boardDTO.setBoardID(rSet.getInt(1));
				boardDTO.setBoardTitle(rSet.getString(2));
				boardDTO.setUserID(rSet.getString(3));
				boardDTO.setBoardDate(rSet.getString(4));
				boardDTO.setBoardContent(rSet.getString(5));
				boardDTO.setBoardAvailable(rSet.getInt(6));
				list.add(boardDTO);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
	public boolean nextPage(int pageNumber) {
		String SQL = "SELECT * FROM BOARDTABLE WHERE BOARDID < ? AND BOARDAVAILABLE = 1";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, getNext() - (pageNumber -1) * 10);
			rSet = pstmt.executeQuery();
			if (rSet.next()) {
				return true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return false;
	}
	
	public BoardDTO getBoard(int boardID) {
		String SQL = "SELECT * FROM BOARDTABLE WHERE BOARDID = ?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, boardID);
			rSet = pstmt.executeQuery();
			if(rSet.next()) {
				BoardDTO boardDTO = new BoardDTO();
				
				boardDTO.setBoardID(rSet.getInt(1));
				boardDTO.setBoardTitle(rSet.getString(2));
				boardDTO.setUserID(rSet.getString(3));
				boardDTO.setBoardDate(rSet.getString(4));
				boardDTO.setBoardContent(rSet.getString(5));
				boardDTO.setBoardAvailable(rSet.getInt(6));
				return boardDTO;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	
	
	public int update(int boardID, String boardTitle, String boardContent) {
		String SQL = "UPDATE BOARDTABLE SET boardTitle = ?, boardContent = ? WHERE boardID = ?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, boardTitle);
			pstmt.setString(2, boardContent);
			pstmt.setInt(3, boardID);
			return pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1; //데이터베이스 오류
	}
	
	public int delete(int boardID) {
		String SQL = "UPDATE BOARDTABLE SET boardAvailable = 0 WHERE boardID = ?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, boardID);
			return pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1; //데이터베이스 오류
	}
}
