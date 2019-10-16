<%@ page import="java.io.*,java.util.*"%>
<%@ page import="java.sql.*"%>
<%@ page import="logic.*" %>
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

		ResultSet rs = (ResultSet) newsess.getAttribute("package_resultset");
		ArrayList<Channel> alc = (ArrayList<Channel>) newsess.getAttribute("channel_list");
	%>
	

	
       <%
       while (rs.next()){
    	  
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

		<tr>
			<td><input type="checkbox" name="select"
				value=<%=rs.getString("PKG_NAME")%>> <%=rs.getString("PKG_NAME")%>
			</td>
			<td><%=rs.getString("PKG_CATEGORY")%></td>
			<td><%=rs.getString("PKG_TRANSMISSION_TYPE")%></td>
			<td><%=rs.getInt("PKG_COST")%></td>
			<td><%=rs.getDate("PKG_AVAILABLE_FROM")%></td>
			<td><%=rs.getDate("PKG_AVAILABLE_TO")%></td>
		</tr>
	
   
   </table>
   
   <table>
			<caption>Channels</caption>
			<tr id="heading">
				<th>Channel Name</th>
				<th>Channel Charge</th>
				<th>Package Name</th>
			</tr>
			<% for(Channel c : alc){
			   	if(c.getPackage_id()==rs.getInt("PKG_ID")){
					
			%>
			<tr>
				<td><input type="checkbox" name="select1"
					value=<%=c.getChannel_name()%>><%=c.getChannel_name()%></td>
				<td><%=c.getChannel_charge()%></td>
				<td><%=c.getPackage_id() %></td>
			</tr>
				<%
			   		}
				%>
			 
          <%			
			}
          %>
       <%
		}
       %>
	
	</table>


</body>
</html>