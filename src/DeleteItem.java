

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class updateVerify
 */
@WebServlet("/DeleteItem")
public class DeleteItem extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteItem() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	//protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
	//}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//doGet(request, response);
		
		    int itemid = Integer.parseInt(request.getParameter("id")); 
			String type = request.getParameter("type");
			Connection con = null;
			PreparedStatement stmt = null;
			if(type.equalsIgnoreCase("delete")) {
				try {
					Class.forName("com.mysql.jdbc.Driver");
					con = (Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/foodwaste","root","Nazone12");
					stmt = con.prepareStatement("DELETE FROM item where ITEMID = "+itemid);
					stmt.setInt(1, itemid);
					int i = stmt.executeUpdate();
					if (i > 0) {
						RequestDispatcher rd = getServletContext().getRequestDispatcher("/homepage.jsp");
						PrintWriter out = response.getWriter();
						out.println("<font color=red>Successful delete the Item.</font>");
						rd.include(request, response);
					}
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		}
	}


