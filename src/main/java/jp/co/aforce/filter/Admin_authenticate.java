package jp.co.aforce.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebFilter(filterName="/Admin_authenticate/", urlPatterns = "/views/admin/authenticated/*")
public class Admin_authenticate extends HttpFilter implements Filter {
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) {
		try {
			String target = ((HttpServletRequest) request).getRequestURI();

			HttpSession session = ((HttpServletRequest) request).getSession();
			if (session == null) {
				/* まだ認証されていない */
				session = ((HttpServletRequest) request).getSession(true);
				session.setAttribute("target", target);

				((HttpServletResponse) response).sendRedirect("/ShoppingSite/views/admin/login.jsp");
			} else {
				Object loginCheck = session.getAttribute("s_a_user_id");
				if (loginCheck == null) {
					/* まだ認証されていない */
					session.setAttribute("target", target);
					((HttpServletResponse) response).sendRedirect("/ShoppingSite/views/admin/login.jsp");
				}
			}

			chain.doFilter(request, response);
		} catch (ServletException se) {
		} catch (IOException e) {
		}
	}

	public void init(FilterConfig filterConfig) throws ServletException {
	}

	public void destroy() {
	}
}
