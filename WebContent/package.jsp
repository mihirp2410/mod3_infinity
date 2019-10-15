<%@ page import = "java.io.*,java.util.*" %>
<%@ page import="java.sql.*" %>
<%@ page import="Logic.*" %>
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
	DBConnection db = new DBConnection();
      String query="select * from STB"; 
      String query1="select * from brands";
   
      PreparedStatement st = db.connect(query);
      
    	ResultSet  rs=st.executeQuery();
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