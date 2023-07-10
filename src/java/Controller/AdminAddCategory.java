/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package Controller;

import dal.CategoryDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.List;
import model.Category;
import java.util.Date;

/**
 *
 * @author ASUS PC
 */
@WebServlet(name = "AdminAddCatefory", urlPatterns = { "/admin/addcategory" })
@MultipartConfig(fileSizeThreshold = 1024 * 1024, maxFileSize = 1024 * 1024 * 5, maxRequestSize = 1024 * 1024 * 5 * 5)
public class AdminAddCategory extends HttpServlet {

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
            out.println("<title>Servlet AdminAddCatefory</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet AdminAddCatefory at " + request.getContextPath() + "</h1>");
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

            request.getRequestDispatcher("AdminAddCategory.jsp").forward(request, response);
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
        CategoryDAO categoryDAO = new CategoryDAO();
        Date date = new Date();
        // This method returns the time in millis
        String timeMilli = String.valueOf(date.getTime());
        Category category = new Category();
        String imgUrl = null;
        String categoryName = request.getParameter("categoryname");

        Part filePart = request.getPart("file");
        String originalFileName = filePart.getSubmittedFileName();

        String rootDirectory = getServletContext().getRealPath("");
        String uploadDirectory = rootDirectory + File.separator + "public" + File.separator + "img";

        // Tạo tên file mới
        if (filePart != null) {
            if (originalFileName != null && !originalFileName.equals("")) {
                String newFileName = timeMilli + originalFileName.substring(originalFileName.lastIndexOf("."));
                newFileName = newFileName.replace(' ', '_');

                String filePath = uploadDirectory + File.separator + newFileName;
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
                    response.sendRedirect("addcategory");
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

        // save to database
        try {
            category.setName(categoryName);
            if (imgUrl != null) {
                category.setImage(imgUrl);
            } else {
                category.setImage("");
            }
            categoryDAO.insertCategory(category);
            response.sendRedirect("addcategory");
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
