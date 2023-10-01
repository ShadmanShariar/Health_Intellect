package registration;

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
 * Servlet implementation class get_suggestions
 */
@WebServlet("/info")
public class provide_information extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		// inheritance for servlet 
		// for passing the parameter with the registration-html
		String udisease = request.getParameter("disease");
		String usymptoms = request.getParameter("symptoms");
		String umedicine = request.getParameter("medicine");
		String uaccuracy = request.getParameter("accuracy");
		String uage = request.getParameter("age");
		String ugender = request.getParameter("gender");
		RequestDispatcher dispatcher = null;
		Connection con = null;
		
		

		// Database connection
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
            con = DriverManager.getConnection(
                    "jdbc:mysql://localhost:3306/loginreg", "root", "root");
            
			// Inserting Columns S
			PreparedStatement pst = con.prepareStatement("insert into datas(udisease, usymptoms, umedicine, uaccuracy, uage, ugender) values (?,?,?,?,?,?)");
			// varchar
			pst.setString(1, udisease);
			pst.setString(2, usymptoms);
			pst.setString(3, umedicine);
			pst.setString(4, uaccuracy);
			pst.setString(5, uage);  
			pst.setString(6, ugender);  
			
			//check record is inserted 
			int rowCount = pst.executeUpdate();
			dispatcher  = request.getRequestDispatcher("information.jsp");
					
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
