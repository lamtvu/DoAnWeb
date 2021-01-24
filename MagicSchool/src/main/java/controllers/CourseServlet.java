package controllers;

import beans.Course;
import models.CourseModel;
import utils.ServletUtils;
import javax.servlet.annotation.WebServlet;
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
                 System.out.println(list.get(0).get("id"));
                request.setAttribute("courses",list);
                ServletUtils.forward("/views/vwProduct/Detail.jsp", request, response);
                break;



            case "/ByCat":
                int catID = Integer.parseInt(request.getParameter("id"));
//                List<Map<String,Object>> list1 = CourseModel.GetByCat(catID);

                request.setAttribute("CatIDd",catID);
                final int LIMIT = 4;
                int currentPage = 1;
                if(request.getParameter("page") != null){
                    currentPage = Integer.parseInt(request.getParameter("page"));
                }
                int offset = (currentPage - 1) * LIMIT;
                request.setAttribute("currentPage",currentPage);
                int total = CourseModel.countByCatID(catID);
//                System.out.println(total);
                int nPages = total/LIMIT;
                if (total % LIMIT > 0)
                    nPages++;
                int[] pages = new int[nPages];
                for(int i=0;i<nPages;i++){
                    pages[i] = i+1;
                }
                request.setAttribute("pages",pages);

//                List<Course> listshiba = CourseModel.pageByCatID(catID,LIMIT,offset);
//                request.setAttribute("product",listshiba);
                List<Map<String,Object>> list1 = CourseModel.GetByCat(catID,LIMIT,offset);
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
