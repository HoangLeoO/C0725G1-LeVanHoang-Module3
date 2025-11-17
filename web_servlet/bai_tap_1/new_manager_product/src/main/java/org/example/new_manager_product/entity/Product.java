package org.example.new_manager_product.entity;

public class Product {
    private int id_product;
    private String name_product;
    private double price;
    private int id_category;

    public Product() {
    }

    public Product(int id_product, String name_product, double price, int id_category) {
        this.id_product = id_product;
        this.name_product = name_product;
        this.price = price;
        this.id_category = id_category;
    }

    public Product(String name_product, double price, int id_category) {
        this.name_product = name_product;
        this.price = price;
        this.id_category = id_category;
    }

    public int getId_product() {
        return id_product;
    }

    public void setId_product(int id_product) {
        this.id_product = id_product;
    }

    public String getName_product() {
        return name_product;
    }

    public void setName_product(String name_product) {
        this.name_product = name_product;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public int getId_category() {
        return id_category;
    }

    public void setId_category(int id_category) {
        this.id_category = id_category;
    }
}
