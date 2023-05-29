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
import java.util.List;
import java.sql.Date;

import dal.AccountDAO;
import dal.OrderDAO;
import dal.OrderDetailDAO;
import model.Account;
import model.OrderDetail;
import model.Orders;
import model.Product;
import utils.HandleCookie;

/**
 *
 * @author ASUS PC
 */
@WebServlet(name = "PurchaseOrderServlet", urlPatterns = { "/checkout" })
public class Checkout extends HttpServlet {

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
            out.println("<title>Servlet PurchaseOrderServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet PurchaseOrderServlet at " + request.getContextPath() + "</h1>");
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
        Cookie[] cookies = request.getCookies();
        // get cart and email from cookie
        String cart = "";
        String email = "";
        for (Cookie cookie : cookies) {
            if (cookie.getName().equals("cart")) {
                cart = cookie.getValue();
            }
            if (cookie.getName().equals("email")) {
                email = cookie.getValue();
            }
        }
        List<Product> products = HandleCookie.CookieToProduct(cart);

        // get data user
        if (email != null) {
            AccountDAO accountDAO = new AccountDAO();
            Account user = accountDAO.getAccountByEmail(email);
            request.setAttribute("user", user);
        } else {
            request.setAttribute("user", null);
        }

        request.setAttribute("data", products);
        request.getRequestDispatcher("checkout.jsp").forward(request, response);
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
        Cookie[] cookies = request.getCookies();
        AccountDAO accountDAO = new AccountDAO();
        Orders order = new Orders();
        String email = request.getParameter("email");
        int accountID = accountDAO.getIdByEmail(email);
        Date date = new Date(System.currentTimeMillis());

        // get cart and email from cookie
        String cart = "";
        for (Cookie cookie : cookies) {
            if (cookie.getName().equals("cart")) {
                cart = cookie.getValue();
            }
        }

        // get data order from request

        order.setAccountID(accountID);
        order.setOrderDate(date);
        order.setAddress(request.getParameter("address"));
        order.setTotalPrice(Integer.parseInt(request.getParameter("totalPrice")));
        order.setStatus(0);
        OrderDAO orderDAO = new OrderDAO();
        System.out.println("order id: " + order.getOrderID());
        System.out.println("account id: " + order.getAccountID());
        System.out.println("order date: " + order.getOrderDate());
        System.out.println("address: " + order.getAddress());
        System.out.println("total price: " + order.getTotalPrice());
        System.out.println("status: " + order.getStatus());
        // save order to database
        int orderID = orderDAO.insertOrder(order);

        // save list order detail to database
        List<OrderDetail> listOrderDetails = HandleCookie.CookieToOrderDetail(cart, orderID);
        OrderDetailDAO orderDetailDAO = new OrderDetailDAO();
        for (OrderDetail orderDetail : listOrderDetails) {
            orderDetailDAO.insertOrderDetail(orderDetail);
        }

        // delete cookie
        Cookie cookie = new Cookie("cart", "");
        cookie.setMaxAge(0);
        response.addCookie(cookie);

        request.getRequestDispatcher("success.jsp").forward(request, response);
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
