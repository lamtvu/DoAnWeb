package controllers;

import at.favre.lib.crypto.bcrypt.BCrypt;
import beans.Category;
import beans.Course;
import beans.User;
import models.CategoryModel;
import models.CourseModel;
import models.UserModel;
import utils.ServletUtils;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet(name = "AdminServlet",urlPatterns = "/Admin/*")
public class AdminServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String path = request.getPathInfo();
        switch (path){
            case "/AddCategory":
                doPostAddCat(request,response);
                break;
            case "/DeleteCategory":
                doPostDeleteCat(request,response);
                break;
            case "/UpdateNameCategory":
                doPostUpdateNameCategory(request,response);
                break;
            case "/DeleteCourse":
                doPostDeleteCourse(request,response);
                break;
            case"/DeleteTeacher":
                doPostDeleteTeacher(request,response);
                break;
            case "/AddTeacher":
                doPostAddTeacher(request,response);
                break;
            case "/UpdateEmail":
                doPostUpdateEmail(request,response);
                break;
            case "/UpdateName":
                doPostUpdateName(request,response);
                break;
            case "/UpdatePassword":
                doPostUpdatePassword(request,response);
                break;
            case "/UpdateTeacherPass":
                doPostUpdateTeacherPassword(request,response);
                break;
            case "/UpdateEnableUser":
                doPostEnableUser(request,response);
                break;
            case "/UpdateDisableUser":
                doPostDisableUser(request,response);
                break;
            case "/UpdateEnableCourse":
                doPostEnableCourse(request,response);
                break;
            case "/UpdateDisableCourse":
                doPostDisableCourse(request,response);
                break;
            default:
                ServletUtils.redirect("/NotFound",request,response);
                break;
        }
    }
    private void goBack(HttpServletRequest request,HttpServletResponse response) throws IOException {
        String url = request.getHeader("referer");
        if(url == null) url="/Admin/Index";
        ServletUtils.redirect(url,request,response);
    }
    private void doPostDisableCourse(HttpServletRequest request,HttpServletResponse response) throws IOException {
        int id = Integer.parseInt(request.getParameter("courseID"));
        Course course= CourseModel.findByID(id).get();
        course.setEnable("false");
        CourseModel.Update(id,course);
//        ServletUtils.redirect("/Admin/Index",request,response);
        goBack(request,response);
    }
    private void doPostEnableCourse(HttpServletRequest request,HttpServletResponse response) throws IOException {
        int id = Integer.parseInt(request.getParameter("courseID"));
        Course course= CourseModel.findByID(id).get();
        course.setEnable("true");
        CourseModel.Update(id,course);
//        ServletUtils.redirect("/Admin/Index",request,response);
        goBack(request,response);
    }
    private void doPostEnableUser(HttpServletRequest request,HttpServletResponse response) throws IOException {
        int id =Integer.parseInt( request.getParameter("userID"));
        UserModel.Enable(id);
//        ServletUtils.redirect("/Admin/Index",request,response);
        goBack(request,response);
    }
    private void doPostDisableUser(HttpServletRequest request,HttpServletResponse response) throws IOException {
        int id =Integer.parseInt( request.getParameter("userID"));
        UserModel.Disabled(id);
//        ServletUtils.redirect("/Admin/Index",request,response);
        goBack(request,response);
    }
    private void doPostUpdateTeacherPassword(HttpServletRequest request,HttpServletResponse response) throws IOException {
        int ID = Integer.parseInt(request.getParameter("teacherID"));
        String password = request.getParameter("newPass");
        UserModel.UpdatePassword(ID,password);
        ServletUtils.redirect("/Admin/Index",request,response);
    }
    private  void  doPostUpdatePassword(HttpServletRequest request,HttpServletResponse response) throws IOException {
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("authUser");
        int ID = user.getId();
        String password = request.getParameter("newPassword");
        UserModel.UpdatePassword(ID,password);
        updateAuthUser(request,response);
        ServletUtils.redirect("/Admin/Index",request,response);
    }
    private  void  doPostUpdateName(HttpServletRequest request,HttpServletResponse response) throws IOException {
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("authUser");
        int ID = user.getId();
        String name = request.getParameter("newName");
        UserModel.UpdateName(ID,name);
        updateAuthUser(request,response);
        ServletUtils.redirect("/Admin/Index",request,response);
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
        ServletUtils.redirect("/Admin/Index",request,response);
    }
    private void doPostAddTeacher(HttpServletRequest request,HttpServletResponse response) throws IOException {
        String username = request.getParameter("addUsername");
        String name = request.getParameter("addName");
        String password = request.getParameter("addPassword");
        String bcryptHashString = BCrypt.withDefaults().hashToString(12, password.toCharArray());
        String email = request.getParameter("addEmail");
        UserModel.Add(new User(-1,username,bcryptHashString,name,email,"teacher","true",""));
        ServletUtils.redirect("/Admin/Index",request,response);
    }
    private void doPostDeleteTeacher(HttpServletRequest request,HttpServletResponse response) throws IOException {
        int id = Integer.parseInt(request.getParameter("userDeleteID"));
        UserModel.delete(id);
        ServletUtils.redirect("/Admin/Index",request,response);

    }
    private void doPostDeleteCourse(HttpServletRequest request,HttpServletResponse response) throws IOException {
        int id = Integer.parseInt(request.getParameter("courseDeleteID"));
        CourseModel.delete(id);
        ServletUtils.redirect("/Admin/Index",request,response);
    }
    private void doPostUpdateNameCategory(HttpServletRequest request,HttpServletResponse response) throws IOException {
        String name = request.getParameter("catName");
        int id = Integer.parseInt( request.getParameter("catOrParentID"));
        CategoryModel.updateName(id,name);
        ServletUtils.redirect("/Admin/Index",request,response);
    }
    private void doPostAddCat(HttpServletRequest request,HttpServletResponse response) throws IOException {
        String name = request.getParameter("catName");
        int id = Integer.parseInt( request.getParameter("catOrParentID"));

        CategoryModel.add(new Category(-1,id,name));
        ServletUtils.redirect("/Admin/Index",request,response);
    }
    private void doPostDeleteCat(HttpServletRequest request,HttpServletResponse response) throws IOException {
        int id = Integer.parseInt(request.getParameter("deleteCatID"));
        CategoryModel.delete(id);
        ServletUtils.redirect("/Admin/Index",request,response);
    }
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String path = request.getPathInfo();
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("authUser");
        if(!user.getOffice().equals("admin"))
        {
            ServletUtils.redirect("/Information",request,response);
            return;
        }

        switch (path)
        {
            case "/Index":
//                List<Course> list = CourseModel.getAll();
                String username = "";
                int catid = 0;
                if(request.getParameter("categorySearch")!=null)
                {
                    catid =Integer.parseInt( request.getParameter("categorySearch"));
                }
                if(request.getParameter("teacherSearch")!=null)
                {
                    username = request.getParameter("teacherSearch");
                }
                List<Course> list ;
                if(catid !=0 && CategoryModel.findByID(catid).get().getParentCat() == 0)
                {
                    list = CourseModel.SearchByTeacherAndCat(username,catid);
                }
                else {
                    list = CourseModel.SearchByTeacherAndSubCat(username,catid);
                }
                request.setAttribute("courses",list);
                List<User> students = UserModel.getAllUsersByOffice("student");
                List<User> list1 = UserModel.getAllUsersByOffice("teacher");
                request.setAttribute("teachers",list1);
                request.setAttribute("students",students);
                ServletUtils.forward("/views/vwAdmin/Index.jsp",request,response);
                break;
            default:
                ServletUtils.redirect("/notFond",request,response);
                break;
        }
    }
}

