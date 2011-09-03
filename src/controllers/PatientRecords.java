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

import models.Record;
import models.User;

public class PatientRecords extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public PatientRecords() {
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
		request.setAttribute("user", u);
		
		try{
			Context c = new InitialContext();
			ejbs.PatientRecordEJB recs = (ejbs.PatientRecordEJB) c.lookup("java:global/MediRecords/PatientRecordEJB");
			request.setAttribute("recs", recs);
		}
		catch (Exception e) {}

		RequestDispatcher view = null;
		view = request.getRequestDispatcher("WEB-INF/patientRecords.jsp");
		view.forward(request, response);

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

}
