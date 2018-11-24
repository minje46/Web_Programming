package ex9;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class Ex9_3
 */
@WebServlet("/Ex9_3")
public class Ex9_3 extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public Ex9_3() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		// response.getWriter().append("Served at: ").append(request.getContextPath());

		response.setContentType("text/html");
		PrintWriter out = response.getWriter();

		out.println("<!DOCTYPE html>");
		out.println("<html><head>");
		out.println("<title>Exercise 9.3</title>");
		out.println("</head>");
		out.println("<body>");
		out.println("<h2 align='center'>Search Front-end</h2>");
		out.println("<h3 align='center'>Choose search engine and enter query keywords</h3>");
		out.println("<div align='center'>");
		out.println("<form action=\"Ex9_3\">");
		out.println("<select name = 'engine'>");
		out.println("<option value='naver'>Naver</option>");
		out.println("<option value='daum'>Daum</option>");
		out.println("<option value='google'>Google</option>");
		out.println("<option value='yahoo'>Yahoo</option>");
		out.println("<option value='bing'>Bing</option>");
		out.println("</select>");
		out.println("<input type='text' name='query' value='' />");
		out.println("<input type='submit' value='Search'/></form></div>");

		String engine = request.getParameter("engine");
		String query = request.getParameter("query");

		if ((engine != null) && (query != null) && (query.trim().length() > 0)) {
			String url = "";

			System.out.println(engine + " to " + query);

			switch (engine) {
			case "naver":
				url = "http://search.naver.com/search.naver?query=" + query;
				break;
			case "daum":
				url = "http://search.daum.net/" + query;
				break;
			case "google":
				url = "http://www.google.com/search?q=" + query;
				break;
			case "yahoo":
				url = "http://search.yahoo.com/bin/search?p=" + query;
				break;
			case "bing":
				url = "http://www.bing.com/search?q=" + query;
				break;
			}
			response.sendRedirect(url);
			return;
		}

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
