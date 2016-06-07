package my_Filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.omg.CORBA.Request;

public class PermissionFilter implements Filter{
	
	public void init(FilterConfig arg0) throws ServletException {
		// TODO Auto-generated method stub
		
	}


	public void doFilter(ServletRequest request, ServletResponse response,
			FilterChain chain) throws IOException, ServletException {
		HttpServletRequest req = (HttpServletRequest) request;
		HttpServletResponse resp = (HttpServletResponse) response;
		
		String servletPath = req.getServletPath();
		
		HttpSession session = req.getSession();
		String flag = (String) session.getAttribute("flag");
		
		if(servletPath != null 
				&& (servletPath.equals("/Wed_Course_Design/login.jsp")||(servletPath
						.equals("/Wed_Course_Design/index.jsp"))||(servletPath.equals("/Wed_Course_Design/loginServlet")))){
			chain.doFilter(request, response);
		}else {
			if (flag != null && flag.equals("login_success")) {
				chain.doFilter(request, response);
				
			}else if (flag != null && flag.equals("login_error")) {
				req.setAttribute("retrun_uri", servletPath);
				RequestDispatcher rd = req.getRequestDispatcher("login.jsp");
				rd.forward(req, resp);
			}else {
				req.setAttribute("return_uri", servletPath);
				RequestDispatcher rd = req.getRequestDispatcher("login.jsp");
				rd.forward(req, resp);
			}
		}
	}

	public void destroy() {
		// TODO Auto-generated method stub
		
	}
}
