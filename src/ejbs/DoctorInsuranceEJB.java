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


@Stateless(mappedName = "DoctorInsuranceEJB")
@LocalBean
public class DoctorInsuranceEJB extends db.Base {
    public DoctorInsuranceEJB() {
        
    }
    
    public InsuranceDoctor find(String doctorID, int insuranceID) throws Exception
    {
		this.Connect();
		Connection c = this.getConn();
		PreparedStatement preparedset = null;
		String sqlOption="SELECT * FROM doctors_insurances WHERE doctor_id = ? and insurance_id = ?";
		preparedset = c.prepareStatement(sqlOption);
		preparedset.setString(1, doctorID);
		preparedset.setInt(2, insuranceID);
		return this.prepareRecords(preparedset.executeQuery()).get(0);
    }

    public ArrayList<InsuranceDoctor> allByDoctor(int doctorID) throws Exception
    {
		this.Connect();
		Connection c = this.getConn();
		PreparedStatement preparedset = null;
		String sqlOption="SELECT * FROM doctors_insurances WHERE doctor_id = ? ";
		preparedset = c.prepareStatement(sqlOption);
		preparedset.setInt(1, doctorID);
    	return this.prepareRecords(preparedset.executeQuery());
    }


    public ArrayList<InsuranceDoctor> allByInsurance(int insuranceID) throws Exception
    {
		this.Connect();
		Connection c = this.getConn();
		PreparedStatement preparedset = null;
		String sqlOption="SELECT * FROM doctors_insurances WHERE insurance_id = ? ";
		preparedset = c.prepareStatement(sqlOption);
		preparedset.setInt(1, insuranceID);
    	return this.prepareRecords(preparedset.executeQuery());
    }


    public void delete(String insuranceId, String doctorId) throws Exception{
		this.Connect();
		Connection c = this.getConn();
		Statement statement = c.createStatement();
		String sql = " delete from doctors_insurances where doctor_id = "+doctorId +" and insurance_id = "+ insuranceId + ";";
		statement.execute(sql);
    }
    
    public void save(InsuranceDoctor ir) throws Exception{
		this.Connect();
		Connection c = this.getConn();
		Statement statement = c.createStatement();
		String sql = "INSERT INTO doctors_insurances (doctor_id, insurance_id, rate, created_on)"
			       +"VALUES ('"+ ir.getDoctorID()+"', '"+ 
			                 ir.getInsuranceID() +"', '"+
			                 ir.getRate()+"',  NOW() );";

		statement.executeUpdate(sql);
    }

    public void update(InsuranceDoctor ir) throws Exception{
		this.Connect();
		Connection c = this.getConn();
		Statement statement = c.createStatement();
		String sql = "UPDATE doctors_insurances set rate = " + ir.getRate() +
			         " WHERE insurance_id="+ ir.getInsuranceID()+
			         		" AND doctor_id="+ ir.getDoctorID() + " ;";

		statement.executeUpdate(sql);
    }
    
    private ArrayList<InsuranceDoctor> prepareRecords(ResultSet r)  throws Exception{
		ProfileEJB pf = new ProfileEJB();
		ArrayList<InsuranceDoctor> recs = new ArrayList<InsuranceDoctor>();
		while (r.next()) { 
			
			InsuranceDoctor dr = new InsuranceDoctor();
			dr.setDoctorID(r.getInt("doctor_id"));
			models.Profile p = pf.findByID(r.getInt("doctor_id"));
			dr.setDoctorName(p.fullName());
			dr.setInsuranceID(r.getString("insurance_id"));
			p = pf.findByID(r.getInt("insurance_id"));
			dr.setInsuranceName(p.getFirstName());
			dr.setRate(r.getInt("rate"));
			dr.setDate(r.getString("created_on"));
			recs.add(dr);
		} 
    	return recs;
    }
}
