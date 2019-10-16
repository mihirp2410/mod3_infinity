package servlets;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.sql.SQLException;

import logic.*;
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
		PrintWriter out=response.getWriter();
		String action = request.getParameter("operation");
		HttpSession sess = request.getSession();
		System.out.println(action);
		switch(action) {
		case "bill":
			String choose=request.getParameter("billing");
			System.out.println(choose);
			try {
				ResultSet rs= stb_type.stb(choose);
				getServletContext().setAttribute("sess", sess);
				sess.setAttribute("rs", rs);
				getServletContext().getRequestDispatcher("/stbfile.jsp").include(request,response);

			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			break;
		case "package":
			try {
				ResultSet[] rst=Package_type.getPackage();
				getServletContext().setAttribute("sess", sess);
				sess.setAttribute("rst", rst);
				getServletContext().getRequestDispatcher("/package.jsp").include(request,response);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
             break;
		}


	}


}
