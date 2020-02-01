package creatHomePage;

import java.io.BufferedReader;
import java.io.Reader;
import java.sql.*;

public class Home {	
	
	public static int number;
	
	public int GetNumber() {
		int count=0;
		try {
			Connection con;
			Class.forName("com.mysql.jdbc.Driver");

			con= DriverManager.getConnection("jdbc:mysql://121.36.1.81:3306/newsweb?serverTimezone=GMT%2B8&useSSL=false", "ziran","123456");

			Statement st = con.createStatement();
			ResultSet rs = st.executeQuery(" select * from articles");
			
		    if(con != null){         
		        while (rs.next()) {
		        	count++;
		   		}  
		    }
		    else{  
		    	count=-1;
		    }  
 
		} catch (Exception e) {
			count=-1;
		}
		
		number=count;
		return number;
	}
	
}
