package com.javaStudy;

import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import DAO.DBConnect;

public class Login {
	public void execute(HttpServletRequest request, HttpServletResponse response){
		String name= request.getParameter("username");
		name = name.trim();
		String pass = request.getParameter("password");
		pass = pass.trim();
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = null;
		try{
			out = response.getWriter();
			DBConnect db = new DBConnect();
			Connection con = db.connection();
			Statement stmt = con.createStatement();
			ResultSet rs = stmt.executeQuery("SELECT name, email FROM User where email='"+name+"' AND password='"+pass+"'");
			if(rs.next()){
				HttpSession session = request.getSession();
				session.setAttribute("user", rs.getString("name"));
				session.setAttribute("email", rs.getString("email"));
				session.setMaxInactiveInterval(600);
				con.close();
				new UserData().execute(request, response);
//				rs = stmt.executeQuery("SELECT * FROM Questions ORDER BY id DESC");
//				List l = new ArrayList();
//				while(rs.next()){
//					String[] data = new String[2];
//					data[0] = rs.getString("question");
//					data[1] = rs.getString("answer");
//					l.add(data);
//				}
				
//				request.setAttribute("data", l);
//				request.getRequestDispatcher("Userdata.jsp").forward(request, response);
			}else{
				con.close();
				request.getRequestDispatcher("Welcome.jsp").include(request, response);
				out.println("<script>");
				out.println(" alert('Not Registered');");
				out.println("</script>");
				}
		}catch(Exception e){
			e.printStackTrace();
		}
	}
}
