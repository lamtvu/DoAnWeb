package controllers;

import beans.Category;
import beans.Chapter;
import beans.Course;
import beans.User;
import models.ChapterModel;
import models.CourseModel;
import models.EvaluateModel;
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
        fileSizeThreshold = 50 * 1024 * 1024,
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
            case "/UpdateInformation":
                doPostUpdateInformation(request,response);
                ServletUtils.redirect("/Teacher/Index",request,response);
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
            case "/UpdateCoursename":
                doPostUpdateCoursename(request,response);
                ComeBack(request,response);
                break;
            case "/UpdateTinyDes":
                doPostUpdateTinyDes(request,response);
                ComeBack(request,response);
                break;
            case "/UpdateFullDes":
                doPostUpdateFullDes(request,response);
                ComeBack(request,response);
                break;
            case "/UpdateCourseCategory":
                doPostUpdateCourseCategory(request,response);
                ComeBack(request,response);
                break;
            case "/UpdateCoursePrice":
                doPostUpdateCoursePrice(request,response);
                ComeBack(request,response);
                break;
            case "/UpdateComplete":
                doPostUpdateComplete(request,response);
                ComeBack(request,response);
                break;
            case "/UpdateImage":
                doPostUpdateImge(request,response);
                ComeBack(request,response);
                break;
            case"/UpdateChapterName":
                doPostUpdateChapterName(request,response);
                ServletUtils.redirect("/Teacher/Index",request,response);
                break;
            case"/UpdateChapterVideo":
                doPostUpdateVideo(request,response);
                ServletUtils.redirect("/Teacher/Index",request,response);
                break;
            case "/UpdatePublicOrPrivate":
                doPostPublicOrPrivate(request,response);
                ServletUtils.redirect("/Teacher/Index",request,response);
                break;
            default:
                ServletUtils.redirect("/NotFound",request,response);
                break;
        }
    }
    private void doPostUpdateInformation(HttpServletRequest request,HttpServletResponse response){
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("authUser");
        String information = request.getParameter("information");
        UserModel.UpdateInformation(user.getId(),information);
        updateAuthUser(request,response);
    }
    private void ComeBack(HttpServletRequest request,HttpServletResponse response) throws IOException {
        String url = request.getHeader("referer");
        if(url == null) url="/Home/Index";
        ServletUtils.redirect(url,request,response);
    }
    private void doPostPublicOrPrivate(HttpServletRequest request,HttpServletResponse response)
    {
        int id = Integer.parseInt(request.getParameter("chapterID"));
        Chapter chapter = ChapterModel.findByID(id).get();
        chapter.setPubliOrPrivate(request.getParameter("PoP"));
        ChapterModel.Update(id,chapter);
    }
    private void doPostUpdateVideo(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {

        int chapterID = Integer.parseInt(request.getParameter("chapterID"));
        for (Part part : request.getParts()) {
            String contentDisp = part.getHeader("content-disposition");
            String[] items = contentDisp.split(";");
            for (String s : items) {
                String tmp = s.trim();
                if (tmp.startsWith("filename")) {
                    int idx = tmp.indexOf('.') + 1;
                    String filename = tmp.substring(idx, tmp.length() - 1);

                    String targetDir = this.getServletContext().getRealPath("public/clips");
                    File dir = new File(targetDir);
                    if (!dir.exists()) {
                        dir.mkdir();
                    }
                    List<Map<String,Object>> list = CourseModel.getMaxID();
                    String destination = targetDir + "/" + chapterID +"."+filename;

                    part.write(destination);
                }
            }
        }
    }
    private void doPostUpdateChapterName(HttpServletRequest request, HttpServletResponse response){
        int id = Integer.parseInt(request.getParameter("chapterID"));
        Chapter chapter = ChapterModel.findByID(id).get();
        chapter.setName(request.getParameter("newChaptername"));
        ChapterModel.Update(id,chapter);
    }
    private void doPostUpdateImge(HttpServletRequest request,HttpServletResponse response) throws IOException, ServletException {
        String courseID = request.getParameter("courseID");
        Course course =CourseModel.findByID(Integer.parseInt(courseID)).get();
        course.setUpdateDate(Calendar.getInstance().getTime());
        CourseModel.Update(Integer.parseInt(courseID),course);
        for (Part part : request.getParts()) {
            String contentDisp = part.getHeader("content-disposition");
            String[] items = contentDisp.split(";");
            for (String s : items) {
                String tmp = s.trim();
                if (tmp.startsWith("filename")) {
                    int idx = tmp.indexOf('.') + 1;
                    String filename = tmp.substring(idx, tmp.length() - 1);

                    String targetDir = this.getServletContext().getRealPath("public/image");
                    File dir = new File(targetDir);
                    if (!dir.exists()) {
                        dir.mkdir();
                    }
                    List<Map<String,Object>> list = CourseModel.getMaxID();
                    String destination = targetDir + "/" + courseID +"."+filename;

                    part.write(destination);
                }
            }
        }
    }
    private void doPostUpdateComplete(HttpServletRequest request,HttpServletResponse response)
    {
        int id = Integer.parseInt(request.getParameter("courseID"));
        String cp = request.getParameter("newComplete");
        Course course =CourseModel.findByID(id).get();
        course.setComplete(cp);
        course.setUpdateDate(Calendar.getInstance().getTime());
        CourseModel.Update(id,course);
    }
    private void doPostUpdateCoursePrice(HttpServletRequest request,HttpServletResponse response)
    {
        int id = Integer.parseInt(request.getParameter("courseID"));
        String newPrice = request.getParameter("newPrice");
        Course course =CourseModel.findByID(id).get();
        course.setPrice(Integer.parseInt(newPrice));
        course.setUpdateDate(Calendar.getInstance().getTime());
        CourseModel.Update(id,course);
    }
    private void doPostUpdateCourseCategory(HttpServletRequest request,HttpServletResponse response)
    {
        int id = Integer.parseInt(request.getParameter("courseID"));
        String newCatID = request.getParameter("newCatID");
        Course course =CourseModel.findByID(id).get();
        course.setCatID(Integer.parseInt(newCatID));
        course.setUpdateDate(Calendar.getInstance().getTime());
        CourseModel.Update(id,course);
    }
    private void doPostUpdateFullDes(HttpServletRequest request,HttpServletResponse response)
    {
        int id = Integer.parseInt(request.getParameter("courseID"));
        String fulldes = request.getParameter("newFullDes");
        Course course =CourseModel.findByID(id).get();
        course.setUpdateDate(Calendar.getInstance().getTime());
        course.setFullDes(fulldes);
        CourseModel.Update(id,course);
    }
    private void doPostUpdateTinyDes(HttpServletRequest request,HttpServletResponse response)
    {
        int id = Integer.parseInt(request.getParameter("courseID"));
        String coursename = request.getParameter("newTinyDes");
        Course course =CourseModel.findByID(id).get();
        course.setUpdateDate(Calendar.getInstance().getTime());
        course.setTinyDes(coursename);
        CourseModel.Update(id,course);
    }
    private void doPostUpdateCoursename(HttpServletRequest request,HttpServletResponse response)
    {
        int id = Integer.parseInt(request.getParameter("courseID"));
        String coursename = request.getParameter("newCourseName");
        Course course =CourseModel.findByID(id).get();
        course.setUpdateDate(Calendar.getInstance().getTime());
        course.setCoursename(coursename);
        CourseModel.Update(id,course);
    }
    private  void doPostDeleteCourse(HttpServletRequest request,HttpServletResponse response)
    {
        int id =Integer.parseInt(request.getParameter("courseID"));
        CourseModel.delete(id);

    }
    private  void doPostDeleteChapter(HttpServletRequest request,HttpServletResponse response)
    {
        int id =Integer.parseInt(request.getParameter("chapterID"));
        Course course =CourseModel.findByID(ChapterModel.findByID(id).get().getCourseID()).get();
        course.setUpdateDate(Calendar.getInstance().getTime());
        CourseModel.Update(course.getId(),course);
        ChapterModel.delete(id);

    }
    private void  doPostAddChapter(HttpServletRequest request,HttpServletResponse response) throws IOException, ServletException {
        String name = request.getParameter("chapterName");
        String puclicorprivate = request.getParameter("pop");
        int courseid=Integer.parseInt(request.getParameter("courseID"));
        Date updateDate = Calendar.getInstance().getTime();
        ChapterModel.add(new Chapter(-1,courseid,name,puclicorprivate,updateDate));
        for (Part part : request.getParts()) {
            String contentDisp = part.getHeader("content-disposition");
            String[] items = contentDisp.split(";");
            for (String s : items) {
                String tmp = s.trim();
                if (tmp.startsWith("filename")) {
                    int idx = tmp.indexOf('.') + 1;
                    String filename = tmp.substring(idx, tmp.length() - 1);

                    String targetDir = this.getServletContext().getRealPath("public/clips");
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
        Course course =CourseModel.findByID(courseid).get();
        course.setUpdateDate(Calendar.getInstance().getTime());
        CourseModel.Update(courseid,course);
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
        CourseModel.add(new Course(-1,teacherid,price,catid,complete,coursename,tinydes,fulldes,"true",updateDate));
        for (Part part : request.getParts()) {
            String contentDisp = part.getHeader("content-disposition");
            String[] items = contentDisp.split(";");
            for (String s : items) {
                String tmp = s.trim();
                if (tmp.startsWith("filename")) {
                    int idx = tmp.indexOf('.') + 1;
                    String filename = tmp.substring(idx, tmp.length() - 1);

                    String targetDir = this.getServletContext().getRealPath("public/image");
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
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("authUser");
        if(!user.getOffice().equals("teacher"))
        {
            ServletUtils.redirect("/Information",request,response);
            return;
        }
        switch(path){
            case"/Index":
                List<Course>courses = CourseModel.getAll();
                List<Chapter> chapters = ChapterModel.getAll();
                request.setAttribute("courses",courses);
                request.setAttribute("chapters",chapters);
                ServletUtils.forward("/views/vwTeacher/teacher.jsp",request,response);
                break;
            case "/EditCourse":
                final int LIMIT;
                int currentPage,offset,total,nPages;
                int courseID = Integer.parseInt( request.getParameter("courseID"));
                List<Map<String,Object>> list = CourseModel.GetByID(courseID);
                LIMIT = 5;
                currentPage = 1;
                if(request.getParameter("page") != null){
                    currentPage = Integer.parseInt(request.getParameter("page"));
                }
                offset=(currentPage-1)*LIMIT;
                total = EvaluateModel.getByCourseID(courseID).size();
                nPages = total/LIMIT;
                if(total % LIMIT>0){
                    nPages++;
                }
                int numPage = 2;
                int startPage = currentPage - numPage;
                int endPage = currentPage + numPage;
                if (startPage <= 0)
                {
                    startPage = 1;
                }
                if(endPage > nPages)
                {
                    endPage = nPages;
                }
                int[] PagesE =new int[endPage - startPage +1];
                for(int i = 0,j = startPage;i<endPage - startPage + 1;i++)
                {
                    PagesE[i] = j++;
                }

                List<Chapter> chapterList = ChapterModel.byCourseID((Integer) list.get(0).get("id"));

                request.setAttribute("nPages",nPages);
                request.setAttribute("Pages",PagesE);
                request.setAttribute("currentPage",currentPage);
                request.setAttribute("evaluates", EvaluateModel.getByCourseID(courseID,LIMIT,offset));
                request.setAttribute("courses",list);
                request.setAttribute("chapters",chapterList);
                ServletUtils.forward("/views/vwTeacher/EditCourse.jsp",request,response);
                break;
            default:
                ServletUtils.forward("/NotFound",request,response);
                break;
        }
    }
}
