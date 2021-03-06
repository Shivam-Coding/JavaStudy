package com.javaStudy;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import DAO.DBConnect;

public class NotesData {

	
public void execute(HttpServletRequest request, HttpServletResponse response){
		
		try{
			HttpSession session = request.getSession(false);
			
			if(session == null){
				request.getRequestDispatcher("Welcome.jsp").forward(request, response);
			}else{
				DBConnect db = new DBConnect();
				Connection con = db.connection();
				Statement stmt = con.createStatement();
				 
				
				 ResultSet	rs = stmt.executeQuery("SELECT * FROM Notes ORDER BY id DESC");
					List l = new ArrayList();
					while(rs.next()){
						String[] data = new String[4];
						data[0] = rs.getString("note");
						data[1] = rs.getString("name");
						data[2] = rs.getString("email");
						data[3] = rs.getInt("id")+"";
						l.add(data);
					}
					con.close();
					response.setHeader("Cache-Control","no-cache");
					response.setHeader("Cache-Control","no-store");
					response.setDateHeader("Expires", 0);
					response.setHeader("Pragma","no-cache");
				
					request.setAttribute("data", l);
					request.getRequestDispatcher("Notes.jsp").forward(request, response);
			}
			}catch(Exception e){
				e.printStackTrace();
			}
		}
	
	
	
}
