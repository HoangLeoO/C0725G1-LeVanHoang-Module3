package org.example.manager_prodcut.repository;

import org.example.manager_prodcut.entity.Product;

import java.util.List;

public interface IProductRepository {
    List<Product> getAll();
    Product getProductById(int id);
    void addProduct(Product product);
    void updateProduct(Product product);
    void deleteProduct(int id);
}
