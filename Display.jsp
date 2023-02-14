<%@ page import="java.io.*,java.sql.*,java.util.Base64" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Display Image</title>
</head>
<body>
<%! String base64Image = "";%>
    <%
        Connection con = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;

        try {
            // Load the JDBC driver
            Class.forName("com.mysql.jdbc.Driver");

            // Connect to the database
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/foodwaste", "root", "Nazone12"); 

            // Retrieve the image data from the database
            stmt = con.prepareStatement("SELECT IMAGES FROM ITEM WHERE ITEMID = ?");
            stmt.setInt(1, 1);
            rs = stmt.executeQuery();

            if (rs.next()) {
                // Get the image data
                byte[] imageData = rs.getBytes("IMAGES");
                base64Image = Base64.getEncoder().encodeToString(imageData);

                // Set the content type to "image/jpeg" or "image/png"
                response.setContentType("image/jpeg");
                response.setContentType("text/html");
               
               out.println("<img src='data:image/jpeg;base64," + base64Image + "' alt='Image from Database'/>");

                // Write the data to the response output stream
                OutputStream os = response.getOutputStream();
                os.write(imageData);
                os.flush();
                os.close();
            }
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                if (rs != null) {
                    rs.close();
                }
                if (stmt != null) {
                    stmt.close();
                }
                if (con != null) {
                    con.close();
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    %>
  
</body>
</html>