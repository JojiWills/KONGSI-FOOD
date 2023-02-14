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

@WebServlet("/UpdateItem")
public class UpdateItem extends HttpServlet {
  private static final long serialVersionUID = 1L;
  
  public UpdateItem() {
      super();
  }
  
  protected void doPost(HttpServletRequest request, HttpServletResponse response) 
      throws ServletException, IOException {
	  
	  response.setContentType("text/html");
	  PrintWriter out = response.getWriter();
	  
    // Get updated user information from request
	int itemid = Integer.parseInt(request.getParameter("id")); 
    String itemName = request.getParameter("name");
    String itemExp = request.getParameter("date");
    int itemTotal = Integer.parseInt(request.getParameter("quantity"));
    String type = request.getParameter("type");
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
		
		PreparedStatement ps = con.prepareStatement("update item set ITEMNAME=?, ITEM_EXP=?, ITEM_TOTAL=?, ITEM_TYPE=? WHERE ITEMID = "+itemid);
		
		ps.setString(1,itemName);
		ps.setString(2,itemExp);
		ps.setInt(3,itemTotal);
		ps.setString(4,type);
		//ps.setBlob(5, inputStream);
		
		int i = ps.executeUpdate();
		if(i>0) {
			RequestDispatcher rd = getServletContext().getRequestDispatcher("/myItem.jsp");
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
