package com.dao;

import java.util.List;

import com.entity.BookOrder;

public interface BookOrderDao {
	
	public boolean saveOrder(List<BookOrder> bookOrderList);
		
	public List<BookOrder> getBook(String email);
	
	public List<BookOrder> getBook();
}
