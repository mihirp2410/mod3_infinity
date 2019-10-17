<%@ page import="java.io.*,java.util.*"%>
<%@ page import="java.sql.*"%>
<%@ page import="logic.*" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" type="text/css" href="css/Style.css"/>
<title>Package</title>
<div class = "header">
<h1>Infinity DTH Services <h1>
</div>
</head>
</head>
<form action = "MainServlet" method="get">
<body>
 <script src="js/cost.js"></script>

	<label>Customer name:</label>
	<%
		HttpSession newsess = (HttpSession) getServletContext().getAttribute("sess");

		ResultSet rs = (ResultSet) newsess.getAttribute("package_resultset");
		ArrayList<Channel> alc = (ArrayList<Channel>) newsess.getAttribute("channel_list");
	%>
	
		<% int i = 0;%>
	
       <%
       while (rs.next()){
    	  
       %>
       		<%i++; %>
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
			<td><input type="checkbox" name="select" class="ss"
				value=<%=rs.getString("PKG_COST")%> onclick="totaltt()"/> <%=rs.getString("PKG_NAME")%>
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
				
				<td><input type="checkbox" name="select1" class="ss"
					 value="<%=c.getChannel_charge()%>" onclick="totalIt()"/><%=c.getChannel_name()%></td>
		
				<td><%=c.getChannel_charge()%></td>
				<td><%=c.getPackage_id() %></td>
				
			</tr>
			
			
				<%
			   		}
				%>
				
		
			 
          <%			
			}
          %>
          </table>
        
          
          
       <%
		}
       %>
		
	</table>

    <label> Total channel Cost = </label>
          <input name="tcc" value="$0.00" readonly="readonly" type="text" id="total"/><br><br>
     <label>Total package Cost =</label>   
           <input value="$0.00" readonly="readonly" type="text" id="totalp"/> <br><br> 
      <label>Total amount =</label>
           <input value="$0.00" readonly="readonly" type="text" id="totalamt"/>
           
     
    </form> 
    <footer style="color:#FFFFFF;padding:40px;">
  <p>Copyright by Infinity DTH Services</p>
  <p>Contact information: <a href="mailto:someone@example.com">customercare@infinitydth.com</a>.</p>
</footer>
</body>
</html>