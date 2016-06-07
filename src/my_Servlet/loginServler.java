package my_Servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.Servlet;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import my_javaBean.DBUtil;

public class loginServler extends HttpServlet implements Servlet{
	
	/**
	 * Initialization of the servlet. <br>
	 *
	 * @throws ServletException if an error occurs
	 */
	public void init() throws ServletException {
		System.out.println("=====start servlet=========");
	}


	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException{
		doPost(request, response);
	}
	/**
	 * The doPost method of the servlet. <br>
	 *
	 * This method is called when a form has its tag value method equals to post.
	 * 
	 * @param request the request send by the client to the server
	 * @param response the response send by the server to the client
	 * @throws ServletException if an error occurred
	 * @throws IOException if an error occurred
	 */
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String userName = request.getParameter("adminID");//取得用户名
		String password = request.getParameter("adminPswd");//取得密码
		String returnUri = request.getParameter("return_uri");
		request.getSession().setAttribute("userID", userName);
		
		DBUtil db = new DBUtil();//构建数据库对象
		boolean canLogin = db.loginSuccess(userName, password);
		
		RequestDispatcher rd = null;
		if (canLogin) {
			request.getSession().setAttribute("flag", "login_success");
			if (returnUri != null) {
				rd = request.getRequestDispatcher(returnUri);
				rd.forward(request, response);
			}else {
				rd = request.getRequestDispatcher("index.jsp");
				rd.forward(request, response);
			}
		}else {
			response.sendRedirect("back.jsp");
			request.getSession().setAttribute("flag", "login_error");
			rd = request.getRequestDispatcher("login.jsp");				
			rd.forward(request, response);
		}
	}
	
	public void service(ServletRequest request, ServletResponse response)
			throws ServletException, IOException {
			HttpServletRequest rq = (HttpServletRequest)request;
			HttpServletResponse rs = (HttpServletResponse) response;
			doPost(rq,rs);
	}
	
	/**
	 * Destruction of the servlet. <br>
	 */
	public void destroy() {
		super.destroy(); 
		System.out.println("=====destory servlet=========");
	}

}
