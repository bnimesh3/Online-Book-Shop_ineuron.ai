package com.dao;

import java.util.List;

import com.entity.Cart;

public interface CartDAO {
	
	public boolean addCart(Cart c);
	
	public List<Cart> getBookbyUser(int userId); 
	
	public boolean deleteBook(int bid,int uid, int cid);
}
