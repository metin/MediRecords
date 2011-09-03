package ejbs;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import javax.ejb.LocalBean;
import javax.ejb.Stateless;


import models.*;
import db.Base;

@Stateless(mappedName = "PatientEJB")
@LocalBean
public class PatientEJB extends db.Base {
    public PatientEJB() {
        
    }
    
    public ArrayList<Patient> all() throws Exception
    {
    	ArrayList<Patient> recs = new ArrayList<Patient>();
		this.Connect();
		Connection c = this.getConn();
		PreparedStatement preparedset = null;
		String sqlOption="SELECT * FROM users WHERE role_id = 1 ";
		
		preparedset = c.prepareStatement(sqlOption);
		ResultSet r = preparedset.executeQuery();

		while (r.next()) { 
			
			Patient p = new Patient();
			p.setLogin(r.getString("login"));
			p.setId(r.getString("id"));
			recs.add(p);
		} 
    	return recs;
    }

    public ArrayList<Patient> all(int insuranceID) throws Exception
    {
    	ArrayList<Patient> recs = new ArrayList<Patient>();
		this.Connect();
		Connection c = this.getConn();
		PreparedStatement preparedset = null;
		String sqlOption="SELECT * FROM users WHERE role_id = 1 and insurance_id = ?";
		
		preparedset = c.prepareStatement(sqlOption);
		preparedset.setInt(1, insuranceID);
		
		ResultSet r = preparedset.executeQuery();
		ProfileEJB pf = new ProfileEJB();

		while (r.next()) { 
			
			Patient p = new Patient();
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
