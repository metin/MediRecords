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

import models.User;


public class InsurancePatients extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public InsurancePatients() {
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
			ejbs.PatientEJB patients = (ejbs.PatientEJB) c.lookup("java:global/MediRecords/PatientEJB");
			request.setAttribute("patients", patients);
		}
		catch (Exception e) {}
		
		view = request.getRequestDispatcher("/WEB-INF/ins/patients.jsp");
		view.forward(request, response);
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

}
