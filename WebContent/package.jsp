<%@ page import="java.io.*,java.util.*"%>
<%@ page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

	<label>Customer name:</label>
	<%
		HttpSession newsess = (HttpSession) getServletContext().getAttribute("sess");

		ResultSet[] rs = (ResultSet[]) newsess.getAttribute("rst");
		ArrayList<String> al = new ArrayList<String>();
	%>
	

	<table>
		<caption>Package details</caption>
		<tr id="heading">
			<th>Package name</th>
			<th>Package Category</th>
			<th>Transmission Type</th>
			<th> Package Cost</th>
			<th>Available From</th>
			<th>Available To</th>
		</tr>
       <%
       while (rs[0].next()){
    	  
       %>

		<tr>
			<td><input type="checkbox" name="select"
				value=<%=rs[0].getString("PKG_NAME")%>> <%=rs[0].getString("PKG_NAME")%>
			</td>
			<td><%=rs[0].getString("PKG_CATEGORY")%></td>
			<td><%=rs[0].getString("PKG_TRANSMISSION_TYPE")%></td>
			<td><%=rs[0].getInt("PKG_COST")%></td>
			<td><%=rs[0].getDate("PKG_AVAILABLE_FROM")%></td>
			<td><%=rs[0].getDate("PKG_AVAILABLE_TO")%></td>
		</tr>
	
   <%
       }
   %>
   </table>
   
   <table>
			<caption>Channels</caption>
			<tr id="heading">
				<th>Channel Name</th>
				<th>Channel Charge</th>
				<th>Package Name</th>
			</tr>
			<% while(rs[1].next()){
				/* if(rs[0].getInt("PKG_ID")==rs[1].getInt("PKG_ID")){
					rs[1].beforeFirst(); */
			%>
			<tr>
				<td><input type="checkbox" name="select1"
					value=<%=rs[1].getString("CH_NAME")%>><%=rs[1].getString("CH_NAME")%></td>
				<td><%=rs[1].getInt("CH_CHARGE")%></td>
				<td><%=rs[1].getString("PKG_NAME") %></td>
			</tr>
	
			 
          <%
				
				
			
		}
          %>
	</table>
	


</body>
</html>