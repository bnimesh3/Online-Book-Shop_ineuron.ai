package com.dao;

import java.util.List;

import com.entity.BookDetails;

public interface BookDao {
	public boolean addBooks(BookDetails b);
	
	public List<BookDetails> getAllBooks();
	
	public BookDetails getBookById(int id);
	
	public boolean updateEditBook(BookDetails b);
	
	public boolean deleteBook(int id);
	
	public List<BookDetails> getNewBooks();
	
	public List<BookDetails> getResentBooks();
	
	public List<BookDetails> getOldBooks();
	
	public List<BookDetails> getAllRecentBooks();
	
	public List<BookDetails> getAllOldtBooks();
	
	public List<BookDetails> getAllNewBooks();

	public List<BookDetails> getBookByOld(String email, String category);
	
	public boolean oldBookDelete(String email, String category, int id);
	
	public List<BookDetails> getBookBySearch(String ch);
	}
