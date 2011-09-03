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

public class DoctorNetwork extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public DoctorNetwork() {
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
			ejbs.DoctorInsuranceEJB network = (ejbs.DoctorInsuranceEJB) c.lookup("java:global/MediRecords/DoctorInsuranceEJB");
			request.setAttribute("network", network);
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		
		view = request.getRequestDispatcher("/WEB-INF/d/network.jsp");
		view.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

}
