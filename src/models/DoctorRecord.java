package models;

public class DoctorRecord extends Record{
	public DoctorRecord()
	{
		
	}
	

/*
	public void save() throws Exception	{
		this.Connect();
		Connection c = this.getConn();
		Statement statement = c.createStatement();
		String sql = "INSERT INTO records (user_id,type,date_added,details,doctor_id)"
			       +"VALUES ('"+ this.getPatienID()+"', '"+ getType() +"', NOW() ,  '"+getDetails()+"', '"+this.getDoctorID()+"' );";

		statement.executeUpdate(sql);
	}

	public ResultSet getRecords(Integer doctorID, String recordType) throws Exception {
		this.Connect();
		Connection c = this.getConn();
		PreparedStatement preparedset = null;
		String sqlOption="SELECT * FROM records WHERE doctor_id = ? AND TYPE = ? ";
		preparedset = c.prepareStatement(sqlOption);
		preparedset.setInt(1, doctorID);
		preparedset.setString(2, recordType);
		return preparedset.executeQuery();
	
	}
*/
}
