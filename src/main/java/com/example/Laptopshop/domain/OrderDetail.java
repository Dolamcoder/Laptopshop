package com.example.Laptopshop.domain;

import jakarta.persistence.*;

@Entity
public class OrderDetail {
    @Id @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    private Long quantity;
    private double price;
    //order_id
    @ManyToOne
    @JoinColumn(name="order_id")
    private Order order;
    //product_id
    @ManyToOne
    @JoinColumn(name="product_id")
    private Product product;
    public OrderDetail(){}
    public OrderDetail( Long quantity, double price, Order order, Product product) {
        this.quantity = quantity;
        this.price = price;
        this.order = order;
        this.product = product;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Long getQuantity() {
        return quantity;
    }

    public void setQuantity(Long quantity) {
        this.quantity = quantity;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public Order getOrder() {
        return order;
    }

    public void setOrder(Order order) {
        this.order = order;
    }

    public Product getProduct() {
        return product;
    }

    public void setProduct(Product product) {
        this.product = product;
    }

    @Override
    public String toString() {
        return "OrderDetail{" +
                "id=" + id +
                ", quantity=" + quantity +
                ", price=" + price +
                ", order=" + order +
                ", product=" + product +
                '}';
    }
}
