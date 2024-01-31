package com.entity;

public class BookOrder {
	private int id;
	private String order_id;
	private String userName;
	private String email;
	private String phno;
	private String fullAdd;
	private String bookName;
	private String author;
	private String price;
	private String paymentType;
	
	public BookOrder(int id, String order_id, String userName, String email, String phno, String fullAdd, String bookName, String author, String price, String paymentType) {
		super();
		this.id = id;
		this.order_id = order_id;
		this.userName = userName;
		this.email = email;
		this.phno = phno;
		this.fullAdd = fullAdd;
		this.bookName = bookName;
		this.author = author;
		this.price = price;
		this.paymentType = paymentType;
	}

	public BookOrder() {
		
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getOrder_id() {
		return order_id;
	}

	public void setOrder_id(String order_id) {
		this.order_id = order_id;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPhno() {
		return phno;
	}

	public void setPhno(String phno) {
		this.phno = phno;
	}

	public String getFullAdd() {
		return fullAdd;
	}

	public void setFullAdd(String fullAdd) {
		this.fullAdd = fullAdd;
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

	public String getPrice() {
		return price;
	}

	public void setPrice(String price) {
		this.price = price;
	}

	public String getPaymentType() {
		return paymentType;
	}

	public void setPaymentType(String paymentType) {
		this.paymentType = paymentType;
	}

	@Override
	public String toString() {
		return "BookOrder [id=" + id + ", " + (order_id != null ? "order_id=" + order_id + ", " : "")
				+ (userName != null ? "userName=" + userName + ", " : "")
				+ (email != null ? "email=" + email + ", " : "") + (phno != null ? "phno=" + phno + ", " : "")
				+ (fullAdd != null ? "fullAdd=" + fullAdd + ", " : "")
				+ (bookName != null ? "bookName=" + bookName + ", " : "")
				+ (author != null ? "author=" + author + ", " : "") + (price != null ? "price=" + price + ", " : "")
				+ (paymentType != null ? "paymentType=" + paymentType + ", " : "") + "getId()=" + getId() + ", "
				+ (getOrder_id() != null ? "getOrder_id()=" + getOrder_id() + ", " : "")
				+ (getUserName() != null ? "getUserName()=" + getUserName() + ", " : "")
				+ (getEmail() != null ? "getEmail()=" + getEmail() + ", " : "")
				+ (getPhno() != null ? "getPhno()=" + getPhno() + ", " : "")
				+ (getFullAdd() != null ? "getFullAdd()=" + getFullAdd() + ", " : "")
				+ (getBookName() != null ? "getBookName()=" + getBookName() + ", " : "")
				+ (getAuthor() != null ? "getAuthor()=" + getAuthor() + ", " : "")
				+ (getPrice() != null ? "getPrice()=" + getPrice() + ", " : "")
				+ (getPaymentType() != null ? "getPaymentType()=" + getPaymentType() + ", " : "")
				+ (getClass() != null ? "getClass()=" + getClass() + ", " : "") + "hashCode()=" + hashCode() + ", "
				+ (super.toString() != null ? "toString()=" + super.toString() : "") + "]";
	}

	
}
