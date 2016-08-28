package com.students.dao;
import java.sql.Connection;
import java.sql.ResultSet;

import com.students.util.*;

import java.sql.PreparedStatement;

import javax.security.auth.message.callback.PrivateKeyCallback.Request;

public  class Userdao {
	public static boolean isuser(User a) throws Exception{  //用户信息验证
		String username = a.getUsername();    //用户名
		String password = a.getPassword();    //密码

				
		Connection conn = null;
		PreparedStatement ptmt = null;
		ResultSet rs = null;
		conn = DBHelper.getConnection();    //获取数据库实例
		String sql = "select * from user"+ " where username='"+username+"'"; // SQL语句
		ptmt = conn.prepareStatement(sql);
		rs=ptmt.executeQuery();          //执行SQL语句
		while(rs.next()){
			// 验证
			if(rs.getString("username").equals(username)){     
				
				if(rs.getString("password").equals(password)){
					
					return true;
				}
			}
			
		}
		return false;
	}
	
	
	
	
  
}
  
