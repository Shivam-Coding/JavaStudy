package com.javaStudy;

import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import DAO.DBConnect;

public class Change {
	public void execute(HttpServletRequest request, HttpServletResponse response){
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = null;
		try{
		out = response.getWriter();
		String old= request.getParameter("old");
		old = old.trim();
		String pass = request.getParameter("newpassword");
		pass = pass.trim();
		HttpSession se = request.getSession();
		
			DBConnect db = new DBConnect();
			Connection con = db.connection();
			PreparedStatement ps = con.prepareStatement("UPDATE User SET password = ? WHERE password = ? and email= ?");
			ps.setString(1, pass);
			ps.setString(2, old);
			ps.setString(3, (String)se.getAttribute("email"));
			int b =ps.executeUpdate();
//			Statement stmt = con.createStatement();
//			ResultSet rs = stmt.executeQuery("SELECT * FROM Questions ORDER BY id DESC");
//			List l = new ArrayList();
//			while(rs.next()){
//				String[] data = new String[2];
//				data[0] = rs.getString("question");
//				data[1] = rs.getString("answer");
//				l.add(data);
//			}
//			request.setAttribute("data", l);
			con.close();
			if(b!=0){
				new UserData().execute(request, response);
			}else{
				request.getRequestDispatcher("Newpassword.jsp").include(request, response);
				out.println("<script>");
				out.println("alert('Password not changed');");
				out.println("</script>");
				
			}
			
				}catch(Exception e){
					e.printStackTrace();
				}
	}
}
