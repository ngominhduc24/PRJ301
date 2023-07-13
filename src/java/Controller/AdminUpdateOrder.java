/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package Controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import dal.AccountDAO;
import dal.OrderDAO;
import dal.OrderDetailDAO;
import dal.ProductDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.Account;
import model.OrderDetail;
import model.Orders;
import model.Product;
import utils.NumberToEnum.UserRole;

/**
 *
 * @author ASUS PC
 */
@WebServlet(name = "AdminUpdateOrder", urlPatterns = { "/admin/updateorder" })
public class AdminUpdateOrder extends HttpServlet {

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
            out.println("<title>Servlet AdminUpdateOrder</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet AdminUpdateOrder at " + request.getContextPath() + "</h1>");
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
        AccountDAO accountDAO = new AccountDAO();
        OrderDAO orderDAO = new OrderDAO();
        ProductDAO productDAO = new ProductDAO();
        OrderDetailDAO orderDetailDAO = new OrderDetailDAO();
        int accountID = Integer.parseInt(request.getParameter("accountID"));
        String orderID = request.getParameter("orderID");

        // Get order by ID
        // Check if user is logged in
        if (session.getAttribute("role") == null || (int) session.getAttribute("role") != UserRole.ADMIN.getValue()) {
            response.sendRedirect("login");
            return;
        }

        if (orderID == null || orderID.isEmpty()) {
            response.sendRedirect("404");
            return;
        }
        Orders order = orderDAO.getOrderById(Integer.parseInt(orderID));
        request.setAttribute("order", order);

        // Get account by ID
        Account account = accountDAO.getAccountByID(order.getAccountID());
        if (account == null) {
            response.sendRedirect("adminc");
            return;
        }
        request.setAttribute("account", account);

        // Get order detail by order ID
        try {
            List<OrderDetail> listOrderDetails = new ArrayList<>();
            listOrderDetails = orderDetailDAO.getListOrderDetailByOrderID(Integer.parseInt(orderID));
            for (OrderDetail orderDetail : listOrderDetails) {
                Product product = productDAO.getProductByID(orderDetail.getProductID());
                orderDetail.setProduct(product);
            }
            System.out.println(">>>" + listOrderDetails);
            request.setAttribute("listOrderDetails", listOrderDetails);
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }

        request.getRequestDispatcher("/admin/AdminUpdateOrder.jsp").forward(request, response);
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
        String accountID = request.getParameter("accountID");
        String orderID = request.getParameter("orderID");
        String accountName = request.getParameter("name");
        String accountEmail = request.getParameter("email");
        String accountPhone = request.getParameter("phone");
        String accountAddress = request.getParameter("address");
        String orderDate = request.getParameter("orderdate");
        String orderPrice = request.getParameter("totalprice");
        AccountDAO accountDAO = new AccountDAO();
        OrderDAO orderDAO = new OrderDAO();
        // update account
        Account account = accountDAO.getAccountByID(Integer.parseInt(accountID));
        account.setName(accountName);
        account.setEmail(accountEmail);
        account.setPhone(accountPhone);
        account.setAddress(accountAddress);

        // update order
        Orders order = orderDAO.getOrderById(Integer.parseInt(orderID));
        order.setAddress(accountAddress);
        order.setOrderDate(orderDate);
        order.setTotalPrice(Integer.parseInt(orderPrice));

        if (accountDAO.updateInfo(account) && orderDAO.updateOrder(order)) {
            response.sendRedirect("updateorder?orderID=" + orderID + "&successmessage=success");
            return;
        }

        response.sendRedirect("updateorder?orderID=" + orderID + "&failmessage=fail");
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
