package controllers;

import beans.Category;
import beans.Chapter;
import beans.Course;
import beans.User;
import models.ChapterModel;
import models.CourseModel;
import models.UserModel;
import utils.ServletUtils;
import java.util.List;
import javax.servlet.Servlet;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.File;
import java.io.IOException;
import java.util.Calendar;
import java.util.Date;
import java.util.Map;

@WebServlet(name = "TeacherServlet",urlPatterns="/Teacher/*")
@MultipartConfig(
        fileSizeThreshold = 20 * 1024 * 1024,
        maxFileSize = 100 * 1024 * 1024,
        maxRequestSize = 100 * 1024 * 1024
)
public class TeacherServlet extends HttpServlet {
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
            case "/AddCourse":
                doPostAddCourse(request,response);
                ServletUtils.redirect("/Teacher/Index",request,response);
                break;
            case "/AddChapter":
                doPostAddChapter(request,response);
                ServletUtils.redirect("/Teacher/Index",request,response);
                break;
            case "/DeleteChapter":
                doPostDeleteChapter(request,response);
                ServletUtils.redirect("/Teacher/Index",request,response);
                break;
            case "/DeleteCourse":
                doPostDeleteCourse(request,response);
                ServletUtils.redirect("/Teacher/Index",request,response);
                break;
            default:
                ServletUtils.redirect("/NotFound",request,response);
                break;
        }
    }
    private  void doPostDeleteCourse(HttpServletRequest request,HttpServletResponse response)
    {
        int id =Integer.parseInt(request.getParameter("courseID"));
        CourseModel.delete(id);

    }
    private  void doPostDeleteChapter(HttpServletRequest request,HttpServletResponse response)
    {
        int id =Integer.parseInt(request.getParameter("chapterID"));
        ChapterModel.delete(id);

    }
    private void  doPostAddChapter(HttpServletRequest request,HttpServletResponse response) throws IOException, ServletException {
        String name = request.getParameter("chapterName");
        String puclicorprivate = request.getParameter("pop");
        int courseid=Integer.parseInt(request.getParameter("courseID"));
        ChapterModel.add(new Chapter(-1,courseid,name,puclicorprivate));
        for (Part part : request.getParts()) {
            String contentDisp = part.getHeader("content-disposition");
            String[] items = contentDisp.split(";");
            for (String s : items) {
                String tmp = s.trim();
                if (tmp.startsWith("filename")) {
                    int idx = tmp.indexOf('.') + 1;
                    String filename = tmp.substring(idx, tmp.length() - 1);

                    String targetDir = this.getServletContext().getRealPath("public/clips");
                    System.out.println(targetDir);
                    File dir = new File(targetDir);
                    if (!dir.exists()) {
                        dir.mkdir();
                    }
                    List<Map<String,Object>> list = ChapterModel.getMaxID();
                    String destination = targetDir + "/" + list.get(0).get("maxid")+"." + filename;
                    part.write(destination);
                }
            }
        }
    }
    private void doPostAddCourse(HttpServletRequest request,HttpServletResponse response) throws IOException, ServletException {
        HttpSession session = request.getSession();
        User authUser = (User) session.getAttribute("authUser");
        String coursename = request.getParameter("courseName");
        String tinydes = request.getParameter("tinyDes");
        String fulldes = request.getParameter("fullDes");
        int catid = Integer.parseInt(request.getParameter("catID"));
        int teacherid = authUser.getId();
        int price = Integer.parseInt(request.getParameter("price"));
        String complete = request.getParameter("complete");
        Date updateDate = Calendar.getInstance().getTime();
        CourseModel.add(new Course(-1,teacherid,price,catid,complete,coursename,tinydes,fulldes,updateDate));
        for (Part part : request.getParts()) {
            String contentDisp = part.getHeader("content-disposition");
            System.out.println(contentDisp);
            String[] items = contentDisp.split(";");
            for (String s : items) {
                String tmp = s.trim();
                if (tmp.startsWith("filename")) {
                    int idx = tmp.indexOf('.') + 1;
                    String filename = tmp.substring(idx, tmp.length() - 1);

                    String targetDir = this.getServletContext().getRealPath("public/image");
                    System.out.println(targetDir);
                    File dir = new File(targetDir);
                    if (!dir.exists()) {
                        dir.mkdir();
                    }
                    List<Map<String,Object>> list = CourseModel.getMaxID();
                    String destination = targetDir + "/" + list.get(0).get("maxid") +"."+filename;

                    part.write(destination);
                }
            }
        }
    }
    private  void  doPostUpdatePassword(HttpServletRequest request,HttpServletResponse response) throws IOException {
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("authUser");
        int ID = user.getId();
        String password = request.getParameter("newPassword");
        UserModel.UpdatePassword(ID,password);
        updateAuthUser(request,response);
        ServletUtils.redirect("/Teacher/Index",request,response);
    }
    private  void  doPostUpdateName(HttpServletRequest request,HttpServletResponse response) throws IOException {
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("authUser");
        int ID = user.getId();
        String name = request.getParameter("newName");
        UserModel.UpdateName(ID,name);
        updateAuthUser(request,response);
        ServletUtils.redirect("/Teacher/Index",request,response);
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
        ServletUtils.redirect("/Teacher/Index",request,response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String path = request.getPathInfo();
        switch(path){
            case"/Index":
                List<Course>courses = CourseModel.getAll();
                List<Chapter> chapters = ChapterModel.getAll();
                request.setAttribute("courses",courses);
                request.setAttribute("chapters",chapters);
                ServletUtils.forward("/views/vwTeacher/teacher.jsp",request,response);
                break;
            default:
                ServletUtils.forward("/NotFound",request,response);
                break;
        }
    }
}
