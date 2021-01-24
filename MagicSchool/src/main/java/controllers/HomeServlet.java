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
                List<Course> list = CourseModel.get10NewCourse();
                request.setAttribute("NewCourse",list);
                List<User> list1 = CourseModel.getTeach();
                request.setAttribute("teacher",list1);
                List<Evaluate> list2 = CourseModel.getPoint();
                request.setAttribute("point",list2);
                List<Category> list3 =CourseModel.getField();
                request.setAttribute("field",list3);


                ServletUtils.forward("/views/vwHome/Index.jsp",request,response);
                break;
            default:
                ServletUtils.redirect("/NotFound",request,response);
                break;
        }
    }
}
