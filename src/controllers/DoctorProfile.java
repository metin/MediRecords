package controllers;

import java.io.IOException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import models.DoctorRecord;
import models.User;

/**
 * Servlet implementation class PatientProfile
 */
public class DoctorProfile extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public DoctorProfile() {
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
			ejbs.ProfileEJB profile = (ejbs.ProfileEJB) c.lookup("java:global/MediRecords/ProfileEJB");
			request.setAttribute("profile", profile.findByID(u.getUserID()));
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		
		String v = (request.getParameter("edit") != null) ? "profileEdit.jsp" : "profileShow.jsp";
		
		view = request.getRequestDispatcher("/WEB-INF/d/"+v);
		view.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		models.Patient p = new models.Patient();
		HttpSession s = request.getSession(true);
		User u = (User)s.getAttribute("currentUser");

		p.setId(u.getUserID().toString());
		p.setFirstName(request.getParameter("first_name"));
		p.setLastName(request.getParameter("last_name"));

		p.setAddress1(request.getParameter("address1"));
		p.setAddress2(request.getParameter("address2"));
		p.setCity(request.getParameter("city"));
		p.setState(request.getParameter("state"));
		p.setZip(request.getParameter("zip"));

		try{
			Context c = new InitialContext();
			ejbs.ProfileEJB profile = (ejbs.ProfileEJB) c.lookup("java:global/MediRecords/ProfileEJB");
			profile.update(p);
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		
		response.sendRedirect(response.encodeRedirectURL("DoctorProfile"));
	}

}
