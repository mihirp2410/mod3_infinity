package logic;
import servlets.*;
import java.io.*;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import utility.*;
public class stb_type {
      public static ResultSet stb(String choose) throws SQLException{
          
    	  String query="select * from STB_Package where STB_BILLING_TYPE=?"; 
    	  PreparedStatement pst=DBConnection.Connection(query);
    	  pst.setString(1,choose);
    	  ResultSet rs = pst.executeQuery();
          System.out.println("query executed");
		return rs;
    	  
      }
}
