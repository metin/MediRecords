<%@page import="java.util.*"%>
<%@page import="models.*"%>
<%@page import="java.sql.*"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Records</title>
<link rel="stylesheet" href="site.css" type="text/css" />
</head>

<% User user = (User)session.getAttribute("currentUser"); %>


<body>

	<%@ include file="/WEB-INF/layout/header.jsp" %>

	<%@ include file="/WEB-INF/layout/leftMenu.jsp" %>

	<%@ include file="/WEB-INF/layout/rightMenu.jsp" %>


	<div id="content">
		<h1><%= user.getLogin() %> - <%= user.getEmail() %>  </h1>
		
		<BR>
		
		<jsp:useBean id="recs" class="ejbs.DoctorRecordEJB" scope="request"/>		
		
		<div class="pageHeader"> 
			<%= request.getParameter("rType") %>
		</div>
		<% ArrayList<DoctorRecord> r =  recs.doctorRecords(user.getUserID(), request.getParameter("rType").toString()); %>
		<hr>
		
		<table class="grid">
			<tr>
				<th>Details</th>
				<th style="width:150px">Patient</th>
				<% if (!request.getParameter("rType").toString().trim().equalsIgnoreCase("Prescription")) { %>
				<th style="width:150px">Insurance</th>
				<th style="width:80px">Status</th>
				<% } %>
				<th style="width:160px">Date</th>
			</tr>
			<% User p = null; %>
			<% for(int i=0; i < r.size(); i++) { %>
			<% DoctorRecord dr = r.get(i); %>
			<tr>
				<td> <%= dr.getDetails() %> </td>
				<td> <%= dr.getPatientName()%> </td>
				<% if (!request.getParameter("rType").toString().trim().equalsIgnoreCase("Prescription")) { %>
				<td><%= dr.getInsuranceName()%></td>
				<td><%= dr.getStatusDesc()%></td>
				<% } %>
				<td> <%= dr.getDate() %> </td>
			</tr>
			<% } %>
		</table>
	
	</div>
	
	<%@ include file="/WEB-INF/layout/footer.jsp" %>
	
</body>
</html>