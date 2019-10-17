package logic;
import servlets.*;
import java.io.*;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import utility.*;
public class Channel_type {

	public static ArrayList<Channel> getChannels() throws SQLException {
		String query="select * from Manage_channels"; 
		PreparedStatement pst = DBConnection.Connection(query);
		ResultSet rs = pst.executeQuery();
		ArrayList<Channel> alc = new ArrayList<Channel>();
		while(rs.next()) {
			Channel c = new Channel();
			c.setChannel_name(rs.getString("CH_NAME"));
			c.setChannel_charge(Double.parseDouble(rs.getString("CH_CHARGE")));
			c.setPackage_id(rs.getInt("PKG_ID"));
			alc.add(c);
		}
		return alc;
	}
	
}
