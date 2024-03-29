package com.admin.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.BookDaoImpl;
import com.db.DBConnect;
import com.entity.BookDetails;

@WebServlet("/edit_books")
public class EditBooks extends HttpServlet{

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			int id=Integer.parseInt(req.getParameter("id"));
			String bookName=req.getParameter("bname");
			String author=req.getParameter("aname");
			String price=req.getParameter("price");
			String status=req.getParameter("status");
			
			BookDetails b=new BookDetails();
			b.setBookId(id);
			b.setBookName(bookName);
			b.setAuthor(author);
			b.setPrice(price);
			b.setStatus(status);
			
			BookDaoImpl dao=new BookDaoImpl(DBConnect.getConn());
			boolean f=dao.updateEditBook(b);	
			
			HttpSession session=req.getSession();
			
			if(f) {
				session.setAttribute("succMsg","Book Update Successfully...");
				resp.sendRedirect("admin/all_books.jsp");
			}
			else {
				session.setAttribute("failedMsg","Somthing Wrong on Server...");
				resp.sendRedirect("admin/all_books.jsp");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	
}
