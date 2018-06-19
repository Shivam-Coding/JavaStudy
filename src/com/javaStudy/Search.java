package com.javaStudy;

import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DAO.DBConnect;

public class Search {


	public void execute(HttpServletRequest request, HttpServletResponse response){
	
		String search= request.getParameter("number");
		try{
			DBConnect db = new DBConnect();
			Connection con = db.connection();
			Statement stmt = con.createStatement();
			ResultSet rs;
			if(search.equalsIgnoreCase("all")){
				rs = stmt.executeQuery("SELECT * FROM User");
			}else{
				rs = stmt.executeQuery("SELECT * FROM User where email='"+search+"'");
			}
			List l = new ArrayList();
			while(rs.next()){
				String[] data = new String[3];
				data[0] = rs.getString("name");
				data[1] = rs.getString("password");
				data[2] = rs.getString("email");
				l.add(data);
			}
			request.setAttribute("data", l);
			
			con.close();
				}catch(Exception e){
					e.printStackTrace();
				}
		try {
			
			request.getRequestDispatcher("ShowDetail.jsp").forward(request, response);
		} catch (ServletException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
