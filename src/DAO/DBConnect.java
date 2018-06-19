package DAO;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBConnect {

	public Connection connection(){
		Connection con =null;
		try{
	        Class.forName("com.mysql.jdbc.GoogleDriver");
	        
	con = DriverManager.getConnection("jdbc:google:mysql://storied-link-124705:java-study1/JavaStudy?user=root");
	    }catch(Exception e){
	        e.printStackTrace();
	    }
		return con;
	}
	
}
