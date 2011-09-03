package db;
import java.sql.*;
import java.sql.Connection;


public class Base {

	private Connection conn;
	
	public Base()
	{
		
	}
	
	public void Connect() throws Exception
	{
		
		Class.forName("com.mysql.jdbc.Driver").newInstance();
		//try {
			this.conn = DriverManager.getConnection("jdbc:mysql://50.16.242.17/dev02", "webuser1", "pass1");
		/*} catch (SQLException e) {
			e.printStackTrace();
		}*/
	}

	public Connection getConn() {
		return conn;
	}
}
