<%@page import="java.util.ArrayList"%>
<%@page import="models.*" %>
<%@page import="java.sql.*"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>MediRecords</title>
<link rel="stylesheet" href="site.css" type="text/css" />
</head>
<body>
	<% User user = (User)session.getAttribute("currentUser"); %>
	
	<%@ include file="/WEB-INF/layout/header.jsp" %>

	<%@ include file="/WEB-INF/layout/leftMenu.jsp" %>

	<%@ include file="/WEB-INF/layout/rightMenu.jsp" %>

	<div id="content"> 
		<h1><%= user.getLogin() %> - <%= user.getEmail() %>  </h1>
		<br/>
		<div class="pageHeader">Add New Record</div> 
		
		<jsp:useBean id="msg" class="java.lang.String" scope="request"/>
		<% if (msg!=null) {%>
			<br/><%= msg %>
		<% } %>
		<form method="POST" action='DoctorRecordNew' name="edit">
		<table>
			<tr>
				<td>Patient:</td>
				<td>
					<jsp:useBean id="patients" class="ejbs.PatientEJB" scope="request"/>	
					<% ArrayList<Patient> ps =  patients.all(); %>
					<select name="patient_id">
						<% for(int i=0; i < ps.size(); i++) { %>
							<option value="<%= ps.get(i).getId() %>">
									<%= ps.get(i).getLogin() %>
							</option>
						<% } %>
					</select>
					
				</td>
			</tr>
			<tr>
				<td>Type:</td>
				<td>
					<select name="type">
						<option value="Prescription"> Prescription</option>
						<option value="Procedure"> Procedure</option>
					</select>
				</td>
			</tr>
			<tr>
				<td>Details:</td>
				<td><textarea name="details" rows="10" cols="40"></textarea> </td>
			</tr>
			<tr>
				<td colspan="2">
					<input type="submit" value="Add Record">  
				</td>
			</tr>
		</table>
		</form>

	</div>
	
	<%@ include file="/WEB-INF/layout/footer.jsp" %>
	
</body>
</html>