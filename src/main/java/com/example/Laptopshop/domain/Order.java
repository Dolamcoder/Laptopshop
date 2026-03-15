package com.example.Laptopshop.domain;

import jakarta.persistence.*;

import java.util.List;

@Entity
@Table(name="orders")
public class Order {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    private double totalPrice;
    @ManyToOne
    @JoinColumn(name="user_id")
    private User user;

    //order_detail
    @OneToMany(mappedBy = "order")
    private List<OrderDetail> orderDetails;
    public Order(){}
    public Order(double totalPrice){
        this.totalPrice=totalPrice;
    }
    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public double getTotalPrice() {
        return totalPrice;
    }

    public void setTotalPrice(double totalPrice) {
        this.totalPrice = totalPrice;
    }
}
