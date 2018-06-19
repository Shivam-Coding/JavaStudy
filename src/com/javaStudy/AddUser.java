package com.javaStudy;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DAO.DBConnect;

public class AddUser {
	
	public void execute(HttpServletRequest request, HttpServletResponse response){
		
		String firstname= request.getParameter("firstname");
		String lastname = request.getParameter("lastname");
		String password= request.getParameter("password");
		String email=request.getParameter("username");
		DBConnect db = new DBConnect();
		Connection con = db.connection();
		String msg = null ;
		int i = 0;
			try{
		
		PreparedStatement ps = con.prepareStatement("INSERT into User(name, lastname, email, password) VALUES(?,?,?,?)");
		ps.setString(1, firstname);
		ps.setString(2, lastname);
		ps.setString(3, email);
		ps.setString(4, password);
		i = ps.executeUpdate();
		
			}catch(Exception e){
				e.printStackTrace();
				msg = "Failed to Register.";
				
			}finally{
				try {
					con.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
			try {
				if(i == 0){
					request.setAttribute("msg", msg);
					request.getRequestDispatcher("Register.jsp").forward(request, response);
				}else
				
				{ request.getRequestDispatcher("Welcome.jsp").forward(request, response); }
			} catch (ServletException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		
	}

}
