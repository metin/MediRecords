package ejbs;

import java.sql.*;
import java.util.*;

import javax.ejb.*;

import models.*;

@Stateless(mappedName = "ProfileEJB")
@LocalBean
public class ProfileEJB extends db.Base {
    public ProfileEJB() {
        
    }
    
    public Profile findByID(Integer userId) throws Exception
    {
		this.Connect();
		Connection c = this.getConn();
		PreparedStatement preparedset = null;
		String sqlOption="SELECT * FROM user_details WHERE user_id = ? ";
		
		preparedset = c.prepareStatement(sqlOption);
		preparedset.setInt(1, userId);
		ResultSet resultset = preparedset.executeQuery();
		
		Profile r = new Profile();
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
    
    public void create(Profile p) throws Exception{
		this.Connect();
		Connection c = this.getConn();
		Statement statement = c.createStatement();
		String sql = "INSERT INTO user_details (user_id, first_name, last_name, address1, address2, city, state, zip)"
			       +" VALUES ('"+ p.getId()+"', '"+ p.getFirstName() +"','"+ p.getLastName()+"','"+p.getAddress1()+"','"+p.getCity()+"','"+p.getState()+"', '"+p.getZip()+"' );";

		statement.executeUpdate(sql);
    }
    
    public void update(Profile p) throws Exception{
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
