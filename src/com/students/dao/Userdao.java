package com.students.dao;
import java.sql.Connection;
import java.sql.ResultSet;

import com.students.util.*;

import java.sql.PreparedStatement;

import javax.security.auth.message.callback.PrivateKeyCallback.Request;

public  class Userdao {
	public static boolean isuser(User a) throws Exception{  //�û���Ϣ��֤
		String username = a.getUsername();    //�û���
		String password = a.getPassword();    //����

				
		Connection conn = null;
		PreparedStatement ptmt = null;
		ResultSet rs = null;
		conn = DBHelper.getConnection();    //��ȡ���ݿ�ʵ��
		String sql = "select * from user"+ " where username='"+username+"'"; // SQL���
		ptmt = conn.prepareStatement(sql);
		rs=ptmt.executeQuery();          //ִ��SQL���
		while(rs.next()){
			// ��֤
			if(rs.getString("username").equals(username)){     
				
				if(rs.getString("password").equals(password)){
					
					return true;
				}
			}
			
		}
		return false;
	}
	
	
	
	
  
}
  
