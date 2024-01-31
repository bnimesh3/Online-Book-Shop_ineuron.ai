package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.entity.BookDetails;

public class BookDaoImpl implements BookDao{

	private Connection conn;
	
	
	public BookDaoImpl(Connection conn) {
		super();
		this.conn = conn;
	}


	@Override
	public boolean addBooks(BookDetails b) {
		boolean f=false;
		try {
			String sql="insert into book_dtls(bookName, author, price, bookCategory, ststus, photo, userEmail) values(?,?,?,?,?,?,?)";
			PreparedStatement ps= conn.prepareStatement(sql);
			ps.setString(1, b.getBookName());
			ps.setString(2, b.getAuthor());
			ps.setString(3, b.getPrice());
			ps.setString(4, b.getBookCategory());
			ps.setString(5, b.getStatus());
			ps.setString(6, b.getPhotoName());
			ps.setString(7, b.getUserEmail()); 
			
			int i=ps.executeUpdate();
			
			if(i == 1) {
				f=true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return f;
	}


	@Override
	public List<BookDetails> getAllBooks() {
		List<BookDetails> list=new ArrayList<BookDetails>();
		BookDetails b=null;
		try {
			String sql="select * from book_dtls";
			PreparedStatement ps=conn.prepareStatement(sql);
			
			ResultSet rs=ps.executeQuery();
			
			while(rs.next()){
				b=new BookDetails();
				b.setBookId(rs.getInt(1));
				b.setBookName(rs.getString(2));
				b.setAuthor(rs.getString(3));
				b.setPrice(rs.getString(4));
				b.setBookCategory(rs.getString(5));
				b.setStatus(rs.getString(6));
				b.setPhotoName(rs.getString(7));
				b.setUserEmail(rs.getString(8));
				list.add(b);
				
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}


	@Override
	public BookDetails getBookById(int bId) {

		BookDetails b=null;
		try {
			String sql="select * from book_dtls where bookId=?";
			PreparedStatement ps=conn.prepareStatement(sql); 
			ps.setInt(1, bId);
			ResultSet rs=ps.executeQuery();
			
			while(rs.next())
			{
				b=new BookDetails();
				b.setBookId(rs.getInt(1));
				b.setBookName(rs.getString(2));
				b.setAuthor(rs.getString(3));
				b.setPrice(rs.getString(4));
				b.setBookCategory(rs.getString(5));
				b.setStatus(rs.getString(6));
				b.setPhotoName(rs.getString(7));
				b.setUserEmail(rs.getString(8));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return b;
	}


	@Override
	public boolean updateEditBook(BookDetails b) {
		boolean f=false;
		try {
			String sql="update book_dtls set bookName=?, author=?, price=?, ststus=? where bookId=?";
			PreparedStatement ps=conn.prepareStatement(sql);
			
			ps.setString(1, b.getBookName());
			ps.setString(2, b.getAuthor());
			ps.setString(3, b.getPrice());
			ps.setString(4, b.getStatus());
			ps.setInt(5, b.getBookId());
			
			int i=ps.executeUpdate();
			if(i==1) {
				f=true;
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return f ;
	}


	@Override
	public boolean deleteBook(int id) {
		boolean f=false;
		try {
			String sql="delete  from book_dtls where bookId=?";
			PreparedStatement ps=conn.prepareStatement(sql);
			ps.setInt(1, id);
			
			int i=ps.executeUpdate();
			
			if(i==1) {
				f=true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return f;
	}


	@Override
	public List<BookDetails> getNewBooks() {
		List<BookDetails> list=new ArrayList<BookDetails>();
		BookDetails b=null;
		try {
			String sql="select * from book_dtls where bookCategory=? and ststus=? order by bookId DESC";
			PreparedStatement ps=conn.prepareStatement(sql);
			ps.setString(1, "New");
			ps.setString(2, "Active");
			
			ResultSet rs=ps.executeQuery();
			
			int i=1;
			while(rs.next() && i<=4) {
				 b=new BookDetails();
				b.setBookId(rs.getInt(1));
				b.setBookName(rs.getString(2));
				b.setAuthor(rs.getString(3));
				b.setPrice(rs.getString(4));
				b.setBookCategory(rs.getString(5));
				b.setStatus(rs.getString(6));
				b.setPhotoName(rs.getString(7));
				b.setUserEmail(rs.getString(8));
				list.add(b);
				i++;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}


	@Override
	public List<BookDetails> getResentBooks() {
		List<BookDetails> list2=new ArrayList<BookDetails>();
		BookDetails b1=null;
		try {
			String sql2="select * from book_dtls where ststus=? order by bookId DESC";
			PreparedStatement ps=conn.prepareStatement(sql2);
			ps.setString(1, "Active");
			
			ResultSet rs=ps.executeQuery();
			
			int i=1;
			while(rs.next() && i<=4) {
				 b1=new BookDetails();
				b1.setBookId(rs.getInt(1));
				b1.setBookName(rs.getString(2));
				b1.setAuthor(rs.getString(3));
				b1.setPrice(rs.getString(4));
				b1.setBookCategory(rs.getString(5));
				b1.setStatus(rs.getString(6));
				b1.setPhotoName(rs.getString(7));
				b1.setUserEmail(rs.getString(8));
				list2.add(b1);
				i++;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list2;
	}


	@Override
	public List<BookDetails> getOldBooks() {
		List<BookDetails> list3=new ArrayList<BookDetails>();
		BookDetails b1=null;
		try {
			String sql2="select * from book_dtls where bookCategory=? and ststus=? order by bookId DESC";
			PreparedStatement ps=conn.prepareStatement(sql2);
			ps.setString(1, "Old");
			ps.setString(2, "Active");
			
			ResultSet rs=ps.executeQuery();
			
			int i=1;
			while(rs.next() && i<=4) {
				 b1=new BookDetails();
				b1.setBookId(rs.getInt(1));
				b1.setBookName(rs.getString(2));
				b1.setAuthor(rs.getString(3));
				b1.setPrice(rs.getString(4));
				b1.setBookCategory(rs.getString(5));
				b1.setStatus(rs.getString(6));
				b1.setPhotoName(rs.getString(7));
				b1.setUserEmail(rs.getString(8));
				list3.add(b1);
				i++;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list3;
	}


	@Override
	public List<BookDetails> getAllRecentBooks() {
		List<BookDetails> list2=new ArrayList<BookDetails>();
		BookDetails b1=null;
		try {
			String sql2="select * from book_dtls where ststus=? order by bookId DESC";
			PreparedStatement ps=conn.prepareStatement(sql2);
			ps.setString(1, "Active");
			
			ResultSet rs=ps.executeQuery();
			
			while(rs.next()) {
				 b1=new BookDetails();
				b1.setBookId(rs.getInt(1));
				b1.setBookName(rs.getString(2));
				b1.setAuthor(rs.getString(3));
				b1.setPrice(rs.getString(4));
				b1.setBookCategory(rs.getString(5));
				b1.setStatus(rs.getString(6));
				b1.setPhotoName(rs.getString(7));
				b1.setUserEmail(rs.getString(8));
				list2.add(b1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list2;
	}


	@Override
	public List<BookDetails> getAllOldtBooks() {
		List<BookDetails> list3=new ArrayList<BookDetails>();
		BookDetails b1=null;
		try {
			String sql2="select * from book_dtls where bookCategory=? and ststus=? order by bookId DESC";
			PreparedStatement ps=conn.prepareStatement(sql2);
			ps.setString(1, "Old");
			ps.setString(2, "Active");
			
			ResultSet rs=ps.executeQuery();
			
			while(rs.next() ) {
				 b1=new BookDetails();
				b1.setBookId(rs.getInt(1));
				b1.setBookName(rs.getString(2));
				b1.setAuthor(rs.getString(3));
				b1.setPrice(rs.getString(4));
				b1.setBookCategory(rs.getString(5));
				b1.setStatus(rs.getString(6));
				b1.setPhotoName(rs.getString(7));
				b1.setUserEmail(rs.getString(8));
				list3.add(b1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list3;
	}

	@Override
	public List<BookDetails> getAllNewBooks() {
		List<BookDetails> list=new ArrayList<BookDetails>();
		BookDetails b=null;
		try {
			String sql="select * from book_dtls where bookCategory=? and ststus=? order by bookId DESC";
			PreparedStatement ps=conn.prepareStatement(sql);
			ps.setString(1, "New");
			ps.setString(2, "Active");
			
			ResultSet rs=ps.executeQuery();
			
			
			while(rs.next()) {
				 b=new BookDetails();
				b.setBookId(rs.getInt(1));
				b.setBookName(rs.getString(2));
				b.setAuthor(rs.getString(3));
				b.setPrice(rs.getString(4));
				b.setBookCategory(rs.getString(5));
				b.setStatus(rs.getString(6));
				b.setPhotoName(rs.getString(7));
				b.setUserEmail(rs.getString(8));
				list.add(b);
				
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}


	@Override
	public List<BookDetails> getBookByOld(String email, String category) {
		List<BookDetails> list=new ArrayList<BookDetails>();
		BookDetails b=null;
		try {
			String sql="select * from book_dtls where bookCategory=? and userEmail=?";
			PreparedStatement ps=conn.prepareStatement(sql);
			ps.setString(1, category);
			ps.setString(2, email);
			
			ResultSet rs=ps.executeQuery();
			while(rs.next()) {
				b=new BookDetails();
				b.setBookId(rs.getInt(1));
				b.setAuthor(rs.getString(3));
				b.setBookName(rs.getString(2));
				b.setPrice(rs.getString(4));
				b.setBookCategory(rs.getString(5));
				b.setStatus(rs.getString(6));
				b.setPhotoName(rs.getString(7));
				b.setUserEmail(rs.getString(8));
				list.add(b);
				
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}


	@Override
	public boolean oldBookDelete(String email, String category, int id) {
		boolean f=false;
		try {
			String sql="delete from book_dtls where bookCategory=? and userEmail=? and bookId=?";
			PreparedStatement ps=conn.prepareStatement(sql);
			ps.setString(2, category);
			ps.setString(1, email);
			ps.setInt(3, id);
			
			int i=ps.executeUpdate();
			if(i==1) {
				f=true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return f;
	}


	@Override
	public List<BookDetails> getBookBySearch(String ch) {
		List<BookDetails> list=new ArrayList<BookDetails>();
		BookDetails b=null;
		try {
			String sql="select * from book_dtls where bookName like ? or author like ? or bookCategory like ? and ststus=?";
			PreparedStatement ps=conn.prepareStatement(sql);
			ps.setString(1, "%"+ch+"%");
			ps.setString(2, "%"+ch+"%");
			ps.setString(3, "%"+ch+"%");
			ps.setString(4, "Active");
			
			ResultSet rs=ps.executeQuery();
			while(rs.next()) {
				b=new BookDetails();
				b.setBookId(rs.getInt(1));
				b.setAuthor(rs.getString(3));
				b.setBookName(rs.getString(2));
				b.setPrice(rs.getString(4));
				b.setBookCategory(rs.getString(5));
				b.setStatus(rs.getString(6));
				b.setPhotoName(rs.getString(7));
				b.setUserEmail(rs.getString(8));
				list.add(b);
				
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}


	

}
