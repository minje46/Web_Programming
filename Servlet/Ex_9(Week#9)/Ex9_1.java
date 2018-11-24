package ex9;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Enumeration;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class Ex9_1
 */
@WebServlet("/Ex9_1")
public class Ex9_1 extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Ex9_1() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	//	response.getWriter().append("Served at: ").append(request.getContextPath());
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		String[] error_msgs = {"", "", "", "", ""};
		
		int i = 0;
		Enumeration<String> paramNames = request.getParameterNames();
		while(paramNames.hasMoreElements()) {
			String name = (String)paramNames.nextElement();
			String value = request.getParameter(name);
			
			if(value.length()==0 || value.equals("")) {
				error_msgs[i] = "Enter " + name; 
			}
			i++;
		}
		
		String first = request.getParameter("firstName") == null ? "" : request.getParameter("firstName");
		String last = request.getParameter("lastName")== null ? "" : request.getParameter("lastName");
		String email = request.getParameter("eMail")== null ? "" : request.getParameter("eMail");
		String phone = request.getParameter("phoneNumber")== null ? "" : request.getParameter("phoneNumber");
		
		out.println("<!DOCTYPE html>\r\n" + 
				"<html>\r\n" + 
				"<head></head>\r\n" + 
				"<body>\r\n" + 
				"    <h2>Registration</h2>\r\n" + 
				"    <form>\r\n" + 
				"        <table>\r\n" + 
				"            <tr><td>First name :</td><td><input type=\"text\" name=\"firstName\" value=\""+first+"\"></td> <td style=\"color:red\"> "+error_msgs[0] +" </td></tr>\r\n" + 
				"            <tr><td>Last name :</td><td><input type=\"text\" name=\"lastName\" value=\""+last+"\"></td> <td style=\"color:red\"> "+error_msgs[1] +"</td></tr>\r\n" + 
				"            <tr><td>E-mail :</td><td><input type=\"text\" name=\"eMail\" value=\"" +email +"\"></td> <td style=\"color:red\"> "+error_msgs[2] +"</td></tr> \r\n" + 
				"            <tr><td>Phone number :</td><td><input type=\"text\" name=\"phoneNumber\"  value=\"" +phone +"\"></td> <td style=\"color:red\"> "+error_msgs[3] +" </td></tr>\r\n" + 
				"        </table>\r\n" + 
				"        <input type=\"submit\" value=\"register\">\r\n" + 
				"    </form>\r\n" + 
				"</body>\r\n" + 
				"</html>\r\n" + 
				"");
		
	}
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
