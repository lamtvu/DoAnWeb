package controllers;

import at.favre.lib.crypto.bcrypt.BCrypt;
import beans.User;
import models.UserModel;
//import org.graalvm.compiler.core.common.type.ArithmeticOpTable;
import utils.ServletUtils;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Optional;

@WebServlet(name = "AccountServlet",urlPatterns="/Account/*")
public class AccountServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String path = request.getPathInfo();
        switch (path){
            case "/Register":
                AddUser(request);
                ServletUtils.redirect("/Account/Login",request,response);
                break;
            case"/Login":
                postLogin(request,response);
                break;
            case "/Logout":
                PostLogout(request,response);
                break;
            default:
                ServletUtils.redirect("/NotFound",request,response);
                break;
        }
    }
    private void PostLogout(HttpServletRequest request,HttpServletResponse response) throws IOException {
        HttpSession session = request.getSession();
        session.setAttribute("auth",null);
        session.setAttribute("authUser",new User());

//        ServletUtils.redirect("/Account/Login",request,response);
        String url = request.getHeader("referer");
        if(url == null) url="/Home/Index";
        ServletUtils.redirect(url,request,response);
    }
    private  void postLogin(HttpServletRequest request,HttpServletResponse response) throws IOException, ServletException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        Optional<User> user = UserModel.FindByUserName(username);
        if(user.isPresent()){
            System.out.println(user.get().getEnable());
            if(user.get().getEnable().equals("false")){
                request.setAttribute("hasError",true);
                request.setAttribute("errorMessage","username is disable");
                ServletUtils.forward("/views/vwAccount/login.jsp",request,response);
            }
            else{
                BCrypt.Result result = BCrypt.verifyer().verify(password.toCharArray(),user.get().getPassword());
                if (result.verified){
                    HttpSession session = request.getSession();
                    session.setAttribute("auth",true);
                    session.setAttribute("authUser",user.get());

                    String url = (String) session.getAttribute("retUrl");
                    if (url == null) url = "/Home";
                    ServletUtils.redirect(url, request, response);
                }
                else {
                    request.setAttribute("hasError",true);
                    request.setAttribute("errorMessage","Invalid Password");
                    ServletUtils.forward("/views/vwAccount/login.jsp",request,response);
                }

            }
        }
        else {
            request.setAttribute("hasError",true);
            request.setAttribute("errorMessage","Invalid username");
            ServletUtils.forward("/views/vwAccount/login.jsp",request,response);
        }


    }
    private void AddUser(HttpServletRequest request){
       String username = request.getParameter("username");
       String password = request.getParameter("password");
       String bcryptHashString = BCrypt.withDefaults().hashToString(12, password.toCharArray());
       String name = request.getParameter("name");
       String email = request.getParameter("email");
        UserModel.Add(new User(-1,username,bcryptHashString,name,email,"student","true",""));
    }
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String path = request.getPathInfo();
        switch (path){
            case "/Register":

                ServletUtils.forward("/views/vwAccount/register.jsp",request,response);
                break;
            case "/Login":
                request.setAttribute("hasError",false);
                ServletUtils.forward("/views/vwAccount/login.jsp",request,response);
                break;
            case"/IsExistUsername":
                String username = request.getParameter("username");
                Optional<User> user = UserModel.FindByUserName(username);
                PrintWriter out = response.getWriter();
                response.setContentType("application/json");
                response.setCharacterEncoding("utf-8");
                out.print(user.isPresent());
                out.flush();
                break;
            case"/IsExistEmail":
                String email = request.getParameter("email");
                Optional<User> userE = UserModel.FindByEmail(email);
                PrintWriter outp = response.getWriter();
                response.setContentType("application/json");
                response.setCharacterEncoding("utf-8");
                outp.print(userE.isPresent());
                outp.flush();
                break;
            case"/IsEqualAuthUserPassword":
                HttpSession session = request.getSession();
                User authUser = (User) session.getAttribute("authUser");
                String password = request.getParameter("password");
                BCrypt.Result result = BCrypt.verifyer().verify(password.toCharArray(),authUser.getPassword());
                PrintWriter content = response.getWriter();
                response.setContentType("application/json");
                response.setCharacterEncoding("utf-8");
                content.print(result.verified);
                content.flush();
                break;
            default:
                ServletUtils.redirect("/notFound",request,response);
                break;
        }

    }
}
