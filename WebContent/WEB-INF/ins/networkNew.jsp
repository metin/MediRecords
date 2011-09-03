<%@page import="models.*"%>
<%@page import="java.sql.*"%>
<%@page import="java.util.*"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>New Network</title>
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
		<div class="pageHeader"> Edit My Profile </div>
		<div class="space10px"></div>

		<form method="POST" action='InsuranceNetwork?action=new' name="new">

			<table class="info-box">
			<tr>
				<th>Doctor:</th>
				<td>
					<jsp:useBean id="doctors" class="ejbs.DoctorEJB" scope="request"/>	
					<% ArrayList<Doctor> ps =  doctors.all(); %>
					<select name="doctor_id">
						<% for(int i=0; i < ps.size(); i++) { %>
							<option value="<%= ps.get(i).getId() %>">
									<%= ps.get(i).fullName() %>
							</option>
						<% } %>
					</select>
					
				</td>
			</tr>
	
				<tr>
					<th>Rate </th>
					<td>
						<input type="text" name="rate" />
					</td> 
				</tr>
	
				<tr>
					<td colspan="2" class="noborder">&nbsp;</td>
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