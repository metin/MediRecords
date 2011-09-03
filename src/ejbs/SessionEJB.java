package ejbs;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.ejb.LocalBean;
import javax.ejb.Stateless;

import models.User;

/**
 * Session Bean implementation class SessionEJB
 */
@Stateless(mappedName = "SessionEJB")
@LocalBean
public class SessionEJB extends db.Base {

    /**
     * Default constructor. 
     */
    public SessionEJB() {
        // TODO Auto-generated constructor stub
    }
    
    public boolean authorize(User u) throws Exception
    {

		this.Connect();
		Connection c = this.getConn();
		ResultSet resultset;
		PreparedStatement preparedset = null;

		String sqlOption="SELECT * FROM users WHERE login=? and password=? LIMIT 1";
		if (c==null)
			System.out.println("c is null");
		preparedset = c.prepareStatement(sqlOption);
		preparedset.setString(1, u.getLogin());
		preparedset.setString(2, u.getPassword());
		ProfileEJB pf = new ProfileEJB();
		resultset = preparedset.executeQuery();
		if(resultset.next())
		{
			u.setLogin(resultset.getString("login"));
			u.setRole(resultset.getInt("role_id"));
			u.setUserID(resultset.getInt("id"));
			u.setEmail(resultset.getString("email"));
			u.setInsuranceID(resultset.getString("insurance_id"));
			
			models.Profile  p = pf.findByID(resultset.getInt("insurance_id"));
			u.setInsuranceName(p.getFirstName());

			 u.setAuthorized(true);
			 return true;
		}
		else
		{
			u.setAuthorized(false);
			return false;
		}
    }

}
