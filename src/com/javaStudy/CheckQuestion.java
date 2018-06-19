package com.javaStudy;

import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DAO.DBConnect;

public class CheckQuestion {

	public void execute(HttpServletRequest request, HttpServletResponse response) throws SQLException, ServletException, IOException{
		String quesNumber = request.getParameter("questionNumber").trim();
		int id = Integer.parseInt(quesNumber);
		DBConnect db = new DBConnect();
		Connection con = db.connection();
		String[] data = new String[4];
		try{
			Statement st = con.createStatement();
			 ResultSet	rs = st.executeQuery("SELECT * FROM Questions where id = "+id);
			
				while(rs.next()){
					
					data[0] = rs.getString("question");
					data[1] = rs.getString("answer");
					data[2] = rs.getString("choice");
					data[3] = rs.getString("name");
					
				}
				
				
			
		}catch(Exception e){
			e.printStackTrace();

		}finally{
			con.close();
		}
		request.setAttribute("msg", quesNumber);
		request.setAttribute("data", data);
		request.getRequestDispatcher("CheckQuestion.jsp").forward(request, response);
	
		
		
	}
	
}
