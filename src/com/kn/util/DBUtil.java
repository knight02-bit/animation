package com.kn.util;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBUtil {
	public static Connection getConnection() throws ClassNotFoundException{
		Connection conn = null;
		try{
			//��������
			Class.forName("com.mysql.cj.jdbc.Driver");
			
			//��ȡmysql���ݵ����Ӷ���
			String url = "jdbc:mysql://127.0.0.1:3306/dm?characterEncoding=utf8&serverTimezone=UTC";
			String name = "root";
			String pwd = "123456";
			conn = (Connection) DriverManager.getConnection(url, name, pwd);
		}catch(Exception e){
			e.printStackTrace();
		}
		
		return conn;
	}
}
