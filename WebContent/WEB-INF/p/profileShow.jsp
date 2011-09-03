<%@page import="models.*"%>
<%@page import="java.sql.*"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Doctor</title>
<link rel="stylesheet" href="site.css" type="text/css" />
</head>

<% User user = (User)session.getAttribute("currentUser"); %>

<jsp:useBean id="profile" class="models.Patient" scope="request"/>	

<body>

	<%@ include file="/WEB-INF/layout/header.jsp" %>

	<%@ include file="/WEB-INF/layout/leftMenu.jsp" %>

	<%@ include file="/WEB-INF/layout/rightMenu.jsp" %>

	<div id="content">
		<h1><%= user.getLogin() %> - <%= user.getEmail() %>  </h1>
		
		<BR>
		<div class="pageHeader"> My Profile </div>
		<div class="space10px"></div>
		<table class="info-box">
			<tr>
				<th style="width:120px;">First Name: </th>
				<td> <%= profile.getFirstName() %> </td>
			</tr>

			<tr>
				<th>Last Name: </th>
				<td> <%= profile.getLastName() %> </td>
			</tr>

			<tr>
				<td colspan="2" class="noborder">&nbsp;</td>
			</tr>
			
			<tr>
				<th rowspan="2" valign="top">Address:</th>
				<td><%= profile.getAddress1() %>
					<% if (profile.getAddress2() != null) { %>
						<br/>
						<%= profile.getAddress2() %> 
					<% } %>
				</td>
			</tr>
			<tr>
				<td><%= profile.getCity() %>, <%= profile.getState() %> <%= profile.getZip() %> </td>
			</tr>
			<tr>
				<td colspan="2" class="noborder">&nbsp;</td>
			</tr>

			<tr>
				<th>Insurance:</th>
				<td><%= user.getInsuranceName() %> </td>
			</tr>
		</table>
		<br/>
		<p style="padding-left:10px;">
			<a href="PatientProfile?edit=edit"> Change my personal information </a>
		</p>
		
	
	</div>

	<%@ include file="/WEB-INF/layout/footer.jsp" %>
</body>
</html>