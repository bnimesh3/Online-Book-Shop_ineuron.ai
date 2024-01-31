package com.user.servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Random;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.jsp.tagext.TryCatchFinally;

import com.dao.BookDaoImpl;
import com.dao.BookOrderDaoIMPL;
import com.dao.CartDaoImpl;
import com.db.DBConnect;
import com.entity.BookOrder;
import com.entity.Cart;

@WebServlet("/order")
public class OrderServlet extends HttpServlet{

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			HttpSession session=req.getSession();
			
			int id=Integer.parseInt(req.getParameter("id"));
			String name=req.getParameter("userName");
			String email=req.getParameter("email");
			String phno=req.getParameter("phone");
			String address=req.getParameter("address");
			String landmark=req.getParameter("landmark");
			String city=req.getParameter("city");
			String state=req.getParameter("state");
			String pincode=req.getParameter("pin");
			String paymentType=req.getParameter("paymentType");
			
			String fullAddress=address+","+landmark+","+city+","+state+","+pincode;
			
			//System.out.println(name+" "+email+" "+phno+" "+fullAddress+" "+paymentType);
			
			CartDaoImpl dao=new CartDaoImpl(DBConnect.getConn());
			
			List<Cart> blist=dao.getBookbyUser(id);
			
			if(blist.isEmpty()) {
				session.setAttribute("failedMsg", "Add Item");
				resp.sendRedirect("checkout.jsp");
			}
			else {
				BookOrderDaoIMPL dao2=new BookOrderDaoIMPL(DBConnect.getConn());
				
				BookOrder o=null;
				ArrayList<BookOrder> orderList=new ArrayList<BookOrder>();
				Random r=new Random();
				
				for(Cart c:blist ) {
					System.out.println(c.getBookName());
					o=new BookOrder();
					o.setOrder_id("BOOK-ORD-00"+r.nextInt(100));
					o.setUserName(name);
					o.setEmail(email);
					o.setPhno(phno);
					o.setFullAdd(fullAddress);
					o.setBookName(c.getBookName());
					o.setAuthor(c.getAuthor());
					o.setPrice(c.getBprice()+"");
					o.setPaymentType(paymentType);
					orderList.add(o);
					
				}
				if("noSelect".equals(paymentType)) {
					session.setAttribute("failedMsg", "Choose Payment Method");
					resp.sendRedirect("checkout.jsp");
					
				}
				else {
					boolean f=dao2.saveOrder(orderList);
					if(f) {
						System.out.println("Order Success");
						session.setAttribute("succMsg", "Order Placed");
						resp.sendRedirect("orderSuccess.jsp");
					}
					else {
						System.out.println("Order Failed");
						session.setAttribute("failedMsg", "Order Failed");
						resp.sendRedirect("checkout.jsp");
					}
				}
			}
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	
}
