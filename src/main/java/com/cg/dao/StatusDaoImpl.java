package com.cg.dao;

import java.beans.Statement;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.stereotype.Component;
import org.springframework.stereotype.Repository;

import com.cg.bean.Status;
@Repository
@Component("dao") 
public class StatusDaoImpl implements StatusDao {
	Connection con;
	@Override
	public Status addDetails(Status status) {
		try
		{
		Class.forName("org.h2.Driver");
		con=DriverManager.getConnection("jdbc:h2:tcp://localhost/~/test",
				"sa","");
		PreparedStatement stmt=con.prepareStatement("insert into source_schema.report values(?,?,?,?,?,?)");  
		stmt.setString(1,status.getUserName()); 
		stmt.setDate(2, status.getStatusReport());
		stmt.setString(3, status.getCurrentWeekStatus());
		stmt.setString(4, status.getNextWeekStatus());
		stmt.setString(5,status.getIssueNote());
		stmt.setTimestamp(6, status.getTimeStamp());
		stmt.executeUpdate();
		con.close();
		}
		catch(Exception e)
		{
			System.out.println(e);
		}
		return null;
	}
	 public boolean isUsernameRegistered(String username) {
		 
		 boolean usernameExists = false;

		    try
		    {
		    	Class.forName("org.h2.Driver");
				con=DriverManager.getConnection("jdbc:h2:tcp://localhost/~/test",
						"sa","");
		        PreparedStatement st = con.prepareStatement("select * from source_schema.report order by username desc");
		        ResultSet r1=st.executeQuery();
		        String usernameCounter;
		         if(r1.next()) 
		         {
		           usernameCounter =  r1.getString("username");
		           if(usernameCounter == username) //this part does not happen even if it should
		           {
		               System.out.println("It already exists");
		              usernameExists = true;
		           }
		         }

		     }
		     catch (SQLException e) 
		     {
		        System.out.println("SQL Exception: "+ e.toString());
		     } 
		     catch (ClassNotFoundException cE) 
		     {
		        System.out.println("Class Not Found Exception: "+ cE.toString());
		     }

		 return usernameExists;
		 }
}
