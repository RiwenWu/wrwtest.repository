package my_javaBean;

import java.beans.Statement;
import java.sql.*;

public class DBUtil {
	boolean bInited = false;//加载驱动
	public void initJDBC() throws ClassNotFoundException{//加载MYSQL jdbc驱动程序
		Class.forName("com.mysql.jdbc.Driver");
		bInited = true;
		System.out.println("================ 成功加载驱动程序 ===============");
	}
	
	public Connection getConnection() throws ClassNotFoundException,SQLException {
		if (!bInited) {
			initJDBC();
		}
		//连接URL为 jdbc:mysql//服务器地址/数据库名
		//后面的2个参数分别是登陆用户名和密码
		Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3308/try","root","249991189");
		return conn;
	}
	
	public boolean loginSuccess(String userName,String password) {
		boolean returnValue = false;
		String sql = "select adminPswd,adminName from admin_tb";
		Connection conn = null;
		java.sql.Statement stmt = null;
		ResultSet rs = null;
		
		try{
			conn = getConnection();
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			while(rs.next()){
				String userNameInDB = rs.getString("adminName");
				String passwordInDB = rs.getString("adminPswd");
				if(userNameInDB.equals(userName) &&passwordInDB.equals(password)){
					returnValue = true;
					break;
				}
			}
		}catch (ClassNotFoundException e) {
			e.printStackTrace();
		}catch (SQLException e) {
			e.printStackTrace();
		}

		return returnValue;
	}
	
	public boolean registerSuccess(String userName,String password){
		boolean returnValue = false;
		String sql = "insert into admin_tb values('"+password+"','"+userName+"');";
		Connection conn = null;
		java.sql.Statement stmt = null;
		int count = 0;	
		try{
			conn = getConnection();
			stmt = conn.createStatement();
			count = stmt.executeUpdate(sql);
			if(count>0) 
				returnValue = true;
		}catch (ClassNotFoundException e) {
			e.printStackTrace();
		}catch (SQLException e) {
			e.printStackTrace();
		}
		return returnValue;
		
	}

}
