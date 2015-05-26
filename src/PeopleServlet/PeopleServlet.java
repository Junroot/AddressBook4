package PeopleServlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class PeopleServlet
 */
@WebServlet("/PeopleServlet")
public class PeopleServlet extends HttpServlet
{
	private static final long serialVersionUID = 1L;

	Connection conn;

	/**
	 * @see Servlet#init(ServletConfig)
	 */
	public void init(ServletConfig config) throws ServletException
	{
		try
		{
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/tp4", "root", "root");
		}
		catch ( Exception e )
		{
			e.printStackTrace();
		}
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		response.setContentType("text/html; charset=EUC-KR");
		PrintWriter out = response.getWriter();
		String issearch = request.getParameter("issearch");
		String nameToSearch = new String(request.getParameter("name").getBytes("8859_1"), "EUC-KR");
		try
		{
			Statement stmt = conn.createStatement();

			ResultSet rs;
			if ( nameToSearch == null )
				rs = stmt.executeQuery("SELECT * FROM people");
			else
				rs = stmt.executeQuery("SELECT * FROM people WHERE name LIKE '%" + nameToSearch + "%'");

			out.println("<HTML>"
					+ "<HEAD>"
					+ "<script src=\"js/bootstrap.js\" type=\"text/javascript\"></script>"				
					+"<meta charset=\"utf-8\">"
					+"<meta http-equiv=\"X-UA-Compatible\" content=\"IE=edge\">"
					+"<meta name=\"viewport\" content=\"width=device-width, initial-scale=1\">"
					+"<!-- 위 3개의 메타 태그는 *반드시* head 태그의 처음에 와야합니다; 어떤 다른 콘텐츠들은 반드시 이 태그들 *다음에* 와야 합니다 -->"
					+"<title>AddressBook</title>"
					+"<!-- 부트스트랩 -->"
					+"<link href=\"css/bootstrap.css\" rel=\"stylesheet\">"
					+"<!-- IE8 에서 HTML5 요소와 미디어 쿼리를 위한 HTML5 shim 와 Respond.js -->"
					+"<!-- WARNING: Respond.js 는 당신이 file:// 을 통해 페이지를 볼 때는 동작하지 않습니다. -->"
					+"<!--[if lt IE 9]>"
					+"<script src=\"https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js\"></script>"
					+" <script src=\"https://oss.maxcdn.com/respond/1.4.2/respond.min.js\"></script>"
					+"<![endif]-->"
					+ "</HEAD>"
					+ "<BODY>");
			out.printf("<div class = \"page-header\"><h1>Address</h1></div><div class=\"panel panel-default\">");
			if (issearch.equals("true"))
				out.printf("<div class=\"panel-heading\">검색 : %s</div>",nameToSearch);
			out.printf("<table class=\"table\">");
			while ( rs.next() )
			{
				out.printf("<tr><td style=\"vertical-align: middle ; text-align : center;\" >%s</td><td style=\"vertical-align: middle ; text-align : center;\" >%s</td>"
						+ "<td><button style=\"margin: 0\" type=\"button\" class=\"btn btn-default navbar-btn\">Delete</button></td>"
						+ "</tr>", rs.getString("name"), rs.getString("number"));
			}
			out.printf("</table></div>");
			out.println("</BODY></HTML>");
		}
		catch ( SQLException e )
		{
			e.printStackTrace();
		}
	}

}
