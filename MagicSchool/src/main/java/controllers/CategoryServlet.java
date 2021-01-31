package controllers;

import beans.Category;
import beans.Course;
import beans.User;
import java.util.List;
import models.CourseModel;
import models.UserModel;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Optional;

@WebServlet(name = "CategoryServlet", urlPatterns="/Category/*")
public class CategoryServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String path = request.getPathInfo();
        switch (path)
        {
            case "/HasCourse":
                int catID = Integer.parseInt(request.getParameter("catID"));
                List<Course> list = CourseModel.findByCatID(catID);
                List<Course> list2 = CourseModel.findByMainCatID(catID);
                PrintWriter outp = response.getWriter();
                response.setContentType("application/json");
                response.setCharacterEncoding("utf-8");
                if(list.size() == 0 && list2.size() == 0)
                    outp.print(false);
                else
                    outp.print(true);
                outp.flush();

        }
    }
}
