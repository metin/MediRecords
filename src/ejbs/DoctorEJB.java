package ejbs;

import java.sql.*;
import java.util.*;

import javax.ejb.*;

import models.*;

@Stateless(mappedName = "DoctorEJB")
@LocalBean
public class DoctorEJB extends db.Base {
    public DoctorEJB() {
        
    }
    
    public ArrayList<Doctor> all() throws Exception
    {
    	ArrayList<Doctor> recs = new ArrayList<Doctor>();
		this.Connect();
		Connection c = this.getConn();
		PreparedStatement preparedset = null;
		String sqlOption="SELECT * FROM users WHERE role_id = 2 ";
		
		preparedset = c.prepareStatement(sqlOption);
		ResultSet r = preparedset.executeQuery();
		ProfileEJB pf = new ProfileEJB();
		
		while (r.next()) { 
			
			Doctor p = new Doctor();
			p.setLogin(r.getString("login"));
			p.setId(r.getString("id"));
			models.Profile pr = pf.findByID(r.getInt("id"));
			p.setFirstName(pr.getFirstName());
			p.setLastName(pr.getLastName());
			recs.add(p);
		} 
    	return recs;
    }
    
    public void save(Patient p) throws Exception{
		this.Connect();
		Connection c = this.getConn();
		Statement statement = c.createStatement();
		String sql = "INSERT INTO records (user_id,type,date_added,details,doctor_id)"
			       +"VALUES ('"+ p.getEmail()+"', '"+ p.getFirstName() +"', NOW() ,  '"+p.getEmail()+"', '"+p.getEmail()+"' );";

		statement.executeUpdate(sql);
    }
}
