package org.example.manager_prodcut.service;

import org.example.manager_prodcut.entity.Product;

import java.util.List;

public interface IProductService {
    List<Product> getAll();
    Product getProductById(int id);
    void addProduct(Product product);
    void updateProduct(Product product);
    void deleteProduct(int id);
}
