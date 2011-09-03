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

import com.sun.grizzly.config.dom.NetworkAddress;

import models.InsuranceDoctor;
import models.User;

public class InsuranceNetwork extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public InsuranceNetwork() {
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
		
		ejbs.DoctorInsuranceEJB network = null;
		try{
			Context c = new InitialContext();
			network = (ejbs.DoctorInsuranceEJB) c.lookup("java:global/MediRecords/DoctorInsuranceEJB");
			request.setAttribute("network", network);
			ejbs.DoctorEJB doctors = (ejbs.DoctorEJB) c.lookup("java:global/MediRecords/DoctorEJB");
			request.setAttribute("doctors", doctors);

		}
		catch (Exception e) {
			e.printStackTrace();
		}
		String v = "network.jsp";
		if (request.getParameter("action") == null)
			v = "network.jsp";
		else if(request.getParameter("action").equalsIgnoreCase("edit"))
		{
			try {
				InsuranceDoctor id = network.find(request.getParameter("doctor_id"), u.getUserID());
				request.setAttribute("doctor", id);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			v = "networkEdit.jsp";
		}
		else if(request.getParameter("action").equalsIgnoreCase("new"))
			v = "networkNew.jsp";
		else if(request.getParameter("action").equalsIgnoreCase("delete"))
		{
			try {
				network.delete(u.getUserID().toString(), request.getParameter("doctor_id"));
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}

		view = request.getRequestDispatcher("/WEB-INF/ins/"+v);
		view.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		RequestDispatcher view = null;
		HttpSession s = request.getSession(true);
		User u = (User)s.getAttribute("currentUser");
		if(u == null )
		{
			response.sendRedirect(response.encodeRedirectURL("index.jsp"));
			return;
		}
		
		ejbs.DoctorInsuranceEJB network = null;
		try{
			Context c = new InitialContext();
			network = (ejbs.DoctorInsuranceEJB) c.lookup("java:global/MediRecords/DoctorInsuranceEJB");
			request.setAttribute("network", network);
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		
		models.InsuranceDoctor ir = new models.InsuranceDoctor();
		ir.setDoctorID(Integer.parseInt(request.getParameter("doctor_id")));
		ir.setInsuranceID(u.getUserID().toString());
		ir.setRate(Integer.parseInt(request.getParameter("rate")));
		
		String v = "network.jsp";
		if (request.getParameter("action") == null)
			v = "network.jsp";
		else if(request.getParameter("action").equalsIgnoreCase("edit"))
			try {
				network.update(ir);
			} catch (Exception e) { e.printStackTrace(); }
		else if(request.getParameter("action").equalsIgnoreCase("new"))
		{
			try {
				network.save(ir);
			} catch (Exception e) { e.printStackTrace(); }
		}

		view = request.getRequestDispatcher("/WEB-INF/ins/network.jsp");
		view.forward(request, response);
	}

}
