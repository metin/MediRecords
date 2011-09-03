package controllers;

import java.io.IOException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.servlet.*;
import javax.servlet.http.*;

import models.*;

public class DoctorRecordNew extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public DoctorRecordNew() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		RequestDispatcher view = null;
		HttpSession s = request.getSession(true);
		User u = (User)s.getAttribute("currentUser");
		if(u == null )
		{
			response.sendRedirect(response.encodeRedirectURL("index.jsp"));
			return;
		}
		try{
			Context c = new InitialContext();
			ejbs.PatientEJB patient = (ejbs.PatientEJB) c.lookup("java:global/MediRecords/PatientEJB");
			request.setAttribute("patients", patient);
		}
		catch (Exception e) {}

		view = request.getRequestDispatcher("WEB-INF/doctorRecordNew.jsp");
		view.forward(request, response);

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		DoctorRecord dr = new DoctorRecord();
		HttpSession s = request.getSession(true);
		User u = (User)s.getAttribute("currentUser");

		dr.setPatienID(request.getParameter("patient_id"));
		dr.setDetails(request.getParameter("details"));
		dr.setDoctorID(u.getUserID());
		dr.setType(request.getParameter("type"));
		dr.setInsuranceID(u.getInsuranceID());
		try{
			Context c = new InitialContext();
			ejbs.DoctorRecordEJB recs = (ejbs.DoctorRecordEJB) c.lookup("java:global/MediRecords/DoctorRecordEJB");
			recs.save(dr);
		}
		catch (Exception e) {}
		
		response.sendRedirect(response.encodeRedirectURL("Doctor"));

	}

}
