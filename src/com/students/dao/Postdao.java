package com.students.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import com.students.util.*;



public class Postdao {
	public static ArrayList<Posts> getposts(){  //获取全部通知
		Connection conn = null;
		PreparedStatement ptmt = null;
		ResultSet rs = null;
		ArrayList<Posts> list = new ArrayList<Posts>();  //返回ArrayList其中为posts对象
		try {
			conn = DBHelper.getConnection();
			String sql = "select * from posts order by id desc;"; // SQL语句
			ptmt = conn.prepareStatement(sql);
			
			rs = ptmt.executeQuery();
			while (rs.next()){  //遍历游标，将通知内容封装为posts类
				Posts posts = new Posts();
				posts.setId(rs.getInt("id"));
				posts.setTitle(rs.getString("title"));
				posts.setAuthor(rs.getString("author"));
				posts.setPost(rs.getString("post"));
			
				list.add(posts);
			} 
			return list;
		}
		 catch (Exception ex) {
				ex.printStackTrace();
				return null;
			} 
		finally {
				// 释放数据集对象
				if (rs != null) {
					try {
						rs.close();
						rs = null;
					} catch (Exception ex) {
						ex.printStackTrace();
					}
				}
				// 释放语句对象
				if (ptmt != null) {
					try {
						ptmt.close();
						ptmt = null;
					} catch (Exception ex) {
						ex.printStackTrace();
					}
				}
			}
		
		
}	
	public static Posts getpost(int id){  //返回单个通知内容及其中留言内容
		Connection conn = null;
		PreparedStatement ptmt = null;
		PreparedStatement ptmt2 = null;
		ResultSet rs = null;
		ResultSet rs2 = null;
		ArrayList<Msg> msgs=new ArrayList<Msg>();
		try {
			conn = DBHelper.getConnection();
			String sql = "select * from posts where id=?;"; // SQL语句 获得通知
			String sql2 = "select * from msg where fornum=?;"; // SQL语句 获得留言
			ptmt = conn.prepareStatement(sql);
			ptmt2=conn.prepareStatement(sql2);
			ptmt.setInt(1, id);
			ptmt2.setInt(1, id);
			rs = ptmt.executeQuery();
			rs2 = ptmt2.executeQuery();
			// 遍历游标 将内容封装为posts类
			while (rs2.next()){
				Msg msg = new Msg();
				msg.setAuthor(rs2.getString("author"));
				msg.setMessage(rs2.getString("message"));
				msgs.add(msg);
			} 
			
			if (rs.next()) {
				Posts post= new Posts();
				System.out.println("rs.getString(\"title\")"+rs.getString("title"));
				post.setId(rs.getInt("id"));
				post.setTitle(rs.getString("title"));
				post.setAuthor(rs.getString("author"));
				post.setPost(rs.getString("post"));
				post.setMsgs(msgs);
				return post;
			} else {
				return null;
			}


		} catch (Exception ex) {
			ex.printStackTrace();
			return null;
		} finally {
			// 释放数据集对象
			if (rs != null) {
				try {
					rs.close();
					rs = null;
				} catch (Exception ex) {
					ex.printStackTrace();
				}
			}
			// 释放语句对象
			if (ptmt != null) {
				try {
					ptmt.close();
					ptmt = null;
				} catch (Exception ex) {
					ex.printStackTrace();
				}
			}

		}
			
		}
	public static void postsave(Posts a) throws Exception{  //实现存储通知的功能
		Connection conn = null;
		PreparedStatement ptmt = null;
		conn = DBHelper.getConnection();
		String sql = "INSERT INTO posts(title,author,post) values(?,?,?);"; //SQL语句
		ptmt =conn.prepareStatement(sql);
		ptmt.setString(1, a.getTitle());
		ptmt.setString(2,a.getAuthor());
		ptmt.setString(3, a.getPost());
		ptmt.execute();
		
	}
	
}
