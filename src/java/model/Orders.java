/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.sql.Date;
import java.util.ArrayList;
import java.util.List;

import utils.Validate;

/**
 *
 * @author ASUS PC
 */
public class Orders {
    private int orderID;
    private int accountID;
    private Date orderDate;
    private String address;
    private int totalPrice;
    private int status;
    private List<OrderDetail> orderDetails;

    public Orders() {
    }

    public Orders(int orderID, int accountID, Date orderDate, String address, int totalPrice, int status) {
        this.orderID = orderID;
        this.accountID = accountID;
        this.orderDate = orderDate;
        this.address = address;
        this.status = status;
        this.totalPrice = totalPrice;
    }

    public Orders(int orderID, int accountID, Date orderDate, String address, int totalPrice, int status,
            List<OrderDetail> orderDetails) {
        this.orderID = orderID;
        this.accountID = accountID;
        this.orderDate = orderDate;
        this.address = address;
        this.status = status;
        this.totalPrice = totalPrice;
        this.orderDetails = orderDetails;
    }

    public int getOrderID() {
        return orderID;
    }

    public void setOrderID(int orderID) {
        this.orderID = orderID;
    }

    public int getAccountID() {
        return accountID;
    }

    public void setAccountID(int accountID) {
        this.accountID = accountID;
    }

    public Date getOrderDate() {
        return orderDate;
    }

    public void setOrderDate(Date orderDate) {
        this.orderDate = orderDate;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public int getTotalPrice() {
        return totalPrice;
    }

    public void setTotalPrice(int totalPrice) {
        this.totalPrice = totalPrice;
    }

    public List<OrderDetail> getListOrderDetails() {
        if (orderDetails == null) {
            orderDetails = new ArrayList<>();
        }
        return orderDetails;
    }

    public void setListOrderDetail(List<OrderDetail> orderDetails) {
        this.orderDetails = orderDetails;
    }

    public int getTotalPriceOrder() {
        int total = 0;
        for (OrderDetail orderDetail : getListOrderDetails()) {
            total += orderDetail.getTotalPrice();
        }
        return total;
    }

    public String getMonth() {
        String[] date = orderDate.toString().split("-");
        return Validate.convertToMonth(date[1]) + " " + date[2] + ", " + date[0];
    }

    @Override
    public String toString() {
        return "Orders{" + "orderID=" + orderID + ", accountID=" + accountID + ", orderDate=" + orderDate + ", address="
                + address + ", status=" + status + '}';
    }
}
