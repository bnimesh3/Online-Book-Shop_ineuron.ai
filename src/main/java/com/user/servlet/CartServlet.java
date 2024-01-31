package com.user.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.BookDaoImpl;
import com.dao.CartDaoImpl;
import com.db.DBConnect;
import com.entity.BookDetails;
import com.entity.Cart;
@WebServlet("/cart")
public class CartServlet extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		try {
		int bId=Integer.parseInt(req.getParameter("bId") );
			int uId=Integer.parseInt(req.getParameter("userId")); 
			
			BookDaoImpl dao=new BookDaoImpl(DBConnect.getConn());
			BookDetails b=dao.getBookById( bId);
			
			Cart c=new Cart();
			
			c.setbId(bId);
			c.setUserId(uId);
			c.setBookName(b.getBookName());
			c.setAuthor(b.getAuthor());
			c.setBprice(Double.parseDouble(b.getPrice()));
			c.setTotalPrice(Double.parseDouble(b.getPrice()));
			 
			CartDaoImpl dao2=new CartDaoImpl(DBConnect.getConn());
			boolean f=dao2.addCart(c);
			
			HttpSession session=req.getSession();
			
			if(f) {
				session.setAttribute("addCart", "Book Added to Cart");
				resp.sendRedirect("all_new_books.jsp");
				System.out.println("Add Cart Success...");
			}
			else {
				session.setAttribute("failed", "Something Wrong in Server");
				resp.sendRedirect("all_new_books.jsp");
				System.out.println("Not Added to Cart...");
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	
}
