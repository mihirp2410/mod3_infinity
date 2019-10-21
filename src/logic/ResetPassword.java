package logic;

import java.sql.PreparedStatement;
//import java.sql.ResultSet;
import java.sql.SQLException;

import utility.DBConnection;

public class ResetPassword {
	public static void setNewPassword(String uname, String new_password) throws SQLException {
		String query="update login set password=? where uname=?"; 
		PreparedStatement pst = DBConnection.Connection(query);
		pst.setString(1,new_password);
		pst.setString(2,uname);
		pst.executeQuery();
	
	}

}
