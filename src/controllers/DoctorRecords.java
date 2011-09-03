package controllers;

import java.io.IOException;

import javax.naming.*;
import javax.servlet.*;
import javax.servlet.http.*;
import models.*;
import ejbs.*;

public class DoctorRecords extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public DoctorRecords() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession s = request.getSession(true);
		User u = (User)s.getAttribute("currentUser");
		if(u == null )
		{
			response.sendRedirect(response.encodeRedirectURL("index.jsp"));
			return;
		}
		//DoctorRecord recs = new DoctorRecord();
		//request.setAttribute("recs", recs);
		
		try{
			Context c = new InitialContext();
			ejbs.DoctorRecordEJB recs = (ejbs.DoctorRecordEJB) c.lookup("java:global/MediRecords/DoctorRecordEJB");
			request.setAttribute("recs", recs);
		}
		catch (Exception e) {}

		RequestDispatcher view = null;
		view = request.getRequestDispatcher("WEB-INF/doctorRecords.jsp");
		view.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}
	
	

}
