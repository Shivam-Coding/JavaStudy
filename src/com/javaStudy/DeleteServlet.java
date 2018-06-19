package com.javaStudy;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import DAO.DBConnect;

/**
 * Servlet implementation class DeleteServlet
 */

public class DeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String content = request.getParameter("content");
		String id = request.getParameter("id");
		
		if(content.equals("note")){
			try{
				HttpSession session = request.getSession(false);
				
				if(session == null){
					request.getRequestDispatcher("Welcome.jsp").forward(request, response);
				}else{
					DBConnect db = new DBConnect();
					Connection con = db.connection();
					
					PreparedStatement ps = con.prepareStatement("delete from Notes where id =?");
					ps.setString(1, id);
					ps.executeUpdate();
					
					
					
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
		
		
		if(content.equals("question")){
			
			try{
				HttpSession session = request.getSession(false);
				
				if(session == null){
					request.getRequestDispatcher("Welcome.jsp").forward(request, response);
				}else{
					DBConnect db = new DBConnect();
					Connection con = db.connection();
					PreparedStatement ps = con.prepareStatement("delete from Questions where id =?");
					ps.setString(1, id);
					ps.executeUpdate();
					
					
					Statement stmt = con.createStatement();
					 
					
					 ResultSet	rs = stmt.executeQuery("SELECT * FROM Questions ORDER BY id DESC");
						List l = new ArrayList();
						while(rs.next()){
							String[] data = new String[6];
							data[0] = rs.getString("question");
							data[1] = rs.getString("answer");
							data[2] = rs.getString("choice");
							data[3] = rs.getString("name");
							data[4] = rs.getString("email");
							data[5] = rs.getInt("id")+"";
							l.add(data);
						}
						con.close();
						response.setHeader("Cache-Control","no-cache");
						response.setHeader("Cache-Control","no-store");
						response.setDateHeader("Expires", 0);
						response.setHeader("Pragma","no-cache");
					
						request.setAttribute("data", l);
						request.getRequestDispatcher("Userdata.jsp").forward(request, response);
				}
				}catch(Exception e){
					e.printStackTrace();
				}
		}
		
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
