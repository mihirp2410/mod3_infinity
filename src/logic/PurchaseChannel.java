package logic;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import utility.DBConnection;

public class PurchaseChannel {
	
	public static void insertPurchaseChannelData(String[] channels,String purchase_date,String uname) throws SQLException {
		
		String query="select * from Manage_channels"; 
  	  	PreparedStatement pst=DBConnection.Connection(query);
  	  	ResultSet rs = pst.executeQuery();
  	  	while(rs.next()) {
  	  		for(int i = 0; i < channels.length; i++) {
  	  			if(rs.getString("CH_NAME").equalsIgnoreCase(channels[i])) {
  	  				String insertquery = "insert into PURCHASE_CHANNEL values(?,?,?,?,?)";
  	  				pst = DBConnection.Connection(insertquery);
  	  				pst.setString(1,uname);
  	  				pst.setString(2,rs.getString("CH_NAME"));
  	  				pst.setDouble(3,Double.parseDouble(rs.getString("CH_CHARGE")));
  	  				pst.setString(4,purchase_date);
  	  				pst.setInt(5,rs.getInt("PKG_ID"));
  	  				pst.executeQuery();
  	  			}
  	  		}
  	  	}

	}
}
