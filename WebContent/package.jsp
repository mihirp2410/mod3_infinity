<%@ page import = "java.io.*,java.util.*" %>
<%@ page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
String driverinfo="oracle.jdbc.driver.OracleDriver";
      String url="jdbc:oracle:thin:@localhost:1521:xe";
      String uname="system";
      String pass="12345";
      String query="select * from STB"; 
      String query1="select * from brands";
      
       Connection con=null;
  	 Statement st=null;
  	 ResultSet rs=null;
  	 ResultSet rs1=null;
      
      Class.forName(driverinfo);
      System.out.println("Driver info registered successsfully");
      
      con=DriverManager.getConnection(url,uname,pass);
      System.out.println("established connection successfully"); 
      
      st=con.createStatement();
      System.out.println("connection created");
      
      rs=st.executeQuery(query);
      System.out.println("query successfully executed");
      %>
<label>Customer name:</label>
  <table>
<caption>Package details</caption>
                <tr id="heading">
                    <th>Package name </th>
                    <th>Channel Name </th>
                    <th>Channel charge </th>
                    <th>Package Purchase Date</th>
                    <th>Total Package Cost</th>
                    <th>Total Amount</th>
                </tr>
               
            
            </table> <br><br>
              <table>
<caption>Additional Package options</caption>
                <tr id="heading">
                    <th>Package name </th>
                    <th>Channel Name </th>
                    <th>Channel charge </th>
                    <th>Package Purchase Date</th>
                    <th>Total Package Cost</th>
                    <th>Total Amount</th>
                    <th> Select</th>
                </tr>
            
            </table>
            
</body>
</html>