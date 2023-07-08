/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package Controller;

import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import dal.CategoryDAO;
import dal.ProductDAO;
import java.util.List;
import model.Category;
import model.Product;

/**
 *
 * @author ASUS PC
 */
@WebServlet(name = "AdminAddProduct", urlPatterns = { "/admin/addproduct" })
public class AdminAddProduct extends HttpServlet {

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
            out.println("<title>Servlet AdminAddProduct</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet AdminAddProduct at " + request.getContextPath() + "</h1>");
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

        try {
            // get all category
            CategoryDAO categoryDAO = new CategoryDAO();
            List<Category> listCategory = categoryDAO.getAllCategory();
            request.setAttribute("listCategory", listCategory);

            request.getRequestDispatcher("AdminAddProduct.jsp").forward(request, response);
        } catch (ServletException | IOException | NumberFormatException e) {
            response.sendRedirect("home");
        }

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
        ProductDAO productDAO = new ProductDAO();
        String image = request.getParameter("image");
        String name = request.getParameter("name");
        String description = request.getParameter("description");
        String price = request.getParameter("price");
        String status = request.getParameter("status");

        String categoryID = request.getParameter("category");

        try {
            if (image != "" && name != "" && description != "" && price != "") {
                int statusINT = status == null ? 0 : 1;
                Product product = new Product();
                product.setImage(image);
                product.setName(name);
                product.setDescription(description);
                product.setPrice(Integer.parseInt(price));
                product.setStatus(statusINT);

                product.setCategoryID(Integer.parseInt(categoryID));

                if (productDAO.insertProduct(product)) {
                    response.sendRedirect("home");
                } else {
                    response.sendRedirect("home");
                }
            }
        } catch (Exception e) {
            // response.sendRedirect("home");
        }
        // response.sendRedirect("addproduct");
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
