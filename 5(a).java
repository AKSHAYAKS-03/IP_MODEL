import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet(urlPatterns = {"/NewServlet1"})
public class NewServlet extends HttpServlet {

    private int visitCount;
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Increase visit count
        visitCount++;

        // Set response content type
        response.setContentType("text/html");

  try{      
        PrintWriter out = response.getWriter();
        out.println("<html><head><title>Visit Counter</title></head><body>");
        out.println("<h2>Page Visits</h2>");
        out.println("<p>This page has been visited " + visitCount + " times.</p>");
        out.println("</body></html>");
    
    }
    catch(Exception ServletException){
            visitCount = 0;
}
}
