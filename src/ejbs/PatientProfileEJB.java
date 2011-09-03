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
public class PatientProfileEJB extends db.Base {
    public PatientProfileEJB() {
        
    }
    
    public Patient findByPatientID(Integer userId) throws Exception
    {
		this.Connect();
		Connection c = this.getConn();
		PreparedStatement preparedset = null;
		String sqlOption="SELECT * FROM user_details WHERE user_id = ? ";
		
		preparedset = c.prepareStatement(sqlOption);
		preparedset.setInt(1, userId);
		ResultSet resultset = preparedset.executeQuery();
		
		Patient r = new Patient();
		if(resultset.next())
		{
			 r.setFirstName(resultset.getString("first_name"));
			 r.setLastName(resultset.getString("last_name"));
			 r.setAddress1(resultset.getString("address1"));
			 r.setAddress2(resultset.getString("address2"));
			 r.setCity(resultset.getString("city"));
			 r.setState(resultset.getString("state"));
			 r.setZip(resultset.getString("zipcode"));
		}
		return r;
		
    }
    
    public void create(Patient p) throws Exception{
		this.Connect();
		Connection c = this.getConn();
		Statement statement = c.createStatement();
		String sql = "INSERT INTO user_details (user_id, first_name, last_name, address1, address2, city, state, zip)"
			       +" VALUES ('"+ p.getId()+"', '"+ p.getFirstName() +"','"+ p.getLastName()+"','"+p.getAddress1()+"','"+p.getCity()+"','"+p.getState()+"', '"+p.getZip()+"' );";

		statement.executeUpdate(sql);
    }
    
    public void update(Patient p) throws Exception{
		this.Connect();
		Connection c = this.getConn();
		Statement statement = c.createStatement();
		String sql = "UPDATE user_details SET " +
					 "first_name='" + p.getFirstName()+ "'," +
					 "last_name='" + p.getLastName()+ "'," +
					 "address1='" + p.getAddress1()+ "'," +
					 "address2='" + p.getAddress2()+ "'," +
					 "city='" + p.getCity()+ "'," +
					 "state='" + p.getState()+ "'," +
					 "zipcode='" + p.getZip()+ "'" +
			         " where user_id= " + p.getId()+";";

		statement.executeUpdate(sql);
    }
    
}
