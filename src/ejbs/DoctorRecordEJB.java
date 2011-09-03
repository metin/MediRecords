package ejbs;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import javax.ejb.LocalBean;
import javax.ejb.Stateless;

import controllers.PatientProfile;


import models.*;
import db.Base;


@Stateless(mappedName = "DoctorRecordEJB")
@LocalBean
public class DoctorRecordEJB extends db.Base {
    public DoctorRecordEJB() {
        
    }
    
    public ArrayList<DoctorRecord> doctorRecords(int doctorID, String recordType) throws Exception
    {
    	ArrayList<DoctorRecord> recs = new ArrayList<DoctorRecord>();

		this.Connect();
		Connection c = this.getConn();
		PreparedStatement preparedset = null;
		String sqlOption="SELECT * FROM records WHERE doctor_id = ? AND TYPE = ? ";
		preparedset = c.prepareStatement(sqlOption);
		preparedset.setInt(1, doctorID);
		preparedset.setString(2, recordType);
		ResultSet r = preparedset.executeQuery();
		
		
		ProfileEJB pf = new ProfileEJB();
		
		while (r.next()) { 
			
			DoctorRecord dr = new DoctorRecord();
			dr.setPatienID(r.getString("user_id"));
			dr.setDetails(r.getString("details"));
			dr.setDate(r.getString("date_added"));
			dr.setStatus(r.getInt("status"));
			models.Profile p = pf.findByID(r.getInt("user_id"));
			dr.setPatientName(p.fullName());
			dr.setInsuranceID(r.getString("insurance_id"));
			p = pf.findByID(r.getInt("insurance_id"));
			dr.setInsuranceName(p.getFirstName());
			
			recs.add(dr);
		} 
    	return recs;
    }

    public ArrayList<DoctorRecord> latest(int doctorID, String recordType, int limit) throws Exception
    {
    	ArrayList<DoctorRecord> recs = new ArrayList<DoctorRecord>();

		this.Connect();
		Connection c = this.getConn();
		PreparedStatement preparedset = null;
		String sqlOption="SELECT * FROM records WHERE doctor_id = ? AND TYPE = ? order by date_added desc limit ? ";
		preparedset = c.prepareStatement(sqlOption);
		preparedset.setInt(1, doctorID);
		preparedset.setString(2, recordType);
		preparedset.setInt(3, limit);
		ResultSet r = preparedset.executeQuery();
		

		ProfileEJB pf = new ProfileEJB();

		
		while (r.next()) { 
			
			DoctorRecord dr = new DoctorRecord();
			dr.setPatienID(r.getString("user_id"));
			dr.setDetails(r.getString("details"));
			dr.setDate(r.getString("date_added"));
			dr.setStatus(r.getInt("status"));
			models.Profile p = pf.findByID(r.getInt("user_id"));
			dr.setPatientName(p.fullName());
			dr.setInsuranceID(r.getString("insurance_id"));
			p = pf.findByID(r.getInt("insurance_id"));
			dr.setInsuranceName(p.getFirstName());
			recs.add(dr);
		} 
    	return recs;
    }
    

    public void save(DoctorRecord dr) throws Exception{
		this.Connect();
		Connection c = this.getConn();
		Statement statement = c.createStatement();
		String sql = "INSERT INTO records (user_id,type,date_added,details,doctor_id, insurance_id, status)"
			       +"VALUES ('"+ dr.getPatienID()+"', '"+ 
			                 dr.getType() +"', NOW() ,  '"+
			                 dr.getDetails()+"', '"+
			                 dr.getDoctorID()+"', '"+ 
			                 dr.getInsuranceID() +"', 1 );";

		statement.executeUpdate(sql);
    }
}
