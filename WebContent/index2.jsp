<%@page import="models.*" %>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>MediRecords</title>
<link rel="stylesheet" href="site.css" type="text/css" />
</head>
<body>
	<% User user = null; %>
	
	<%@ include file="WEB-INF/layout/header.jsp" %>

	<%@ include file="WEB-INF/layout/leftMenu.jsp" %>

	<%@ include file="WEB-INF/layout/rightMenu.jsp" %>

	<div id="content"> 
		<h2>Login</h2> 
		<jsp:useBean id="msg" class="java.lang.String" scope="request"/>
		<% if (msg!=null) {%>
			<br/><%= msg %>
		<% } %>
		<form method="POST" action='Session' name="edit">
		<table>
			<tr>
				<td>User Name:</td>
				<td><input type="text" name="uname"></td>
			</tr>
			<tr>
				<td>Password:</td>
				<td><input type="password" name="pwd"></td>
			</tr>
			<tr>
				<td><input type="submit" value="LogIn">  </td>
			</tr>
		</table>
		</form>
	
		Logins (Username/Password/Role):<br>
		jsmith / password / Patient <br>
		bgates / microsoft / Patient <br>
		drkumar / health / Doctor <br>
		medicaid / bones/ Insurance Provider <br>
	</div>
	
	<%@ include file="WEB-INF/layout/footer.jsp" %>
	
</body>
</html>