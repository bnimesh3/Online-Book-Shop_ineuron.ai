package com.entity;

public class Cart {
	private int cid;
	private int bId;
	private int userId;
	private String bookName;
	private String author;
	private Double bprice;
	private Double totalPrice;
	public Cart() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Cart(int bId, int userId, String bookName, String author, double bprice, double totalPrice) {
		super();
		this.bId = bId;
		this.userId = userId;
		this.bookName = bookName;
		this.author = author;
		this.bprice = bprice;
		this.totalPrice = totalPrice;
	}
	public int getCid() {
		return cid;
	}
	public void setCid(int cid) {
		this.cid = cid;
	}
	public int getbId() {
		return bId;
	}
	public void setbId(int bId) {
		this.bId = bId;
	}
	public int getUserId() {
		return userId;
	}
	public void setUserId(int userId) {
		this.userId = userId;
	}
	public String getBookName() {
		return bookName;
	}
	public void setBookName(String bookName) {
		this.bookName = bookName;
	}
	public String getAuthor() {
		return author;
	}
	public void setAuthor(String author) {
		this.author = author;
	}
	public Double getBprice() {
		return bprice;
	}
	public void setBprice(Double bprice) {
		this.bprice = bprice;
	}
	public Double getTotalPrice() {
		return totalPrice;
	}
	public void setTotalPrice(Double totalPrice) {
		this.totalPrice = totalPrice;
	}

}
