import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.nio.file.Paths;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

@WebServlet("/profileUpdate")
public class profileUpdate extends HttpServlet {
  private static final long serialVersionUID = 1L;
  
  public profileUpdate() {
      super();
  }
  
  protected void doPost(HttpServletRequest request, HttpServletResponse response) 
      throws ServletException, IOException {
	  
	  response.setContentType("text/html");
	  PrintWriter out = response.getWriter();
	  
    // Get updated user information from request
	String fileName = null;
	String username = request.getParameter("username");
    String name = request.getParameter("name");
    String email = request.getParameter("email");
    String phone = request.getParameter("phone");
    String address = request.getParameter("address");
    //InputStream inputStream = null;
    //Part filePart = request.getPart("image");
    //if (filePart != null) {
        //inputStream = filePart.getInputStream();
      //  fileName = Paths.get(filePart.getSubmittedFileName()).getFileName().toString();
    //}
 // Update user information in database using JDBC or any other method
    try {
		Class.forName("com.mysql.jdbc.Driver");
		Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/foodwaste", "root", "Nazone12"); 
		
		PreparedStatement ps = con.prepareStatement("update user2 set name=?, email=?, phone=?, address=? WHERE USERNAME ='"+username+"' ");
		
		ps.setString(1,name);
		ps.setString(2,email);
		ps.setString(3,phone);
		ps.setString(4,address);
		//ps.setBlob(5, inputStream);
		
		int i = ps.executeUpdate();
		if(i>0) {
		RequestDispatcher rd = getServletContext().getRequestDispatcher("/profilePage.jsp");
		out = response.getWriter();
		rd.include(request, response);
		}
	}catch (Exception e2) {
		System.out.println(e2);
		
	}

    // Redirect user to success or error page
   // response.sendRedirect("update_success.jsp");
  }
}
