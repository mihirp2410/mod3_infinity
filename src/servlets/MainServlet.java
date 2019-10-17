package servlets;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.ParseException;
import java.util.ArrayList;

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

	protected  void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		PrintWriter out=response.getWriter();
		String action = request.getParameter("operation");
		HttpSession sess = request.getSession();
		System.out.println(action);
		switch(action) {
		case "login" :
					String uname = request.getParameter("uname");
					String pwd = request.getParameter("pwd");
					getServletContext().setAttribute("sess", sess);
					sess.setAttribute("uname", uname);
					sess.setAttribute("pwd", pwd);	
					getServletContext().getRequestDispatcher("/1stpage.jsp").include(request,response);
					LoadData.loadstb(uname);
					
				break;
		case "bill":
			String choose=request.getParameter("billing");
			System.out.println(choose);
			try {
				ResultSet rs= stb_type.stb(choose);
				//stb_type.setStbType();
				getServletContext().setAttribute("sess", sess);
				sess.setAttribute("choose",choose);
				sess.setAttribute("rs", rs);
				getServletContext().getRequestDispatcher("/stbfile.jsp").include(request,response);
				LoadData.billing_type(choose);

			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			break;
		case "package":
			     
			try {
				
				ResultSet rst=Package_type.getPackage();
				getServletContext().setAttribute("sess", sess);
				sess.setAttribute("package_resultset", rst);
				
				//getServletContext().getRequestDispatcher("/package.jsp").include(request,response);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			try {
				String stb=request.getParameter("stb");
				System.out.println(stb);
				ArrayList<Channel> alc = Channel_type.getChannels();
				sess.setAttribute("channel_list", alc);
				sess.setAttribute("stb", stb);
				
				getServletContext().getRequestDispatcher("/package.jsp").include(request,response);
				LoadData.loadstb(stb);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		
             break;
         
		case "packageselection":
			String[] ar=request.getParameterValues("select");
			String[] arr=request.getParameterValues("select1");
			String d=request.getParameter("purchasedate");
			for (int i = 0; i < ar.length;i++) {
				out.println(ar[i]);
			}
			for (int i = 0; i < arr.length;i++) {
				out.println(arr[i]);
			}
			getServletContext().setAttribute("sess", sess);
			sess.setAttribute("ar",ar);
			sess.setAttribute("arr",arr);
			sess.setAttribute("date", d);
            LoadData.loadpackage(ar);
            LoadData.loadchannel(arr);
            try {
				LoadData.loaddate(d);
			} catch (ParseException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
            
		}


	}


}
 