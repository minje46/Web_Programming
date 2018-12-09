package user;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;


public class UserDAO {
   private Connection conn; //DB�� �����ϱ� ���� ��ü
   private PreparedStatement pstmt;
   private ResultSet rs; //������ ���� �� �ִ� ������ ������ش�.
   
//mysql ó���κ�
   public UserDAO() {
      // Constructor.
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

//UserAuth ��������
   public String getAuth(String userID) {
      String SQL = "SELECT userGender FROM USER WHERE userID = ?";
      try {
         pstmt = conn.prepareStatement(SQL);
         pstmt.setString(1, userID);
         rs = pstmt.executeQuery();
         if (rs.next())
            return rs.getString(1); // ID ����
      } catch (SQLException e) {
         // TODO Auto-generated catch block
         e.printStackTrace();
      }
      return "error"; // user ID�� ����
   }
   
   
//Log in ó���κ�
   public int login(String userID, String userPassword) {
      String SQL = "SELECT userPassword FROM USER WHERE userID = ?";
      try {
         pstmt = conn.prepareStatement(SQL);
         pstmt.setString(1, userID);
         rs = pstmt.executeQuery();
         if(rs.next()) {
            if(rs.getString(1).equals(userPassword)) {
               return 1; //Log-in success.            
            }
         }else { 
            return 0; // Wrong password.
         }
         return -1; // No ID
      }catch(Exception e) {
         e.printStackTrace();
      }
      return -2; // DB error.
   }
   
   // Input form.
   public int join(User user) {
   String SQL = "INSERT INTO USER VALUES (?,?,?,?,?)";
   try {
   pstmt = conn.prepareStatement(SQL);
   pstmt.setString(1, user.getUserID());
   pstmt.setString(2, user.getUserPassword());
   pstmt.setString(3, user.getUserName());
   pstmt.setString(4, user.getUserAuthor());
   pstmt.setString(5, user.getUserEmail());
   return pstmt.executeUpdate();
   } catch (Exception e) {
   e.printStackTrace();
   }
   return -1; // DB error.
   }
 
}