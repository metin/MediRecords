<%@page import="models.* "%>
<%@page import="java.sql.*"%>
<%@page import="java.util.*"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Patient</title>
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
		
		<jsp:useBean id="recs" class="ejbs.PatientRecordEJB" scope="request"/>		

		<div class="header1"> Recent Prescriptions</div>

		<% ArrayList<PatientRecord> r =  recs.allByType(user.getUserID(), "Prescription", 6); %>

		<table class="grid">
			<tr>
				<th>Details</th>
				<th style="width:160px">Date</th>
				<th style="width:80px">Status</th>
				<th style="width:150px">Doctor</th>
			</tr>
			<% for(int i=0; i < r.size(); i++) {%>
			<tr>
				<td> <%= r.get(i).getDetails() %> </td>
				<td> <%= r.get(i).getDate() %> </td>
				<td> <%= r.get(i).getStatusDesc() %> </td>
				<td> <%= r.get(i).getDoctorName() %> </td>
			</tr>
			<% } %>
		</table>
		
		<div class="space10px"></div>

		<div class="header1"> Recent Procedures</div>		
		<% r =  recs.allByType(user.getUserID(), "Procedure", 6); %>
		
		
		<table class="grid">
			<tr>
				<th>Details</th>
				<th style="width:160px">Date</th>
				<th style="width:80px">Status</th>
				<th style="width:150px">Doctor</th>
			</tr>
			<% for(int i=0; i < r.size(); i++) {%>
			<tr>
				<td> <%= r.get(i).getDetails() %> </td>
				<td> <%= r.get(i).getDate() %> </td>
				<td> <%= r.get(i).getStatusDesc() %> </td>
				<td> <%= r.get(i).getDoctorName() %> </td>
			</tr>
			<% } %>
		</table>
		

		<div class="space10px"></div>
		<div class="header1"> Recent Hospitalizations</div>		
		<% r =  recs.allByType(user.getUserID(), "Hospitalization", 6); %>
		
		<table class="grid">
			<tr>
				<th>Details</th>
				<th style="width:160px">Date</th>
				<th style="width:80px">Status</th>
				<th style="width:150px">Doctor</th>
			</tr>
			<% for(int i=0; i < r.size(); i++) {%>
			<tr>
				<td> <%= r.get(i).getDetails() %> </td>
				<td> <%= r.get(i).getDate() %> </td>
				<td> <%= r.get(i).getStatusDesc() %> </td>
				<td> <%= r.get(i).getDoctorName() %> </td>
			</tr>
			<% } %>
		</table>

	
	</div>
	
	<%@ include file="WEB-INF/layout/footer.jsp" %>
	
</body>
</html>