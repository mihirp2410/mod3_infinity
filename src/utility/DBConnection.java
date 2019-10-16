package utility;
import java.sql.*;


public class DBConnection {
	static String driverinfo="oracle.jdbc.driver.OracleDriver";
	 
	 
	final static String DB_URL="jdbc:oracle:thin:@localhost:1521:xe";
	static Connection connection = null;
	static PreparedStatement statement = null;
	
	public static PreparedStatement Connection(String query) {
		try 
		{
			Class.forName(driverinfo);
			Connection c = DriverManager.getConnection(DB_URL, "system", "12345");
			System.out.println("connection established");
			statement = c.prepareStatement(query);
			System.out.println("pst created");
			return statement;
		}
		catch(Exception e) 
		{
			e.printStackTrace();
		}
		
		
		return statement;
		
	}

}
