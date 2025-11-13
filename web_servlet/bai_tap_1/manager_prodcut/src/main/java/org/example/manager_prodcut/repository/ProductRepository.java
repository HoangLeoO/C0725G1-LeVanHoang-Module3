package org.example.manager_prodcut.repository;

import org.example.manager_prodcut.entity.Product;

import java.util.ArrayList;
import java.util.List;

public class ProductRepository implements IProductRepository{
    private final static List<Product> productList = new ArrayList<>();

    static {
        productList.add(new Product(0, "Laptop", 1000000));
        productList.add(new Product(1, "Phone", 500000));
        productList.add(new Product(2, "Watch", 200000));
        productList.add(new Product(3, "TV", 300000));
        productList.add(new Product(4, "Mouse", 100000));
    }
    @Override
    public List<Product> getAll() {
        return productList;
    }

    @Override
    public Product getProductById(int id) {
        return productList.get(id);
    }

    @Override
    public void addProduct(Product product) {
        productList.add(product);
    }

    @Override
    public void updateProduct(Product product) {
        productList.set(product.getId(), product);
        System.out.println("Update product success");

    }

    @Override
    public void deleteProduct(int id) {
        productList.remove(id);
        System.out.println("Delete product success");
    }
}
