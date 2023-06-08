/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package Controller;

import dal.ProductDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.util.ArrayList;
import java.util.List;
import model.Product;
import dal.CategoryDAO;
import model.Category;
import utils.HandleCookie;

/**
 *
 * @author ASUS PC
 */
@WebServlet(name = "DisplayProductServlet", urlPatterns = { "/home" })
public class HomeServlet extends HttpServlet {

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
        ProductDAO productDAO = new ProductDAO();
        List<Product> listProduct = new ArrayList<>();
        Cookie[] cookies = request.getCookies();

        // delete session if login fail
        if (request.getSession().getAttribute("loginmessage") != null) {
            request.getSession().removeAttribute("loginmessage");
            request.setAttribute("loginmessage", "email or password is incorrect!");
        }

        // check if cookie have email and password then set attribute loginmessage = ""
        for (Cookie cookie : cookies) {
            if (cookie.getName().equals("email")) {
                for (Cookie cookie2 : cookies) {
                    if (cookie2.getName().equals("password")) {
                        request.setAttribute("loginmessage", "");
                        break;
                    }
                }
            }
        }

        // get category list
        CategoryDAO categoryDAO = new CategoryDAO();
        List<Category> listCategory = categoryDAO.getAllCategory();
        request.setAttribute("listCategory", listCategory);

        // paging product list
        String page = request.getParameter("page") != null ? request.getParameter("page") : "1";
        int page_size = 8;
        int start_product = 0;
        try {
            start_product = Integer.parseInt(page) * page_size - page_size;
        } catch (Exception e) {
            System.out.println(e);
        }

        // count product
        int countProduct = 0;
        for (Cookie cookie : cookies) {
            if (cookie.getName().equals("cart")) {
                countProduct = HandleCookie.CookieToProduct(cookie.getValue()).size();
            }
        }
        request.setAttribute("countProduct", countProduct);

        // get product list
        String categoryID = request.getParameter("category");
        String search = request.getParameter("search");
        if (categoryID == null && search == null) {
            listProduct = productDAO.getProductByPage(start_product, page_size);
        } else if (search != null) {
            listProduct = productDAO.searchProduct(start_product, page_size, search);
        } else {
            listProduct = productDAO.getProductByPage(start_product, page_size, categoryID);
        }

        // render product list
        if (listProduct != null) {
            request.setAttribute("data", listProduct);
            request.getRequestDispatcher("home.jsp").forward(request, response);
        } else {
            request.setAttribute("error", "Error");
            request.getRequestDispatcher("index.html").forward(request, response);
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
        processRequest(request, response);
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
        processRequest(request, response);
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
