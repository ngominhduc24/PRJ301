/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package Controller;

import java.io.IOException;
import java.io.PrintWriter;

import dal.AccountDAO;
import dal.OrderDAO;
import dal.OrderDetailDAO;
import dal.ProductDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.List;
import model.OrderDetail;
import model.Orders;
import model.Product;
import model.Bill;

/**
 *
 * @author ASUS PC
 */
@WebServlet(name = "InvoiceServlet", urlPatterns = { "/account" })
public class AccountServlet extends HttpServlet {

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
            out.println("<title>Servlet InvoiceServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet InvoiceServlet at " + request.getContextPath() + "</h1>");
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
            AccountDAO accountDAO = new AccountDAO();
            Cookie[] cookies = request.getCookies();
            OrderDAO orderDAO = new OrderDAO();
            ProductDAO productDAO = new ProductDAO();
            List<Orders> listOrders = new ArrayList<>();
            int accountID = -1;

            // get id from cookie
            for (Cookie cookie : cookies) {
                if (cookie.getName().equals("email")) {
                    accountID = accountDAO.getAccountIDByEmail(cookie.getValue());
                }
            }

            // get list order from database
            listOrders = orderDAO.getListOrderByAccountID(accountID);

            // get list order detail from database
            List<OrderDetail> listOrderDetail = new ArrayList<>();
            for (Orders order : listOrders) {
                listOrderDetail.addAll(new OrderDetailDAO().getListOrderDetailByOrderID(order.getOrderID()));

                // get product from database and set to order detail
                for (OrderDetail orderDetail : listOrderDetail) {
                    Product product = productDAO.getProductByID(orderDetail.getProductID());
                    orderDetail.setProduct(product);
                }
                // set list order detail to order
                order.setListOrderDetail(listOrderDetail);

                // clear list order detail
                listOrderDetail = new ArrayList<>();
            }

            // print all order detail
            for (Orders order : listOrders) {
                System.out.println("OrderID: " + order.getOrderID());
                for (OrderDetail orderDetail : order.getListOrderDetails()) {
                    System.out.println(orderDetail.getProduct().getName());
                }
            }

            // get account from database
            request.setAttribute("listOrders", listOrders);
            request.setAttribute("account", accountDAO.getAccountByID(accountID));

            request.getRequestDispatcher("account.jsp").forward(request, response);
        } catch (Exception e) {
            System.out.println(e);
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
