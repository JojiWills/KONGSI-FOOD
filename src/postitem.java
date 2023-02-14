
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.nio.file.Paths;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.Part;

/**
 * Servlet implementation class postitem
 */
@WebServlet("/postitem")
@MultipartConfig
public class postitem extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public postitem() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		 String username =null;
		 String userType = null;
		    Cookie[] cookies = request.getCookies();
		    if(cookies !=null){
		    for(Cookie cookie : cookies){
		    	if(cookie.getName().equals("user")) username = cookie.getValue();
		    	if(cookie.getName().equals("userType")) userType = cookie.getValue();
		    }}
		    if(username == null)response.sendRedirect("login.jsp");
		 
		
		
		 String fileName = null;
		 String name = request.getParameter("name");
		 String type = request.getParameter("type");
	     String date = request.getParameter("item_exp");
	     int qty = Integer.parseInt(request.getParameter("quantity"));
	     InputStream inputStream = null;
	        Part filePart = request.getPart("image");
	        if (filePart != null) {
	            inputStream = filePart.getInputStream();
	            fileName = Paths.get(filePart.getSubmittedFileName()).getFileName().toString();
	        }
	     
	     try {
				Class.forName("com.mysql.jdbc.Driver");
				Connection con = (Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/foodwaste","root","Nazone12");
				
				PreparedStatement ps = con.prepareStatement("insert into item (ITEMNAME,ITEM_EXP,ITEM_TOTAL,IMAGES,ITEM_TYPE,isAvailable,username) values(?,?,?,?,?,1,?)");
				
				ps.setString(1,name);
				ps.setString(2,date);
				ps.setLong(3,qty);
				ps.setBlob(4, inputStream);
				ps.setString(5, type);
				ps.setString(6, username);
				
				int i = ps.executeUpdate();
				if(i>0)
					 // Set the data to be passed to the JSP page
				    request.setAttribute("name", name);
					request.setAttribute("date", date);
					request.setAttribute("qty", qty);
					request.setAttribute("type", type);
					request.setAttribute("image", inputStream);

				    // Forward the request to the JSP page
				    request.getRequestDispatcher("/successpost.jsp").forward(request, response);
					
				
			}catch (Exception e2) {
				System.out.println(e2);
				
			}
	     
	}

}
