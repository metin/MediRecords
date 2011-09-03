package controllers;

import java.io.IOException;

import javax.naming.*;
import javax.servlet.*;
import javax.servlet.http.*;
import models.User;

/**
 * Session controller
 */
public class Session extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public Session() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		
		RequestDispatcher view = null;
		System.out.println("Signing out");
		HttpSession s = request.getSession(true);
		s.setAttribute("currentUser", null);
		view = request.getRequestDispatcher("/index.jsp");
		view.forward(request, response);
//
//		try{
//			Context c = new InitialContext();
//			db.UserRemote session = (db.UserRemote) c.lookup("java:global/MediRecordEJB/User");
//			System.out.println(session.sayHello());
//		}
//		catch (Exception e) {
//			e.printStackTrace();
//		}

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		User u = new User();
		u.setLogin(request.getParameter("uname"));
		u.setPassword(request.getParameter("pwd"));
		String msg = "";
//		try
//		{
//			u.authorize(request.getParameter("uname"), request.getParameter("pwd"));
//		}
//		catch (Exception e) {
//			e.printStackTrace();
//			msg = e.toString();
//			
//		}

		try{
			Context c = new InitialContext();
			ejbs.SessionEJB session = (ejbs.SessionEJB) c.lookup("java:global/MediRecords/SessionEJB");
			session.authorize(u);
		}
		catch (Exception e) {}

		// Check role
		RequestDispatcher view = null;
		
		if (u.isAuthorized())
		{
			//view = request.getRequestDispatcher(u.getHomePage());
			HttpSession s = request.getSession(true);
			s.setAttribute("currentUser", u);
			System.out.println(request.getParameter("uname"));
			response.sendRedirect(response.encodeRedirectURL(u.getHome()));
		}
		else
		{
			msg += "Wrong username or password";
			request.setAttribute("msg", msg);
			view = request.getRequestDispatcher("/index.jsp");

			view.forward(request, response);
		}
	}

}
