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

<jsp:useBean id="profile" class="models.Profile" scope="request"/>	

<body>

	<%@ include file="/WEB-INF/layout/header.jsp" %>

	<%@ include file="/WEB-INF/layout/leftMenu.jsp" %>

	<%@ include file="/WEB-INF/layout/rightMenu.jsp" %>

	<div id="content">
		<h1><%= user.getLogin() %> - <%= user.getEmail() %>  </h1>
		
		<BR>
		<div class="pageHeader"> Edit My Profile </div>
		<div class="space10px"></div>

		<form method="POST" action='DoctorProfile' name="edit">

			<table class="info-box">
				<tr>
					<th style="width:120px;">First Name </th>
					<td>
						<input type="text" name="first_name" value="<%= profile.getFirstName() %>"/> 
					</td>
				</tr>
	
				<tr>
					<th>Last Name </th>
					<td>
						<input type="text" name="last_name" value="<%= profile.getLastName() %>"/>
					</td> 
				</tr>
	
				<tr>
					<td colspan="2" class="noborder">&nbsp;</td>
				</tr>
				<tr>
					<th colspan="2">Address</th>
				</tr>
				<tr>
					<th rowspan="2" valign="top">Street </th>
					<td>
						<input type="text" name="address1" value="<%= profile.getAddress1() %>"/> 
					</td>
				</tr>
	
				<tr>
					<td>
						<input type="text" name="address2" value="<%= profile.getAddress2() == null ? "" : profile.getAddress2() %>"/>
					</td> 
				</tr>

				<tr>
					<th>City</th>
					<td>
						<input type="text" name="city" value="<%= profile.getCity() %>"/>
					</td> 
				</tr>
				<tr>
					<th>State</th>
					<td>
						<input type="text" name="state" value="<%= profile.getState() %>"/>
					</td> 
				</tr>

				<tr>
					<th>Zip Code</th>
					<td>
						<input type="text" name="zip" value="<%= profile.getZip() %>"/>
					</td> 
				</tr>
				
				<tr>
					<td colspan="2">
						<input type="submit" value="Update">  
					</td>
				</tr>
			</table>
		</form>

		
	
	</div>

	<%@ include file="/WEB-INF/layout/footer.jsp" %>
</body>
</html>