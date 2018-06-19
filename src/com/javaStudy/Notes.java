package com.javaStudy;

import java.sql.Connection;
import java.sql.PreparedStatement;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DAO.DBConnect;

public class Notes {

	
public void execute(HttpServletRequest request, HttpServletResponse response){
		
		String note=request.getParameter("note");
		note = note.replaceAll("\n", "<br>");
		note = note.replaceAll(" ", "&nbsp;");
		String email = (String)request.getSession(false).getAttribute("email");
		String name = (String)request.getSession(false).getAttribute("user");
		
		try{
			DBConnect db = new DBConnect();
			Connection con = db.connection();
			PreparedStatement ps = con.prepareStatement("INSERT into Notes VALUES(?,?,?,?)");
			ps.setString(1, null);
			ps.setString(2, note);
			ps.setString(3, email);
			ps.setString(4, name);
			
			ps.execute();
			con.close();
				}catch(Exception e){
					e.printStackTrace();
				}
		
		
		
	}
	
	
}
