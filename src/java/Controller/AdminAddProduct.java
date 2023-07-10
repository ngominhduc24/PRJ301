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
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.http.Part;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.Date;
import java.util.List;
import model.Category;
import model.Product;

/**
 *
 * @author ASUS PC
 */
@WebServlet(name = "AdminAddProduct", urlPatterns = { "/admin/addproduct" })
@MultipartConfig(fileSizeThreshold = 1024 * 1024, maxFileSize = 1024 * 1024 * 5, maxRequestSize = 1024 * 1024 * 5 * 5)
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
         Date date = new Date();
        // This method returns the time in millis
        String timeMilli = String.valueOf(date.getTime());
        
        String name = request.getParameter("name");
        String description = request.getParameter("description");
        String price = request.getParameter("price");
        String status = request.getParameter("status");
        String imgUrl = null;

        String categoryID = request.getParameter("category");

        Part filePart = request.getPart("file");

        String originalFileName = filePart.getSubmittedFileName();

        String rootDirectory = getServletContext().getRealPath("");
        String uploadDirectory = rootDirectory + "public" + File.separator + "img";

        // Tạo tên file mới
        if (filePart != null) {
            if (originalFileName != null && !originalFileName.equals("")) {
                String newFileName = timeMilli + ".png";
                newFileName = newFileName.replace(' ', '_');

                String filePath = uploadDirectory + File.separator + newFileName;
                System.out.println(filePath);
                File file = new File(filePath);

                // Kiểm tra nếu file đã tồn tại
                if (file.exists()) {
                    // Xóa file cũ trước khi lưu file mới
                    file.delete();
                }

                // Lưu file mới lên server
                OutputStream out = null;
                InputStream fileContent = null;
                final PrintWriter writer = response.getWriter();

                try {
                    out = new FileOutputStream(file);
                    fileContent = filePart.getInputStream();

                    int read;
                    final byte[] bytes = new byte[1024];

                    while ((read = fileContent.read(bytes)) != -1) {
                        out.write(bytes, 0, read);
                    }

                    imgUrl = "./public/img/" + newFileName;

                } catch (FileNotFoundException fne) {
                    request.setAttribute("mes", "Upload fail!");
                    response.sendRedirect("addproduct");
                } finally {
                    if (out != null) {
                        out.close();
                    }
                    if (fileContent != null) {
                        fileContent.close();
                    }

                }
            }
        }
        

        try {
            if (name != "" && description != "" && price != "") {
                int statusINT = status == null ? 0 : 1;
                Product product = new Product();
                product.setImage(imgUrl);
                if (imgUrl != null) {
                product.setImage(imgUrl);
                } else {
                    product.setImage("");
                }
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
