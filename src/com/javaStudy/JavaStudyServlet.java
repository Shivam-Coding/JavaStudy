package com.javaStudy;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.*;

import com.javaStudy.AddUser;
import com.javaStudy.Change;
import com.javaStudy.Login;
import com.javaStudy.Questions;
import com.javaStudy.Search;
import com.javaStudy.UserData;
import com.javaStudy.Notes;
import com.javaStudy.NotesData;

import com.javaStudy.CheckQuestion;

@SuppressWarnings("serial")
public class JavaStudyServlet extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		process(request,response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		process(request,response);
	}

	protected void process(HttpServletRequest request, HttpServletResponse response){
		try{
			String form = request.getParameter("form");
			
			if(form.equals("add")){
				new AddUser().execute(request, response);
			}
				
			if(form.equals("questions")){
				
					new Questions().execute(request, response);
				}
					
			if(form.equals("search")){
						new Search().execute(request, response);
					}
						
			if(form.equals("login")){
							String name= request.getParameter("username");
							String pass = request.getParameter("password");
							if(name.equals("mail.shivamawasthi@gmail.com") && pass.equals("admin")){
								HttpSession session = request.getSession();
								session.setAttribute("user", "Administrator");
								session.setMaxInactiveInterval(600);
								RequestDispatcher rd = request.getRequestDispatcher("Adminpage.jsp");
								try {
									rd.forward(request, response);
								} catch (ServletException e) {
									// TODO Auto-generated catch block
									e.printStackTrace();
								} catch (IOException e) {
									// TODO Auto-generated catch block
									e.printStackTrace();
								}
							}else{
								new Login().execute(request, response);
							}
						}
							
			if(form.equals("logout")){
								HttpSession session = request.getSession();
								session.invalidate();
								response.setHeader("Cache-Control","no-cache");
								response.setHeader("Cache-Control","no-store");
								response.setDateHeader("Expires", 0);
								response.setHeader("Pragma","no-cache");
								try {
									request.getRequestDispatcher("Welcome.jsp").forward(request, response);
								} catch (Exception e) {
									// TODO Auto-generated catch block
									e.printStackTrace();
								} 
							}
								
			if(form.equals("changepassword")){
									new Change().execute(request, response);
									
								}
			if(form.equals("userdata"))	{
				new UserData().execute(request, response);
			}
			
			if(form.equals("notes"))	{
				new Notes().execute(request, response);
			}
					
			if(form.equals("notesdata"))	{
				new NotesData().execute(request, response);
			}
			
			if(form.equals("checkQuestion")){
				
				new CheckQuestion().execute(request, response);
				
			}		
					
				
			
			}catch(Exception e){
				e.printStackTrace();
				try {
					
					response.setHeader("Cache-Control","no-cache");
					response.setHeader("Cache-Control","no-store");
					response.setDateHeader("Expires", 0);
					response.setHeader("Pragma","no-cache");
					request.getRequestDispatcher("Welcome.jsp").forward(request, response);
				} catch (ServletException e1) {
					// TODO Auto-generated catch block
					e1.printStackTrace();
				} catch (IOException e1) {
					// TODO Auto-generated catch block
					e1.printStackTrace();
				}
			}
		}
}
