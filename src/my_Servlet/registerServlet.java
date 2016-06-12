package my_Servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import my_javaBean.DBUtil;

public class registerServlet extends HttpServlet {

	/**
	 * Initialization of the servlet. <br>
	 *
	 * @throws ServletException if an error occurs
	 */
	public void init() throws ServletException {
		System.out.println("=====start registerServlet=========");
	}

	/**
	 * The doGet method of the servlet. <br>
	 *
	 * This method is called when a form has its tag value method equals to get.
	 * 
	 * @param request the request send by the client to the server
	 * @param response the response send by the server to the client
	 * @throws ServletException if an error occurred
	 * @throws IOException if an error occurred
	 */
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
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
		String userName = request.getParameter("user_name");//ȡ���û���
		String password = request.getParameter("user_pwd");//ȡ������
		
		DBUtil db = new DBUtil();//�������ݿ����
		boolean canregister = db.registerSuccess(userName, password);
		if (canregister) {
			System.out.println("ע��ɹ�");
			response.sendRedirect("login.jsp");
		}else {
			System.out.println("ע��ʧ��");
			response.sendRedirect("register.jsp");
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
		System.out.println("=====destroy registerServlet=========");
		super.destroy(); // Just puts "destroy" string in log
	}

}
