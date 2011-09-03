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
/**
 * Session Bean implementation class RecordEJB
 */
@Stateless(mappedName = "PatientRecordEJB")
@LocalBean
public class PatientRecordEJB extends db.Base {
    public PatientRecordEJB() {
        
    }
    
    public ArrayList<PatientRecord> allByType(int userID, String recordType) throws Exception
    {
    	ArrayList<PatientRecord> recs = new ArrayList<PatientRecord>();

		this.Connect();
		Connection c = this.getConn();
		PreparedStatement preparedset = null;
		String sqlOption="SELECT * FROM records WHERE user_id = ? AND TYPE = ? ";
		preparedset = c.prepareStatement(sqlOption);
		preparedset.setInt(1, userID);
		preparedset.setString(2, recordType);
		ResultSet r = preparedset.executeQuery();

		ProfileEJB pf = new ProfileEJB();
		
		while (r.next()) { 
			
			PatientRecord pr = new PatientRecord();
			pr.setPatienID(r.getString("user_id"));
			pr.setDetails(r.getString("details"));
			pr.setDate(r.getString("date_added"));
			pr.setDoctorID(r.getInt("doctor_id"));
			pr.setStatus(r.getInt("status"));
			models.Profile p = pf.findByID(r.getInt("doctor_id"));
			pr.setDoctorName(p.fullName());


			pr.setInsuranceID(r.getString("insurance_id"));
			p = pf.findByID(r.getInt("insurance_id"));
			pr.setInsuranceName(p.getFirstName());

			recs.add(pr);
		} 
    	return recs;
    }
    
    public ArrayList<PatientRecord> allByType(int userID, String recordType, int limit) throws Exception
    {
    	ArrayList<PatientRecord> recs = new ArrayList<PatientRecord>();

		this.Connect();
		Connection c = this.getConn();
		PreparedStatement preparedset = null;
		String sqlOption="SELECT * FROM records WHERE user_id = ? AND TYPE = ? order by date_added desc limit ?";
		preparedset = c.prepareStatement(sqlOption);
		preparedset.setInt(1, userID);
		preparedset.setString(2, recordType);
		preparedset.setInt(3, limit);
		ResultSet r = preparedset.executeQuery();

		ProfileEJB pf = new ProfileEJB();
		
		while (r.next()) { 
			
			PatientRecord pr = new PatientRecord();
			pr.setPatienID(r.getString("user_id"));
			pr.setDetails(r.getString("details"));
			pr.setDate(r.getString("date_added"));
			pr.setDoctorID(r.getInt("doctor_id"));
			pr.setStatus(r.getInt("status"));
			models.Profile p = pf.findByID(r.getInt("doctor_id"));
			pr.setDoctorName(p.fullName());


			pr.setInsuranceID(r.getString("insurance_id"));
			p = pf.findByID(r.getInt("insurance_id"));
			pr.setInsuranceName(p.getFirstName());


			recs.add(pr);
		} 
    	return recs;
    }

    public void save(DoctorRecord dr) throws Exception{
		this.Connect();
		Connection c = this.getConn();
		Statement statement = c.createStatement();
		String sql = "INSERT INTO records (user_id,type,date_added,details,doctor_id)"
			       +"VALUES ('"+ dr.getPatienID()+"', '"+ dr.getType() +"', NOW() ,  '"+dr.getDetails()+"', '"+dr.getDoctorID()+"' );";

		statement.executeUpdate(sql);
    }
}
