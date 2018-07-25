package config;

import java.io.FileInputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.util.Properties;

public class DB {
	//static : 인스턴스를 만들지 않고 호출 가능
	
	public static Connection hrConn(){
		Connection conn=null;
		try {
			FileInputStream fis=
					new FileInputStream("C:\\Users\\bok\\Desktop\\java_tutorials\\hr.prop");
			//key와 value를 세트로 저장
			Properties prop=new Properties();
			prop.load(fis);
			String url=prop.getProperty("url");
			String id=prop.getProperty("id");
			String password=prop.getProperty("password");
			//mysql에 접속
			conn=DriverManager.getConnection(url,id,password);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return conn;		
	}
	
	//oracle 접속 method
	public static Connection oraConn(){
		Connection conn=null;
		try {
			FileInputStream fis=
					new FileInputStream("C:\\Users\\bok\\Desktop\\java_tutorials\\oracle.prop");
			//key와 value를 세트로 저장
			Properties prop=new Properties();
			prop.load(fis);
			String url=prop.getProperty("url");
			String id=prop.getProperty("id");
			String password=prop.getProperty("password");
			//mysql에 접속
			conn=DriverManager.getConnection(url,id,password);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return conn;
	}
	
	//mysql 접속
	public static Connection dbConn(){
		Connection conn=null;
		try {
			FileInputStream fis=
					new FileInputStream("C:\\Users\\bok\\Desktop\\java_tutorials\\db.prop");
			//key와 value를 세트로 저장
			Properties prop=new Properties();
			prop.load(fis);
			String url=prop.getProperty("url");
			String id=prop.getProperty("id");
			String password=prop.getProperty("password");
			//mysql에 접속
			conn=DriverManager.getConnection(url,id,password);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return conn;
	}
}




