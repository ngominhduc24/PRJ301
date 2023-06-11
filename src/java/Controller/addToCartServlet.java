/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package Controller;

import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 *
 * @author ASUS PC
 */
@WebServlet(name = "addToCartServlet", urlPatterns = { "/addtocart" })
public class AddToCartServlet extends HttpServlet {

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
        String productID = request.getParameter("productID");
        Cookie[] cookies = request.getCookies();
        String cart = "";
        for (Cookie cookie : cookies) {
            if (cookie.getName().equals("cart")) {
                cart = cookie.getValue();
                cookie.setMaxAge(0);
                response.addCookie(cookie);
                break;
            }
        }
        System.out.println("check" + cart);
        if (cart.isEmpty()) {
            cart = productID + ":" + 1;
        } else {
            String[] products = cart.split("/");
            boolean isExist = false;
            for (int i = 0; i < products.length; i++) {
                String[] product = products[i].split(":");
                if (product[0].equals(productID)) {
                    int quantity = Integer.parseInt(product[1]) + 1;
                    products[i] = productID + ":" + quantity;
                    isExist = true;
                    break;
                }
            }
            cart = products[0];
            for (int i = 1; i < products.length; i++) {
                cart += "/" + products[i];
            }
            if (!isExist) {
                cart += "/" + productID + ":" + 1;
            }
        }
        Cookie cookie = new Cookie("cart", cart);
        cookie.setMaxAge(60 * 60 * 24);
        response.addCookie(cookie);
        response.sendRedirect("home");
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
