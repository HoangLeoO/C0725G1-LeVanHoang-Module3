package org.example.manager_prodcut.service;

import org.example.manager_prodcut.entity.Product;
import org.example.manager_prodcut.repository.IProductRepository;
import org.example.manager_prodcut.repository.ProductRepository;

import java.util.List;

public class ProductService implements IProductService{
    private final IProductRepository productRepository = new ProductRepository();
    @Override
    public List<Product> getAll() {
        return productRepository.getAll();
    }

    @Override
    public Product getProductById(int id) {
        return productRepository.getProductById(id);
    }

    @Override
    public void addProduct(Product product) {
        productRepository.addProduct(product);
    }

    @Override
    public void updateProduct(Product product) {
        productRepository.updateProduct(product);
    }

    @Override
    public void deleteProduct(int id) {
        productRepository.deleteProduct(id);
    }
}
