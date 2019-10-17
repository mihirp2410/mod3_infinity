package logic;
import servlets.*;
import java.io.*;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import utility.*;
public class Package_type {
      public static ResultSet getPackage() throws SQLException{
          
    	  String query="select * from MANAGE_CHANNEL_PACKAGE"; 
    	  /*String query1="select CH_NAME,CH_CHARGE,PKG_NAME from manage_channels mc right join manage_channel_package mcp\r\n" + 
    	  		"on mc.PKG_ID=mcp.PKG_ID\r\n" + 
    	  		"order by PKG_NAME ";
    	  PreparedStatement pst=DBConnection.Connection(query);
    	  PreparedStatement pst1=DBConnection.Connection(query1);
    	  ResultSet rs = pst.executeQuery();
    	  ResultSet rs1= pst1.executeQuery();
    	  ResultSet result[]=new ResultSet[2];
    	  result[0]=rs;
    	  result[1]=rs1;
          System.out.println("query executed");
		*/
    	  PreparedStatement pst = DBConnection.Connection(query);
    	  ResultSet rs = pst.executeQuery();
    	  return rs;
      }
}