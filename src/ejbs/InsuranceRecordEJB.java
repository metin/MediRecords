package ejbs;

import java.sql.*;
import java.util.*;

import javax.ejb.*;
import models.*;

@Stateless(mappedName = "DoctorRecordEJB")
@LocalBean
public class InsuranceRecordEJB extends db.Base {
    public InsuranceRecordEJB() {
        
    }
    
    public ArrayList<InsuranceRecord> all(int insuranceID, String recordType) throws Exception
    {
		this.Connect();
		Connection c = this.getConn();
		PreparedStatement preparedset = null;
		String sqlOption="SELECT * FROM records WHERE insurance_id = ? AND TYPE = ? ";
		preparedset = c.prepareStatement(sqlOption);
		preparedset.setInt(1, insuranceID);
		preparedset.setString(2, recordType);
		ResultSet r = preparedset.executeQuery();
    	return prepareRecords(r);
    }

    public ArrayList<InsuranceRecord> all(int insuranceID, int status) throws Exception
    {
		this.Connect();
		Connection c = this.getConn();
		PreparedStatement preparedset = null;
		String sqlOption="SELECT * FROM records WHERE insurance_id = ? AND status = ? ";
		preparedset = c.prepareStatement(sqlOption);
		preparedset.setInt(1, insuranceID);
		preparedset.setInt(2, status);
		ResultSet r = preparedset.executeQuery();
    	return prepareRecords(r);
    }

    public ArrayList<InsuranceRecord> all(int insuranceID, int status, String type) throws Exception
    {
		this.Connect();
		Connection c = this.getConn();
		PreparedStatement preparedset = null;
		String sqlOption="SELECT * FROM records WHERE insurance_id = ? AND status = ? AND type = ?";
		preparedset = c.prepareStatement(sqlOption);
		preparedset.setInt(1, insuranceID);
		preparedset.setInt(2, status);
		preparedset.setString(3, type);
		ResultSet r = preparedset.executeQuery();
    	return prepareRecords(r);
    }
    
    public ArrayList<InsuranceRecord> latest(int insuranceID, int status, String type, int size) throws Exception
    {
		this.Connect();
		Connection c = this.getConn();
		PreparedStatement preparedset = null;
		String sqlOption="SELECT * FROM records WHERE insurance_id = ? AND status = ? ";
		if(type!=null)
			sqlOption += " AND type = ? ";
		sqlOption += "order by date_added desc limit ?";
		preparedset = c.prepareStatement(sqlOption);
		preparedset.setInt(1, insuranceID);
		preparedset.setInt(2, status);
		if(type!=null)
		{
			preparedset.setString(3, type);
			preparedset.setInt(4, size);
		}
		else
			preparedset.setInt(3, size);
		
		ResultSet r = preparedset.executeQuery();
    	return prepareRecords(r);
    }

    public void update(InsuranceRecord rec) throws Exception{
		this.Connect();
		Connection c = this.getConn();
		Statement statement = c.createStatement();
		String sql = "UPDATE records set status = " + rec.getStatus() +
			         " WHERE id="+ rec.getId() + " ;";

		statement.executeUpdate(sql);
    }
    private ArrayList<InsuranceRecord> prepareRecords(ResultSet r) throws Exception {
    	ArrayList<InsuranceRecord> recs = new ArrayList<InsuranceRecord>();
		ProfileEJB pf = new ProfileEJB();
		while (r.next()) { 
			InsuranceRecord dr = new InsuranceRecord();
			dr.setId(r.getInt("id"));
			dr.setPatienID(r.getString("user_id"));
			dr.setDetails(r.getString("details"));
			dr.setDate(r.getString("date_added"));
			dr.setStatus(r.getInt("status"));
			models.Profile p = pf.findByID(r.getInt("user_id"));
			dr.setPatientName(p.fullName());
			dr.setInsuranceID(r.getString("insurance_id"));
			p = pf.findByID(r.getInt("insurance_id"));
			dr.setInsuranceName(p.getFirstName());

			dr.setDoctorID(r.getInt("doctor_id"));
			p = pf.findByID(r.getInt("doctor_id"));
			dr.setDoctorName(p.getFirstName());
			
			dr.setDate(r.getString("date_added"));
			dr.setType(r.getString("type"));
			recs.add(dr);
		} 
    	return recs;
    }
    
}
