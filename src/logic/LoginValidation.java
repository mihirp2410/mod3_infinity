package logic;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import utility.DBConnection;

public class LoginValidation {
	public static ResultSet getCredentials(String uname,String pwd) throws SQLException {
		String query="select * from login where uname=?"; 
		PreparedStatement pst = DBConnection.Connection(query);
		pst.setString(1, uname);
		ResultSet rs = pst.executeQuery();
		return rs;
	}
}
