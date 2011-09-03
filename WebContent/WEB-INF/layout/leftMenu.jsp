
<%@page import="models.*"%>

<% User curUser = (User)session.getAttribute("currentUser"); %>

<div id="left"> 
	<h2>Main Menu</h2> 
	<% if (curUser == null) { %>
		
	<%} else if (curUser.getRole() == 1) { %>
		<ul>
			<li> 
				<a href="Patient"> Home </a>
			</li>
			<li> 
				<a href="PatientRecords?rType=Prescription"> My Prescriptions </a>
			</li>
			<li> 
				<a href="PatientRecords?rType=Procedure"> My Procedures </a>
			</li>
			<li> 
				<a href="PatientRecords?rType=Hospitalization"> My Hospitalizations </a>
			</li>			
			<li> 
				<a href="PatientProfile"> My Profile </a>
			</li>			

			<li> 
				<a href="#"> Find A Physician </a>
			</li>			

			<li> 
				<a href="Session"> LogOut </a>
			</li>			

		</ul>
	<%} else if (curUser.getRole() == 2) { %>
		<ul>
			<li> 
				<a href="Doctor"> Home </a>
			</li>
			<li> 
				<a href="DoctorRecords?rType=Prescription"> My Prescriptions </a>
			</li>
			<li> 
				<a href="DoctorRecords?rType=Procedure"> My Procedures </a>
			</li>

			<li> 
				<a href="DoctorRecordNew"> Add New Record  </a>
			</li>
			<li> 
				<a href="DoctorProfile"> My Profile </a>
			</li>			
			<li> 
				<a href="DoctorNetwork"> My Network </a>
			</li>	
			<li> 
				<a href="Session"> LogOut </a>
			</li>			
		</ul>
	<%} else if (curUser.getRole() == 3) { %>
		<ul>
			<li> 
				<a href="Insurance"> Home </a>
			</li>		
			<li> 
				<a href="InsuranceNetwork"> Doctors</a>
			</li>	
			<li> 
				<a href="InsurancePatients"> Patients</a>
			</li>	

			<li> 
				<a href="Session"> LogOut </a>
			</li>
			
		</ul>
	<% } %>	
	
	
</div> 