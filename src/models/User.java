package models;
import java.sql.*;
import db.*;

public class User extends Base {

	private String login;
	private String email;
	private String password;
	private Integer role;
	private boolean authorized;
	private Integer userID;
	private String insuranceID;
	private String insuranceName;
	
	public User()
	{
		
	}
	
	public String getInsuranceID() {
		return insuranceID;
	}

	public void setInsuranceID(String insuranceID) {
		this.insuranceID = insuranceID;
	}

	public void setInsuranceName(String insName) {
		this.insuranceName = insName;
	}
	public String getInsuranceName() {
		return this.insuranceName;
	}

	public User(Integer userID) throws Exception
	{
		this.Connect();
		Connection c = this.getConn();
		ResultSet resultset;
		PreparedStatement preparedset = null;

		String sqlOption="SELECT * FROM users WHERE id=? LIMIT 1";
		preparedset = c.prepareStatement(sqlOption);
		preparedset.setInt(1, userID);

		resultset = preparedset.executeQuery();
		if(resultset.next())
		{
			 this.setLogin(resultset.getString("login"));
			 this.setRole(resultset.getInt("role_id"));
			 this.setUserID(resultset.getInt("id"));
		}

	}

	public Integer getUserID() {
		return userID;
	}

	public void setUserID(Integer userID) {
		this.userID = userID;
	}

	public boolean isAuthorized() {
		return authorized;
	}

	public void setAuthorized(boolean authorized) {
		this.authorized = authorized;
	}

	public String getLogin() {
		return login;
	}

	public void setLogin(String login) {
		this.login = login;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public Integer getRole() {
		return role;
	}

	public void setRole(Integer role) {
		this.role = role;
	}
/*
	public boolean authorize(String uname, String pwd) throws Exception  {
		this.Connect();
		Connection c = this.getConn();
		ResultSet resultset;
		PreparedStatement preparedset = null;

		String sqlOption="SELECT * FROM users WHERE login=? and password=? LIMIT 1";
		if (c==null)
			System.out.println("c is null");
		preparedset = c.prepareStatement(sqlOption);
		preparedset.setString(1, uname);
		preparedset.setString(2, pwd);

		resultset = preparedset.executeQuery();
		if(resultset.next())
		{
			 this.setLogin(resultset.getString("login"));
			 this.setRole(resultset.getInt("role_id"));
			 this.setUserID(resultset.getInt("id"));
			 
			 setAuthorized(true);
			 return true;
		}
		else
		{
			setAuthorized(false);
			return false;
		}
	}
*/
	public boolean authenticate() {
		return true;
	}
	
	public String getHomePage()
	{
		if(this.getRole() == 1)
			return "/patient.jsp";
		else if(this.getRole() == 2)
			return "/doctor.jsp";
		else if(this.getRole() == 3)
			return "/insurance.jsp";
		else
			return "/index.jsp";
	}

	public String getHome()
	{
		if(this.getRole() == 1)
			return "Patient";
		else if(this.getRole() == 2)
			return "Doctor";
		else if(this.getRole() == 3)
			return "Insurance";
		else
			return "Session";
	}



}
