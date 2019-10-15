 package servlets;
import java.io.IOException;


import javax.servlet.Servlet;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


@WebServlet("/MainServlet")
public  class MainServlet extends HttpServlet implements Servlet{
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 response.setContentType("text/html");
		HttpSession sess = request.getSession();
		String choose=request.getParameter("billing_type");
		getServletContext().setAttribute("sess", sess);
		sess.setAttribute("choose", choose);
		getServletContext().getRequestDispatcher("/stbfile.jsp").include(request,response);
		//out.print("You chose the billing type : " + request.getParameter("billing_type"));
		
	}

}
