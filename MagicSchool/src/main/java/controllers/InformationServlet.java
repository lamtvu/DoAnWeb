package controllers;

import beans.User;
import utils.ServletUtils;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet(name = "InformationServlet",urlPatterns="/Information/*")
public class InformationServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        User user = (User)session.getAttribute("authUser");
        System.out.println(user.getOffice());
        String office = user.getOffice();
        if(office.equals("teacher"))
        {
            ServletUtils.redirect("/Teacher/Index",request,response);
        }
        if(office.equals("student"))
        {
            ServletUtils.redirect("/Student/Index",request,response);
        }
        if(office.equals("admin"))
        {
            ServletUtils.redirect("/Admin/Index",request,response);
        }

    }
}
