package com.javaStudy;


import java.sql.Connection;
import java.sql.PreparedStatement;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DAO.DBConnect;

public class Questions {

 
	public void execute(HttpServletRequest request, HttpServletResponse response){
		
	    String choice = request.getParameter("selected");
		String question=request.getParameter("question");
		question = question.replaceAll("\n", "<br>");
		question = question.replaceAll(" ", "&nbsp;");
		String answer=request.getParameter("answer");
		answer= answer.replaceAll("\n", "<br>");
		answer= answer.replaceAll(" ", "&nbsp;");
		String email = (String)request.getSession(false).getAttribute("email");
		String name = (String)request.getSession(false).getAttribute("user");
		try{
			DBConnect db = new DBConnect();
			Connection con = db.connection();
			PreparedStatement ps = con.prepareStatement("INSERT into Questions VALUES(?,?,?,?,?,?)");
			ps.setString(1, null);
			ps.setString(2, question);
			ps.setString(3, answer);
			ps.setString(4, choice);
			ps.setString(5, email);
			ps.setString(6, name);
			ps.execute();
			con.close();
				}catch(Exception e){
					e.printStackTrace();
		
				}
		
	}
	
	
		
	
	
}
