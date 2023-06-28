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
import jakarta.servlet.http.HttpSession;
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
        HttpSession session = request.getSession();

        // check login or not
        if (session.getAttribute("role") == null) {
            session.setAttribute("loginmessage", "You must login to checkout");
            response.sendRedirect("cart");
            return;
        }

        // get cart and email from cookie
        Cookie[] cookies = request.getCookies();
        String cart = "";
        for (Cookie cookie : cookies) {
            if (cookie.getName().equals("cart")) {
                cart = cookie.getValue();
            }
        }
        // if cart is empty, redirect to cart
        if (cart.equals("")) {
            response.sendRedirect("cart");
            return;
        }
        // get list product from cookie
        List<Product> products = HandleCookie.CookieToProduct(cart);

        // get data user
        Account user = (Account) session.getAttribute("account");
        request.setAttribute("user", user);

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
        HttpSession session = request.getSession();

        if (session.getAttribute("role") == null) {
            session.setAttribute("loginmessage", "You must login to checkout");
            response.sendRedirect("cart");
            return;
        }

        Cookie[] cookies = request.getCookies();
        AccountDAO accountDAO = new AccountDAO();
        Orders order = new Orders();
        String email = request.getParameter("email");

        Account account = (Account) session.getAttribute("account");

        // get cart and email from cookie
        String cart = "";
        for (Cookie cookie : cookies) {
            if (cookie.getName().equals("cart")) {
                cart = cookie.getValue();
            }
        }

        // get data order from request
        order.setAccountID(account.getAccountID());
        order.setOrderDate(new Date(System.currentTimeMillis()));
        order.setAddress(request.getParameter("address"));
        order.setTotalPrice(Integer.parseInt(request.getParameter("totalPrice")));
        order.setStatus(0);
        OrderDAO orderDAO = new OrderDAO();

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

        response.sendRedirect("account");
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
