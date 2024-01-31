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
@WebServlet("/update_profile")
public class UpdateProfile extends HttpServlet{

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			int id=Integer.parseInt(req.getParameter("id"));
			String name=req.getParameter("name");
			String mail=req.getParameter("email");
			String phno=req.getParameter("phno");
			String pass=req.getParameter("password");
			 
			HttpSession session=req.getSession();
			
			User us=new User();
			us.setId(id);
			us.setName(name);
			us.setEmail(mail);
			us.setPhno(phno);
			
			
			UserDaoImpl dao=new UserDaoImpl(DBConnect.getConn());
			boolean f=dao.checkPassword(id, pass);
			
			if(f) {
				boolean f2=dao.updateProfile(us);
				if(f2) {
					session.setAttribute("succMsg", "User Profile Update Successfully");
					resp.sendRedirect("edit_profile.jsp");
				}
				else {
					session.setAttribute("failedMsg", "Something Wrong on Server");
					resp.sendRedirect("edit_profile.jsp");
				}
				
			}
			else {
				session.setAttribute("failedMsg", "Your Password is Incorrect");
				resp.sendRedirect("edit_profile.jsp");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	
	
	
}
