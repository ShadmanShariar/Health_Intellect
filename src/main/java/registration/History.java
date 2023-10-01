package registration;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.ServletRequest;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

/**
 * Servlet implementation class History
 */
@WebServlet("/info2")
public class History extends HttpServlet {

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		// inheritance for servlet 
		// for passing the parameter with the registration-html
		String uname = request.getParameter("uname");
		String uhis  = request.getParameter("disease");
		
		RequestDispatcher dispatcher = null;
		Connection con = null;
		
		

		// Database connection
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
            con = DriverManager.getConnection(
                    "jdbc:mysql://localhost:3306/loginreg", "root", "root");
			// Inserting Columns S
            PreparedStatement pst = con.prepareStatement("insert into his(uname, uhis) values (?,?)");
			// varchar
			pst.setString(1, uname);
			pst.setString(2, uhis);
 
			
			//check record is inserted 
			int rowCount = pst.executeUpdate();
			dispatcher  = request.getRequestDispatcher("get_suggestions.jsp");
					
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
