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
		
		<jsp:useBean id="recs" class="ejbs.DoctorInsuranceEJB" scope="request"/>		
		
		<div class="pageHeader"> 
			Doctors
		</div>
		<% ArrayList<InsuranceDoctor> r =  recs.allByInsurance(user.getUserID()); %>
		<hr>
		
		<table class="grid">
			<tr>
				<th>Doctor</th>
				<th style="width:100px;">Rate</th>
				<th style="width:170px;">Since</th>
				<th style="width:170px;">Actions</th>
			</tr>
			<% for(int i=0; i < r.size(); i++) { %>
			<% InsuranceDoctor dr = r.get(i); %>
			<tr>
				<td> <%= dr.getDoctorName() %> </td>
				<td> <%= dr.getRate()%> </td>
				<td> <%= dr.getDate() %> </td>
				<td> 
					<a href="InsuranceNetwork?action=delete&doctor_id=<%= dr.getDoctorID() %>" onclick="return confirm('Sure?');"> Discontinue </a>
					&nbsp;|&nbsp;
					<a href="InsuranceNetwork?action=edit&doctor_id=<%= dr.getDoctorID() %>"> Change Rate </a>
				</td>
			</tr>
			<% } %>
		</table>

		<br/>
		<p style="padding-left:10px;">
			<a href="InsuranceNetwork?action=new"> Add New </a>
		</p>
	
	</div>
	
	<%@ include file="/WEB-INF/layout/footer.jsp" %>
	
</body>
</html>