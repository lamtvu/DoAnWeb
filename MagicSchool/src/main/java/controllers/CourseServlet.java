package controllers;

import beans.Chapter;
import beans.Course;
import beans.User;
import models.ChapterModel;
import models.CourseModel;
import models.EvaluateModel;
import utils.ServletUtils;
import javax.servlet.annotation.WebServlet;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.*;

@WebServlet(name = "CourseServlet", urlPatterns = "/Course/*")
public class CourseServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String path = request.getPathInfo();
        final int LIMIT;
        int currentPage,offset,total,nPages;
        switch (path){
            case "/Detail":

                HttpSession session = request.getSession();
                User user = (User) session.getAttribute("authUser");
                int courseID = Integer.parseInt(request.getParameter("id"));
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
                request.setAttribute("nPages",nPages);
                request.setAttribute("Pages",PagesE);
                request.setAttribute("currentPage",currentPage);
                request.setAttribute("evaluates", EvaluateModel.getByCourseID(courseID,LIMIT,offset));
                List<Chapter> chapterList = ChapterModel.byCourseID((Integer) list.get(0).get("id"));
                request.setAttribute("isWatchList",CourseModel.IsOnWatchList(user.getId(),(Integer) list.get(0).get("id")));
                request.setAttribute("isOwnlist",CourseModel.IsHas(user.getId(),(Integer) list.get(0).get("id")));
                request.setAttribute("myEvaluate",EvaluateModel.getByCourseIDAndUserID(courseID,user.getId()));
                request.setAttribute("courses",list);
                request.setAttribute("chapters",chapterList);
                ServletUtils.forward("/views/vwProduct/Detail.jsp", request, response);
                break;



            case "/ByCat":
                int catID = Integer.parseInt(request.getParameter("id"));
//                List<Map<String,Object>> list1 = CourseModel.GetByCat(catID);

                request.setAttribute("CatIDd",catID);
                LIMIT = 4;
                currentPage = 1;
                if(request.getParameter("page") != null){
                    currentPage = Integer.parseInt(request.getParameter("page"));
                }
                offset = (currentPage - 1) * LIMIT;
                request.setAttribute("currentPage",currentPage);
                total = CourseModel.countByCatID(catID);
//                System.out.println(total);
                nPages = total/LIMIT;
                if (total % LIMIT > 0)
                    nPages++;
                int[] pages = new int[nPages];
                for(int i=0;i<nPages;i++){
                    pages[i] = i+1;
                }
                request.setAttribute("pages",pages);

                List<Map<String,Object>> list1 = CourseModel.GetByCat(catID,LIMIT,offset);
                request.setAttribute("categories",list1);
                ServletUtils.forward("/views/vwProduct/CourseByCat.jsp",request,response);
                break;

            case "/ByCourse":
                String namecourse = "";
                namecourse = request.getParameter("search");
                request.setAttribute("CatIDd",namecourse);

                final int LIMIT1 = 4;
                int currentPage1 = 1;
                if(request.getParameter("page") != null){
                    currentPage1 = Integer.parseInt(request.getParameter("page"));
                }
                int offset1 = (currentPage1 - 1) * LIMIT1;
                request.setAttribute("currentPage",currentPage1);
                int total1 = CourseModel.countByName(namecourse);
                System.out.println(total1);

                int nPages1 = total1/LIMIT1;
                if (total1 % LIMIT1 > 0)
                    nPages1++;
                int[] pages1 = new int[nPages1];
                for(int i=0;i<nPages1;i++){
                    pages1[i] = i+1;
                }
                request.setAttribute("pages",pages1);

//                List<Map<String,Object>> list2 = CourseModel.GetByName(namecourse);

                List<Map<String,Object>> list3 = CourseModel.GetNameCourse(namecourse,LIMIT1,offset1);
                request.setAttribute("coursename",list3);
                ServletUtils.forward("/views/vwProduct/CourseByName.jsp",request,response);
                break;
            default:
                ServletUtils.redirect("/NotFound", request, response);
                break;
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String path = request.getPathInfo();
        switch (path)
        {
            case"/AddEvaluate":
                doPostAddEvaluate(request,response);
                break;
            case"/UpdateEvaluate":
                doPostUpdateEvaluate(request,response);
                break;
            default:
                break;
        }
    }
    private void doPostAddEvaluate(HttpServletRequest request,HttpServletResponse response) throws IOException {
        HttpSession session = request.getSession();
        User user =(User) session.getAttribute("authUser");
        String feedback = request.getParameter("feedback");
        int point =Integer.parseInt( request.getParameter("point"));
        int courseID =Integer.parseInt( request.getParameter("courseID"));
        Date date = Calendar.getInstance().getTime();
        EvaluateModel.add(user.getId(),courseID,point,feedback,date);
        String url = request.getHeader("referer");
        if(url == null) url="/Home/Index";
        ServletUtils.redirect(url,request,response);
    }
    private void doPostUpdateEvaluate(HttpServletRequest request,HttpServletResponse response) throws IOException {
        HttpSession session = request.getSession();
        User user =(User) session.getAttribute("authUser");
        String feedback = request.getParameter("feedback");
        int point =Integer.parseInt( request.getParameter("point"));
        int courseID =Integer.parseInt( request.getParameter("courseID"));
        EvaluateModel.Update(user.getId(),courseID,point,feedback);
        String url = request.getHeader("referer");
        if(url == null) url="/Home/Index";
        ServletUtils.redirect(url,request,response);
    }

}
