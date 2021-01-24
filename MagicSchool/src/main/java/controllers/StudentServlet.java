package controllers;

import beans.Chapter;
import beans.Course;
import beans.User;
import models.ChapterModel;
import models.CourseModel;
import models.UserModel;
import utils.ServletUtils;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "StudentServlet",urlPatterns="/Student/*")
public class StudentServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String path = request.getPathInfo();
        switch (path){
            case "/UpdateEmail":
                doPostUpdateEmail(request,response);
                break;
            case "/UpdateName":
                doPostUpdateName(request,response);
                break;
            case "/UpdatePassword":
                doPostUpdatePassword(request,response);
                break;
            default:
                ServletUtils.redirect("/NotFound",request,response);

        }
    }
    private  void  doPostUpdatePassword(HttpServletRequest request,HttpServletResponse response) throws IOException {
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("authUser");
        int ID = user.getId();
        String password = request.getParameter("newPassword");
        UserModel.UpdatePassword(ID,password);
        updateAuthUser(request,response);
        ServletUtils.redirect("/Student/Index",request,response);
    }
    private  void  doPostUpdateName(HttpServletRequest request,HttpServletResponse response) throws IOException {
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("authUser");
        int ID = user.getId();
        String name = request.getParameter("newName");
        UserModel.UpdateName(ID,name);
        updateAuthUser(request,response);
        ServletUtils.redirect("/Student/Index",request,response);
    }
    private void updateAuthUser(HttpServletRequest request,HttpServletResponse response)
    {
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("authUser");
        session.setAttribute("authUser",UserModel.FindByID(user.getId()).get());
    }
    private  void  doPostUpdateEmail(HttpServletRequest request,HttpServletResponse response) throws IOException {
        int ID = Integer.parseInt(request.getParameter("editEmailUserID"));
        String email = request.getParameter("newEmail");
        UserModel.UpdateEmail(ID,email);
        updateAuthUser(request,response);
        ServletUtils.redirect("/Student/Index",request,response);
    }
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String path = request.getPathInfo();
        switch(path){
            case"/Index":
                ServletUtils.forward("/views/vwUser/index.jsp",request,response);
                break;
            default:
                ServletUtils.forward("/NotFound",request,response);
                break;
        }
    }
}
