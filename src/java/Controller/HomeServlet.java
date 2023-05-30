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
        String page = request.getParameter("page");
        ProductDAO productDAO = new ProductDAO();
        List<Product> listProduct = new ArrayList<>();

        // get category list
        CategoryDAO categoryDAO = new CategoryDAO();
        List<Category> listCategory = categoryDAO.getAllCategory();
        request.setAttribute("listCategory", listCategory);

        // paging product list
        int page_size = 8;
        int start_product = 0;
        try {
            start_product = Integer.parseInt(page) * page_size - page_size;
            // int total = productDAO.count();
            // int total_page = (total % page_size == 0) ? total / page_size : total /
            // page_size + 1;
        } catch (Exception e) {
            System.out.println(e);
        }

        // get product list
        String categoryID = request.getParameter("category");
        String search = request.getParameter("search");
        System.out.println(search);
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
