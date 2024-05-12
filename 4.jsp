employee.jsp

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Employee Salary Details</title>
</head>
<style>
          label{

            text-align: right;
            padding-right: 10px;
        }    
</style>
<body><center>
    <h2>Enter Employee Salary Details</h2>
    <form action="SalaryCalculatorServlet" method="post">
        <label for="name">Name:</label>
        <input type="text" id="name" name="name" required><br><br>
        
        <label for="empid">Employee ID:</label>
        <input type="text" id="empid" name="empid" required><br><br>
        
        <label for="designation">Designation:</label>
        <input type="text" id="designation" name="designation" required><br><br>
        
        <label for="basic_pay">Basic Pay:</label>
        <input type="number" id="basic_pay" name="basic_pay" required><br><br>
        
        <input type="submit" value="Calculate Net Salary">
    </form>
    </center>
</body>
</html>




SalaryCalculatorServlet.java

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet(urlPatterns = {"/SalaryCalculatorServlet"})
public class SalaryCalculatorServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            String name = request.getParameter("name");
            String empid = request.getParameter("empid");
            String designation = request.getParameter("designation");
            double basicPay = Double.parseDouble(request.getParameter("basic_pay"));

            // Calculate DA (10% of basic pay)
            double da = 0.10 * basicPay;

            // Calculate HRA (3% of basic pay)
            double hra = 0.03 * basicPay;

            // Calculate net salary (basic pay + DA + HRA)
            double netSalary = basicPay + da + hra;

            // Display employee details and net salary
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Employee Salary Details</title>");
            out.println("</head>");
            out.println("<body><center>");
            out.println("<h2>Employee Salary Details</h2>");
            out.println("<p>Name: " + name + "</p>");
            out.println("<p>Employee ID: " + empid + "</p>");
            out.println("<p>Designation: " + designation + "</p>");
            out.println("<p>Basic Pay: $" + basicPay + "</p>");
            out.println("<p>DA (10%): $" + da + "</p>");
            out.println("<p>HRA (3%): $" + hra + "</p>");
            out.println("<p><strong>Net Salary: $" + netSalary + "</strong></p>");
            out.println("</center></body>");
            out.println("</html>");
        }
    }
}
