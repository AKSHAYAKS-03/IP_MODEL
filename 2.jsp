<%@page import="java.text.SimpleDateFormat"%>
<%@page contentType="text/html" pageEncoding="UTF-8" import="java.sql.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <table border="1">
        <thead>
            <tr>
                <th>Employee ID</th>
                <th>First Name</th>
                <th>Last Name</th>
                <th>Salary</th>
            </tr>
        </thead>
        </body>
        <% 
           out.println("<h2>EMPLOYEE TABLE<h2>");
           try{ Connection c = DriverManager.getConnection("jdbc:derby://localhost:1527/products");
            Statement st=c.createStatement();
            ResultSet rs = st.executeQuery("SELECT * FROM employees");
                    
                    while (rs.next()) {
                        int id = rs.getInt("employee_id");
                        String name = rs.getString("first_name");
                        String lname = rs.getString("last_name");
                        double salary = rs.getDouble("salary");
                        

                        out.println("<tr>");
                        out.println("<td>" +id+ "</td>");
                        out.println("<td>" + name + "</td>");
                        out.println("<td>" + lname + "</td>");
                        out.println("<td>" + salary + "</td>");
                        out.println("</tr>");
                    }
                                                
                rs = st.executeQuery("SELECT COUNT(*) FROM employees");
                while (rs.next()) {
                    out.println("<table border=2 solid black><tr><th>Total no of Invoices </th><th>" + rs.getInt(1) + "</th></tr><br>");
                }
                rs = st.executeQuery("SELECT MAX(salary) FROM employees");
                while (rs.next()) {
                    out.println("<tr><th>Maximum Amount </th><th>" + rs.getInt(1) + "</th></tr><br>");
                }
                rs = st.executeQuery("SELECT AVG(salary) FROM employees");
                while (rs.next()) {
                    out.println("<tr><th>Average Amount </th><th>" + rs.getInt(1) + "</th></tr><br>");
                }
            }
           
            catch (SQLException e) {
                // Handle database errors
                out.println("Error: " + e.getMessage());
            } 

            %>
    </body>
</html>
