

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mysql.jdbc.Connection;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginServlet() {
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
		
		//get request parameters for username and password
		String user = request.getParameter("user");
		String pwd = request.getParameter("pwd");
		String type = request.getParameter("type");
		String password= "";
		int verify= 0;

		
		//retrieve data from database
		if(type.equalsIgnoreCase("user")) {
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = (Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/foodwaste", "root", "Nazone12");
			
			Statement stmt = con.createStatement();
			String sql = "SELECT PASSWORD,ISVERIFY FROM user2 WHERE username ='"+user+"'";
			ResultSet rs = stmt.executeQuery(sql);
			
			while(rs.next()) {
				password = rs.getString("PASSWORD");
				verify = rs.getInt("ISVERIFY");
			}
			
		}catch(Exception e2) {
			System.out.println(e2);}
		}else if(type.equalsIgnoreCase("admin")) {
			try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = (Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/foodwaste", "root", "Nazone12");
			
			Statement stmt = con.createStatement();
			String sql = "SELECT PASSWORD FROM admin WHERE username ='"+user+"'";
			ResultSet rs = stmt.executeQuery(sql);
			
			while(rs.next()) {
				password = rs.getString("PASSWORD");
				
			}}catch(Exception e2) {
				System.out.println(e2);}
		}

		if(password.equalsIgnoreCase(pwd) && verify == 1 && type.equalsIgnoreCase("user")) {
			Cookie loginCookie = new Cookie("user",user);
			//Setting cookie to expiry in 30mins
			response.addCookie(loginCookie);
			response.sendRedirect("userhomepage.jsp");
			
		}else if (!password.equalsIgnoreCase(pwd)){
			RequestDispatcher rd = getServletContext().getRequestDispatcher("/Login.jsp");
			PrintWriter out = response.getWriter();
			out.println("<font color=white>Your username or password is wrong.</font>");
			rd.include(request, response);
		}else if(verify == 0 && type.equalsIgnoreCase("user")) {
			RequestDispatcher rd = getServletContext().getRequestDispatcher("/Login.jsp");
			PrintWriter out = response.getWriter();
			out.println("<font color=white>Your account not verify yet</font>");
			rd.include(request, response);
		}else if(password.equalsIgnoreCase(pwd) && type.equalsIgnoreCase("admin")) {
			//admin page
			Cookie loginCookie = new Cookie("user",user);
			Cookie usertype = new Cookie("usertype",type);
			//Setting cookie to expiry in 30mins
			response.addCookie(loginCookie);
			response.addCookie(usertype);
			response.sendRedirect("listofuser.jsp");
		}
	}
}
