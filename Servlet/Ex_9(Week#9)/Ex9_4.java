package ex9;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.io.*;
import java.util.Enumeration;


/**
 * Servlet implementation class MyServlet
 */
@WebServlet("/Ex9_4")
public class Ex9_4 extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Ex9_4() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		
		String[] error_msgs = {"", "", "", "", ""};
		String[] cookie_value = {"", "", "", "", ""};
		Enumeration<String> paramNames = request.getParameterNames();
		
		int i = 0;
		Cookie[] cookies = request.getCookies();
	    if (cookies != null) {
	        for(Cookie c: cookies) {
	        	String cookie_name = c.getName();
	            if (cookie_name.equals("")) {
				    error_msgs[i] = "Enter " + cookie_name; 
	            }
	            else{
	            	cookie_value[i] =c.getValue(); 
	            }
	            i++;
	        }
	    }
	    else{
	    	while (paramNames.hasMoreElements()) { 
			    String name = (String)paramNames.nextElement();
			    String value = request.getParameter(name);
			    value = value.trim();
			    Cookie new_cookie = new Cookie(name, value);
			    response.addCookie(new_cookie);
			}
	    }
		
		
		
		out.println("<!DOCTYPE html>\n" + 
					"<html><head><style>"
					+"td.error{color:red}"
					+ "</style>"
					+ "</head>" +
					"<body><h2>Registration</h2>" +
					"<form ACTION=\"http://localhost:8080/Web_example/Ex9_4\">" +
					"<table border-collpase=\"collapse\">" +
					"<tr><td>First name : </td><td><input type=\"text\" name=\"firstName\" value=\""+ cookie_value[0] +"\"></td><td class=\"error\">" + error_msgs[0] + "</td></tr>" + 
					"<tr><td>Last name : </td><td><input type=\"text\" name=\"lastName\" value=\""+ cookie_value[1] +"\"></td><td class=\"error\">" + error_msgs[1] + "</td></tr>" +
					"<tr><td>Email : </td><td><input type=\"text\" name=\"email\" value=\""+ cookie_value[2] +"\"></td><td class=\"error\">" + error_msgs[2] + "</td></tr>" +
					"<tr><td>Phone number : </td><td><input type=\"text\" name=\"phoneNumber\" value=\""+ cookie_value[3] +"\"></td><td class=\"error\">" + error_msgs[3] + "</td></tr>" +
					"</table>" +
					"<input type=\"submit\" value=\"register\">" + 
					"</form></body></html>");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

}
