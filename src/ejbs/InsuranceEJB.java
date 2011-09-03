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
public class InsuranceEJB extends db.Base {
    public InsuranceEJB() {
        
    }
    
    public ArrayList<Insurance> all() throws Exception
    {
    	ArrayList<Insurance> recs = new ArrayList<Insurance>();
		this.Connect();
		Connection c = this.getConn();
		PreparedStatement preparedset = null;
		String sqlOption="SELECT * FROM users WHERE role_id = 3 ";
		
		preparedset = c.prepareStatement(sqlOption);
		ResultSet r = preparedset.executeQuery();

		while (r.next()) { 
			
			Insurance p = new Insurance();
			p.setLogin(r.getString("login"));
			p.setId(r.getString("id"));
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
