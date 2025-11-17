package org.example.new_manager_product.repository;

import org.example.new_manager_product.dto.ProductDTO;
import org.example.new_manager_product.entity.Product;

import java.util.List;

public interface IProductRepository {
    List<ProductDTO> getAll();

    ProductDTO getProductById(int product);

    boolean add(Product product);

    boolean update(Product product);

    boolean deleteById(int id);

    List<ProductDTO> getProductByProductAndCategory(String keyword1, String keyword2);

    List<ProductDTO> getProductsByPage(int pageIndex, int pageSize);

    int countProducts();
}
