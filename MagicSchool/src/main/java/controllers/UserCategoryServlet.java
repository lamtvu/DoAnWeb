package controllers;

import beans.*;
import models.CourseModel;
import models.UserModel;
import utils.ServletUtils;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

@WebServlet(name = "UserCategoryServlet", urlPatterns = "/User/*")
public class UserCategoryServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String path = request.getPathInfo();
        if (path == null || path.equals("/")) {
            path = "/Index";
        }
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("authUser");
        Date date = Calendar.getInstance().getTime();
        switch (path) {
            case "/MyCourse":
//                HttpSession session = request.getSession();
//                User user = (User) session.getAttribute("authUser");
//                System.out.println(user.getId());
                List<Course> list = UserModel.FindCourseByUserID(user.getId());
                request.setAttribute("course",list);
                ServletUtils.forward("/views/vwProduct/CourseByUser.jsp",request,response);
                break;
            case"/AddToMyCourse":
                int idCourseBuy = Integer.parseInt(request.getParameter("id"));
                Ownlist cart = new Ownlist(-1,user.getId(),idCourseBuy,date);
                UserModel.addCourse(cart);
                ServletUtils.redirect("/Course/Detail?"+request.getQueryString(),request,response);
                break;
            case"/MyWatchList":

                List<Course> watchList = UserModel.FindWatchListByUserID(user.getId());
                request.setAttribute("course",watchList);
                ServletUtils.forward("/views/vwProduct/WatchListByUser.jsp",request,response);
                break;
            case"/AddWatchList":
                int idCourse = Integer.parseInt(request.getParameter("id"));
//                System.out.println(idCourse);
                Ownlist ownl = new Ownlist(-1,user.getId(),idCourse,date);
//                System.out.println(user.getId());
                UserModel.add(ownl);
                ServletUtils.redirect("/Course/Detail?"+request.getQueryString(),request,response);
                break;
            case"/DeleteWatchList":
                int idCourseDelete = Integer.parseInt(request.getParameter("id"));

                Watchlist wld = new Watchlist(-1,user.getId(),idCourseDelete,date);

                UserModel.delete(wld);
                ServletUtils.redirect("/Course/Detail?"+request.getQueryString(),request,response);
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
