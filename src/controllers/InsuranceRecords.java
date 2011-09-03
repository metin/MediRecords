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

import models.InsuranceDoctor;
import models.InsuranceRecord;
import models.User;

public class InsuranceRecords extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public InsuranceRecords() {
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
		
		ejbs.InsuranceRecordEJB recs = null;
		try{
			Context c = new InitialContext();
			recs = (ejbs.InsuranceRecordEJB) c.lookup("java:global/MediRecords/InsuranceRecordEJB");
		}
		catch (Exception e) {}
		
		if (request.getParameter("action") != null)
		{	
			InsuranceRecord ir = new InsuranceRecord();
			ir.setId(Integer.parseInt(request.getParameter("rec_id")));
			ir.setStatus(request.getParameter("action").equalsIgnoreCase("approve") ? 2 : 3);
			try {
				recs.update(ir);
			} catch (Exception e) { e.printStackTrace(); }
				

		}
		
		view = request.getRequestDispatcher("insurance.jsp");
		view.forward(request, response);
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

}
