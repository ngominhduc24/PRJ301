/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package Controller;

import dal.AccountDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import utils.Validate;
import utils.NumberToEnum.UserRole;
import model.Account;

/**
 *
 * @author ASUS PC
 */
@WebServlet(name = "SignupServlet", urlPatterns = { "/signup" })
public class SignupServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     * 
     * @param request  servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException      if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet SignupServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet SignupServlet at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the
    // + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     * 
     * @param request  servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException      if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("/signup.jsp").forward(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     * 
     * @param request  servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException      if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            HttpSession session = request.getSession();
            session.removeAttribute("signupmessage");
            String url = request.getParameter("urlsignup");
            if (url == null) {
                url = "home?page=1";
            }

            // get data from form
            String name = request.getParameter("signup_name").trim();
            String email = request.getParameter("signup_email").trim();
            String phone = request.getParameter("signup_phone").trim();
            String address = request.getParameter("signup_address").trim();
            String password = request.getParameter("signup_password");
            String repassword = request.getParameter("signup_repassword");
            String checkbox = request.getParameter("signup_checkbox");

            // validate data
            if (name.isEmpty() || email.isEmpty() || phone.isEmpty() || password.isEmpty() || repassword.isEmpty()
                    || address.isEmpty()) {
                session.setAttribute("signupmessage", "Please fill all the fields");
                response.sendRedirect(url);
                // request.getRequestDispatcher("/signup.jsp").forward(request, response);

            } else if (Validate.isEmail(email) == false) {
                session.setAttribute("signupmessage", "Email is not valid");
                request.getRequestDispatcher("/signup.jsp").forward(request, response);

            } else if (Validate.isPhoneNumber(phone) == false) {
                session.setAttribute("signupmessage", "Phone is not valid");
                request.getRequestDispatcher("/signup.jsp").forward(request, response);
            } else if (Validate.isPassword(password) == false) {
                session.setAttribute("signupmessage", "Password is not valid");
                request.getRequestDispatcher("/signup.jsp").forward(request, response);

            } else if (checkbox == null) {
                session.setAttribute("signupmessage", "Please agree to the terms and conditions");
                request.getRequestDispatcher("/signup.jsp").forward(request, response);
            } else if (!password.equals(repassword)) {
                session.setAttribute("signupmessage", "Password and Re-Password must be same");
                request.getRequestDispatcher("/signup.jsp").forward(request, response);

            } else {
                Account account = new Account(email, password, name, phone, address, UserRole.USER.getValue());
                AccountDAO accountDAO = new AccountDAO();
                if (accountDAO.createAccount(account) == null) {
                    session.setAttribute("signupmessage", "Email already exists");
                    request.getRequestDispatcher("/signup.jsp").forward(request, response);

                } else if (session.getAttribute("signupmessage") != null) {
                    Cookie cookie = new Cookie("email", email);
                    cookie.setMaxAge(60 * 60 * 24);
                    response.addCookie(cookie);

                    session.removeAttribute("loginmessage");
                    session.setAttribute("role", "user");
                    response.sendRedirect("checkout");
                } else {
                    session.setAttribute("role", "user");
                    request.getRequestDispatcher("/home").forward(request, response);
                }

            }
        } catch (Exception e) {
            response.sendRedirect("home");
        }

    }

    /**
     * Returns a short description of the servlet.
     * 
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
