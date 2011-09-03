<%@page import="models.User"%>
<%@page import="java.sql.*"%>
<%@page import="java.util.*"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insurance</title>
<link rel="stylesheet" href="site.css" type="text/css" />
</head>

<% User user = (User)session.getAttribute("currentUser"); %>


<body>

	<%@ include file="WEB-INF/layout/header.jsp" %>

	<%@ include file="WEB-INF/layout/leftMenu.jsp" %>

	<%@ include file="WEB-INF/layout/rightMenu.jsp" %>

	<div id="content">
		<h1><%= user.getLogin() %> - <%= user.getEmail() %>  </h1>
		
		<BR>
		<div class="pageHeader"> Summary </div>
		<div class="space10px"></div>
		<div class="space10px"></div>


		<jsp:useBean id="recs" class="ejbs.InsuranceRecordEJB" scope="request"/>		

		<div class="header1"> Pending Claims</div>


		<% ArrayList<InsuranceRecord> r =  recs.latest(user.getUserID(), 1, null, 5); %>
		
		<table class="grid">
			<tr>
				<th>Details</th>
				<th style="width:160px">Type</th>
				<th style="width:160px">Patient</th>
				<th style="width:160px">Date</th>
				<th style="width:160px">Actions</th>
			</tr>

			<% for(int i=0; i < r.size(); i++) { %>
			<% InsuranceRecord dr = r.get(i); %>
			<tr>
				<td> <%= dr.getDetails() %> </td>
				<td> <%= dr.getType() %> </td>
				<td> <%= dr.getPatientName()%> </td>
				<td> <%= dr.getDate() %> </td>
				<td align="center">
					<a href="InsuranceRecords?action=approve&rec_id=<%=dr.getId() %>"> Approve </a>
					&nbsp;|&nbsp;
					<a href="InsuranceRecords?action=decline&rec_id=<%= dr.getId() %>" onclick="return confirm('Sure?');"> Decline </a>
				</td>
			</tr>
			<% } %>
		</table>
		<div class="space10px"></div>
		<div class="header1"> Recently Approved Claims</div>

		<% r =  recs.latest(user.getUserID(), 2, null, 5); %>
		
		<table class="grid">
			<tr>
				<th>Details</th>
				<th style="width:160px">Type</th>
				<th style="width:160px">Patient</th>
				<th  style="width:160px">Date</th>
			</tr>

			<% for(int i=0; i < r.size(); i++) { %>
			<% InsuranceRecord dr = r.get(i); %>
			<tr>
				<td> <%= dr.getDetails() %> </td>
				<td> <%= dr.getType() %> </td>
				<td> <%= dr.getPatientName()%></td>
				<td > <%= dr.getDate() %> </td>
			</tr>
			<% } %>
		</table>

		<div class="space10px"></div>
		<div class="header1"> Recently Declined Claims</div>

		<% r =  recs.latest(user.getUserID(), 3, null, 5); %>
		
		<table class="grid">
			<tr>
				<th>Details</th>
				<th style="width:160px">Type</th>
				<th style="width:160px">Patient</th>
				<th style="width:160px">Date</th>
			</tr>

			<% for(int i=0; i < r.size(); i++) { %>
			<% InsuranceRecord dr = r.get(i); %>
			<tr>
				<td> <%= dr.getDetails() %> </td>
				<td> <%= dr.getType() %> </td>
				<td> 
					<%= dr.getPatientName()%>
				</td>
				<td> <%= dr.getDate() %> </td>
			</tr>
			<% } %>
		</table>
	
	</div>

	<%@ include file="WEB-INF/layout/footer.jsp" %>
</body>
</html>