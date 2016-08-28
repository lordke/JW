package com.students.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;



import java.sql.SQLException;

import com.students.util.*;
import com.students.dao.*;

public class Studentdao {
	public static Student squery(String query) throws Exception{  // µœ÷≤Ëœ¥
		Connection conn = null;
		PreparedStatement ptmt = null;
		ResultSet rs = null;
		
		conn = DBHelper.getConnection();
		String  sql ="select * from students where "+query+";";
		System.out.println(sql);
		ptmt = conn.prepareStatement(sql);
		rs = ptmt.executeQuery();
		if (rs.next()) {
			Student a =new Student();
			a.setId(rs.getDouble("id"));
			a.setName(rs.getString("name"));
			a.setSex(rs.getString("sex"));
			a.setClasses(rs.getDouble("classes"));
			a.setCollage(rs.getString("collage"));
			return a;
			
		}
		else return null;
	}
	
	public static void update(Student a) throws Exception{
		Connection conn = null;
		PreparedStatement ptmt = null;
		conn=DBHelper.getConnection();
		String sql ="update students set id =?,name=?,sex=?,classes=?,collage=? where id =?";
		ptmt=conn.prepareStatement(sql);
		ptmt.setDouble(1, a.getId());
		ptmt.setString(2, a.getName());
		ptmt.setString(3, a.getSex());
		ptmt.setDouble(4, a.getClasses());
		ptmt.setString(5, a.getCollage());
		ptmt.setDouble(6, a.getId());
		ptmt.execute();
		
	}
	
	public static void creatnew(Student a) throws Exception{
		Connection conn = null;
		PreparedStatement ptmt = null;
		conn=DBHelper.getConnection();
		String sql="insert into students values(?,?,?,?,?)";
		ptmt=conn.prepareStatement(sql);
		ptmt.setDouble(1, a.getId());
		ptmt.setString(2, a.getName());
		ptmt.setString(3,a.getSex());
		ptmt.setDouble(4, a.getClasses());
		ptmt.setString(5, a.getCollage());
		ptmt.execute();
	}
	
	public static void deleteone(double id) throws Exception{
		Connection conn = null;
		PreparedStatement ptmt = null;
		conn=DBHelper.getConnection();
		String sql= "delete from students where id=?";
		ptmt = conn.prepareStatement(sql);
		ptmt.setDouble(1, id);
		ptmt.execute();
		
	}

}
