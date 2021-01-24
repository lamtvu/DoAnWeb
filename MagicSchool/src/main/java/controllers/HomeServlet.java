package controllers;

import beans.Category;
import beans.Course;
import beans.Evaluate;
import beans.User;
import models.CourseModel;
import utils.ServletUtils;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;
import java.util.Map;

@WebServlet(name = "HomeServlet", urlPatterns = "/Home/*")
public class HomeServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String path = request.getPathInfo();
        if(path == null || path.equals("/")){
            path="/Index";
        }
        switch (path){
            case "/Index":
                List<Map<String,Object>> list = CourseModel.GetNewCourse();
                request.setAttribute("courses",list);
//                for (String key: list3.get(0).keySet())
//                {
//                    System.out.println(key);
//                }
                ServletUtils.forward("/views/vwHome/Index.jsp",request,response);
                break;
            default:
                ServletUtils.redirect("/NotFound",request,response);
                break;
        }
    }
}
