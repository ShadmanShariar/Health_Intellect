package registration;

import jakarta.servlet.RequestDispatcher;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

@WebServlet("/login")
public class login extends HttpServlet {
    private static final long serialVersionUID = 1L;
    
    

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	
    	String uemail= request.getParameter("username");
    	String upwd= request.getParameter("password");
    	HttpSession session = request.getSession();
    	
    	RequestDispatcher dispatcher = null;
    	
    	
    	//Database
    	try {
    		
    		Class.forName("com.mysql.cj.jdbc.Driver");
    		
    		Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/loginreg?useSSL=false","root","root");
    		PreparedStatement pst = con.prepareStatement("select * from users where uemail= ? and upwd= ?");
    		
    		pst.setString(1, uemail);
    		pst.setString(2, upwd);
    		
    		ResultSet rs = pst.executeQuery();
    		if(rs.next()){
    			
    			session.setAttribute("name", rs.getString("uname"));
    			dispatcher = request.getRequestDispatcher("index.jsp");
    		}else {
    			request.setAttribute("status", "failed");
    			dispatcher = request.getRequestDispatcher("login.jsp");
    		}    
    		dispatcher.forward(request, response);
    	}catch(Exception e){
    		e.printStackTrace();    		
    	}
    	
    }
}
