package logic;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import utility.DBConnection;

public class PurchasePackage {
	
	public static void insertPurchasePackageData(String[] packages,String purchase_date,String uname) throws SQLException {
		
		String query="select * from MANAGE_CHANNEL_PACKAGE"; 
  	  	PreparedStatement pst=DBConnection.Connection(query);
  	  	ResultSet rs = pst.executeQuery();
  	  	while(rs.next()) {
  	  		for(int i = 0; i < packages.length; i++) {
  	  			if(rs.getInt("PKG_ID")==Integer.parseInt(packages[i])) {
  	  				String insertquery = "insert into PURCHASE_PACKAGE values(?,?,?,?,?,?)";
  	  				pst = DBConnection.Connection(insertquery);
  	  				pst.setString(1,uname);
  	  				pst.setString(2,rs.getString("PKG_NAME"));
  	  				pst.setString(3,rs.getString("PKG_CATEGORY"));
  	  				pst.setInt(4,rs.getInt("PKG_COST"));
  	  				pst.setString(5,purchase_date);
  	  				pst.setInt(6, rs.getInt("PKG_ID"));
  	  				pst.executeQuery();
  	  			}
  	  		}
  	  	}

	}
}