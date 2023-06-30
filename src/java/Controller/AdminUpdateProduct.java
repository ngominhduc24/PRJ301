/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package Controller;

import dal.CategoryDAO;
import dal.ProductDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Category;
import model.Product;
import java.util.List;

/**
 *
 * @author ASUS PC
 */
@WebServlet(name = "AdminUpdateProduct", urlPatterns = { "/admin/updateproduct" })
public class AdminUpdateProduct extends HttpServlet {

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
            out.println("<title>Servlet AdminUpdateProduct</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet AdminUpdateProduct at " + request.getContextPath() + "</h1>");
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
            // get product by id
            int productID = Integer.parseInt(request.getParameter("pid"));
            ProductDAO productDAO = new ProductDAO();
            Product product = productDAO.getProductByID(productID);
            request.setAttribute("product", product);

            // get all category
            CategoryDAO categoryDAO = new CategoryDAO();
            List<Category> listCategory = categoryDAO.getAllCategory();
            request.setAttribute("listCategory", listCategory);

            request.getRequestDispatcher("AdminUpdateProduct.jsp").forward(request, response);
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

        String productID = request.getParameter("productID");
        String image = request.getParameter("image");
        String name = request.getParameter("name");
        String description = request.getParameter("description");
        String price = request.getParameter("price");
        String status = request.getParameter("status");

        String categoryID = request.getParameter("category");

        try {
            if (productID != "" && image != "" && name != "" && description != "" && price != "") {
                int statusINT = status == null ? 0 : 1;
                Product product = new Product(Integer.parseInt(productID), name, Integer.parseInt(price), description,
                        image, 0, statusINT);
                product.setCategoryID(Integer.parseInt(categoryID));
                System.out.println(product.getCategoryID());

                if (productDAO.updateProduct(product)) {
                    // update category success
                }
            }
        } catch (Exception e) {
            // response.sendRedirect("home");
        }
        response.sendRedirect("updateproduct?pid=" + productID);

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
