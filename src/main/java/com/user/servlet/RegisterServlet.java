package com.user.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.UserDaoImpl;
import com.db.DBConnect;
import com.entity.User;

@WebServlet("/r")
public class RegisterServlet extends HttpServlet{

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		try {
			String name=req.getParameter("name");
			String mail=req.getParameter("email");
			String phno=req.getParameter("phno");
			String pass=req.getParameter("password");
			String checkbox=req.getParameter("check");
			
			System.out.println(name+" "+mail+" "+phno+" "+pass+" "+checkbox);
			
			User us=new User();
			us.setName(name);
			us.setEmail(mail);
			us.setPhno(phno);
			us.setPassword(pass);
			
			HttpSession session=req.getSession();
			if(checkbox != null) {
				UserDaoImpl dao=new UserDaoImpl(DBConnect.getConn());
				
				boolean f2=dao.checkUser(mail);
				
				if(f2) {
					
					boolean f=dao.userRegister(us);
					if(f) {
						//System.out.println("User Register Success...");
						session.setAttribute("succMsg", "User Register Successfully...");
						resp.sendRedirect("register.jsp");
					}
					else {
						session.setAttribute("failedMsg", "Something Wrong on Server...");
						resp.sendRedirect("register.jsp");
					}
					
				}
				
				else {
					
					session.setAttribute("failedMsg", "User Already Exist Try Another Email Id");
					resp.sendRedirect("register.jsp");
				}
			}
			else {
				session.setAttribute("failedMsg", "Please Check Agree & Terms Condition...");
				resp.sendRedirect("register.jsp");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		super.doGet(req, resp);
	}
	
}
