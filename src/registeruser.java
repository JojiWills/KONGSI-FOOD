
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mysql.jdbc.Connection;

/**
 * Servlet implementation class registeruser
 */
@WebServlet("/registeruser")
public class registeruser extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public registeruser() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//doGet(request, response);
		
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		
		String e = request.getParameter("Email");
		String n = request.getParameter("Name");
		String p = request.getParameter("Phone");
		String a = request.getParameter("Address");
		String u = request.getParameter("Username");
		String pw = request.getParameter("Password");
		String type = request.getParameter("type");
		
		
		if(type.equalsIgnoreCase("user")) {
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = (Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/foodwaste","root","Nazone12");
			
			PreparedStatement ps = con.prepareStatement("insert into user2(EMAIL,NAME,PHONE,ADDRESS,USERNAME,PASSWORD,isVerify) values(?,?,?,?,?,?,0)");
			
			ps.setString(1, e);
			ps.setString(2, n);
			ps.setString(3, p);
			ps.setString(4, a);
			ps.setString(5, u);
			ps.setString(6, pw);
			
			int i = ps.executeUpdate();
			if(i>0) {
				RequestDispatcher rd = getServletContext().getRequestDispatcher("/Login.jsp");
				out.println("<font color=white>Successful registered wait for verification from system.</font>");
				rd.include(request, response);
			}
			
		}catch (Exception e2) {
			System.out.println(e2);
			
		}

}else if(type.equalsIgnoreCase("admin")) {
	try {
		Class.forName("com.mysql.jdbc.Driver");
		Connection con = (Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/foodwaste","root","Nazone12");
		
		PreparedStatement ps = con.prepareStatement("insert into admin(EMAIL,NAME,PHONE,ADDRESS,USERNAME,PASSWORD) values(?,?,?,?,?,?)");
		
		ps.setString(1, e);
		ps.setString(2, n);
		ps.setString(3, p);
		ps.setString(4, a);
		ps.setString(5, u);
		ps.setString(6, pw);
		
		int i = ps.executeUpdate();
		if(i>0) {
			RequestDispatcher rd = getServletContext().getRequestDispatcher("/Login.jsp");
			rd.include(request, response);
		}
		
	}catch (Exception e2) {
		System.out.println(e2);
		
	}
}} 
	}
