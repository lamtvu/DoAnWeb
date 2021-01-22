package filter;

import beans.Category;
import models.CategoryModel;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
//import javax.servlet.http.HttpServletRequest;
import java.io.IOException;
import java.util.List;

@WebFilter(filterName = "MenuFilter",urlPatterns="/*")
public class MenuFilter implements Filter {
    public void destroy() {
    }

    public void doFilter(ServletRequest req, ServletResponse resp, FilterChain chain) throws ServletException, IOException {
        List<Category> list = CategoryModel.getAll();
        req.setAttribute("categoriesMenu",list);
        chain.doFilter(req, resp);
    }

    public void init(FilterConfig config) throws ServletException {

    }

}
