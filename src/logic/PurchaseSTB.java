package logic;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import utility.DBConnection;

public class PurchaseSTB {
	
	public static void insertPurchaseSTBData(String stb, String uname) throws SQLException {
		String query="select * from STB_Package where STB_ID=?"; 
  	  	PreparedStatement pst=DBConnection.Connection(query);
  	  	pst.setInt(1,Integer.parseInt(stb));
  	  	ResultSet rs = pst.executeQuery();
  	  	String insertquery = "insert into PURCHASE_STB values(?,?,?,?,?,?,?,?)";
  	  	//System.out.println("Inside PURCHASE STB DATA");
  	  	pst = DBConnection.Connection(insertquery);
  	  	//pst.setInt(1,45);
  	  	pst.setString(1,uname);
  	  	rs.next();
  	  	pst.setString(2,rs.getString("STB_TYPE"));
  	  	//System.out.println("the stb type is : " + rs.getString("STB_TYPE"));
  	  	pst.setString(3,stb);
  	  	pst.setInt(4,rs.getInt("STB_PRICE"));
  	  	pst.setInt(5,rs.getInt("STB_INSTALLATION_CHARGE"));
  	  	pst.setDouble(6, Double.parseDouble(rs.getString("STB_DISCOUNT")));
  	  	pst.setDouble(7, 12);
  	  	double total_amount = (rs.getInt("STB_PRICE") + rs.getInt("STB_INSTALLATION_CHARGE")
		+ rs.getInt("STB_REFUNDABLE_DEPOSIT") - rs.getInt("STB_DISCOUNT"));
  	  	double tax = 0.12 * total_amount;
  	  	double amount_payable = tax + total_amount;
  	  	pst.setDouble(8,amount_payable);
  	  	pst.executeQuery();
  	  	System.out.println("query executed");
		//return rs;
	}

}
