package com.dao;

import com.entity.User;

public interface UserDao {
	
	public boolean userRegister(User us);
	
	public User login(String email, String password);
	
	public boolean checkPassword(int id,String password );
	
	public boolean updateProfile(User user);
	
	public boolean checkUser(String email);
}
