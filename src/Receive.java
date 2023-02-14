

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

/**
 * Servlet implementation class Receive
 */
@WebServlet("/Receive")
public class Receive extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Receive() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	/*protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//doGet(request, response);
		
		
		int d = Integer.parseInt(request.getParameter("d"));
		//String type = request.getParameter("type");
		Connection con = null;
		PreparedStatement stmt = null;
		
		try {
			Class.forName("com.mysql.jdbc.Driver");
			con = (Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/foodwaste","root","Nazone12");
			stmt = con.prepareStatement("insert into transaction (itemid, user_id,trans_date) values(?,?,NOW())");
			stmt.setInt(1, d);
			//update session later
			stmt.setInt(2, 1);
			int i = stmt.executeUpdate();
			if (i > 0) {
				stmt = con.prepareStatement("UPDATE item SET isAvailable = 0 WHERE itemid=?");
				stmt.setInt(1, d);
				int x = stmt.executeUpdate();
				if(x > 0) {
					request.setAttribute("itemid",d);
				RequestDispatcher rd = getServletContext().getRequestDispatcher("/successreceive.jsp");
				PrintWriter out = response.getWriter();
				out.println("<font color=red>Receive Successfully</font>");
				rd.include(request, response);
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}

}
