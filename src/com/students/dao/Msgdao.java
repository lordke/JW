package com.students.dao;
import com.students.util.*;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import com.students.dao.*;
import com.students.util.*;


public class Msgdao {
	public static void Msgsave(Msg a,int postid) throws Exception{
		Connection conn = null;
		PreparedStatement ptmt = null;
		conn = DBHelper.getConnection();
		
		String sql=" INSERT INTO msg(author,message,fornum) VALUES(?,?,?); ";
		ptmt = conn.prepareStatement(sql);
		ptmt.setString(1, a.getAuthor());	
		ptmt.setString(2, a.getMessage());
		ptmt.setInt(3, postid);
		ptmt.execute();
		
		
	}
}
