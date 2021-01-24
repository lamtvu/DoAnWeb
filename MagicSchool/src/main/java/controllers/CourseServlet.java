package controllers;

import beans.Course;
import models.CourseModel;
import utils.ServletUtils;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;
import java.util.Map;
import java.util.Optional;

@WebServlet(name = "CourseServlet", urlPatterns = "/Course/*")
public class CourseServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String path = request.getPathInfo();
        switch (path){
            case "/Detail":
//                int proID = Integer.parseInt(request.getParameter("id"));
//                Optional<Course> c = CourseModel.findByID(proID);
//                if (c.isPresent()) {
//                    request.setAttribute("course", c.get());
//                    ServletUtils.forward("/views/vwProduct/Detail.jsp", request, response);
//                } else {
//                    ServletUtils.redirect("/Home", request, response);
//                }
                int proID = Integer.parseInt(request.getParameter("id"));
                List<Map<String,Object>> list = CourseModel.GetByID(proID);
//                for (String key: list.get(0).keySet())
//                {
//                    System.out.println(key);
//                }

                request.setAttribute("courses",list);
                ServletUtils.forward("/views/vwProduct/Detail.jsp", request, response);
                break;
            case "/ByCat":
                int catID = Integer.parseInt(request.getParameter("id"));
                List<Map<String,Object>> list1 = CourseModel.GetByCat(catID);

//                for (String key: list1.get(0).keySet())
//                {
//                    System.out.println(key);
//                }

                request.setAttribute("categories",list1);
                ServletUtils.forward("/views/vwProduct/CourseByCat.jsp",request,response);
                break;
            default:
                ServletUtils.redirect("/NotFound", request, response);
                break;
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

}
