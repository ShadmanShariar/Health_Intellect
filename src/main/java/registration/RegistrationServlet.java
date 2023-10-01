package registration;

import jakarta.security.auth.message.callback.PrivateKeyCallback.Request;
import jakarta.servlet.RequestDispatcher;


import jakarta.servlet.ServletException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;



/**
 * Servlet implementation class RegistrationServlet
 */
@WebServlet("/register")
public class RegistrationServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
  
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		// inheritance for servlet 
		// for passing the parameter with the registration-html
		String uname = request.getParameter("name");
		String uemail = request.getParameter("email");
		String upwd = request.getParameter("pass");
		String umobile = request.getParameter("contact");
		RequestDispatcher dispatcher = null;
		Connection con = null;

		String repass = request.getParameter("re_pass");
		
        if(upwd.length()<8) {
        	dispatcher  = request.getRequestDispatcher("registration.jsp");
        	//response.sendRedirect("registration.jsp");
        	request.setAttribute("status", "failed1");
        	dispatcher.forward(request, response);}
        
        else if(umobile.length()!=11){
        	dispatcher  = request.getRequestDispatcher("registration.jsp");
        	request.setAttribute("status", "failed2");
        	//response.sendRedirect("registration.jsp");
        	dispatcher.forward(request, response);
        	}
        else if(!repass.equals(upwd)) {
        	dispatcher  = request.getRequestDispatcher("registration.jsp");
        	//response.sendRedirect("registration.jsp");
        	request.setAttribute("status", "failed3");
        	dispatcher.forward(request, response);}
       
        else {
		// Database connection
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			 con = DriverManager.getConnection("jdbc:mysql://localhost:3306/loginreg?allowPublicKeyRetrieval=true&useSSL=false","root","root");
			// Inserting Columns 
			PreparedStatement pst = con.prepareStatement("insert into users(uname, upwd, uemail, umobile) values (?,?,?,?)");
			// varchar
			pst.setString(1, uname);
			pst.setString(2, upwd);
			pst.setString(3, uemail);
			pst.setString(4, umobile);  
			
			//check record is inserted 
			int rowCount = pst.executeUpdate();
			dispatcher  = request.getRequestDispatcher("registration.jsp");
					
			if(rowCount > 0 ) {
				
				request.setAttribute("status", "success");
			}
				else {
					request.setAttribute("status", "failed");
				}
				
			
			dispatcher.forward(request, response);
		}catch (Exception e) {
			
			e.printStackTrace();
			
		}finally {
			try {
				con.close();			
			}catch(SQLException e) {
				e.printStackTrace();			
				}
			
		}
		
		}
	}

}
