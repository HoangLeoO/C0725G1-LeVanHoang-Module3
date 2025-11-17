package org.example.new_manager_product.serivce;

import org.example.new_manager_product.dto.ProductDTO;
import org.example.new_manager_product.entity.Product;
import org.example.new_manager_product.repository.IProductRepository;
import org.example.new_manager_product.repository.ProductRepository;

import java.util.List;

public class ProductService implements IProductService {

    protected IProductRepository productRepository = new ProductRepository();

    @Override
    public List<ProductDTO> getAll() {
        return productRepository.getAll();
    }

    @Override
    public ProductDTO getProductById(int product) {
        return productRepository.getProductById(product);
    }

    @Override
    public boolean add(Product product) {
        return productRepository.add(product);
    }

    @Override
    public boolean update(Product product) {
        return productRepository.update(product);
    }

    @Override
    public boolean deleteById(int id) {
        return productRepository.deleteById(id);
    }

    @Override
    public List<ProductDTO> getProductByProductAndCategory(String keyWord1, String keyWord2) {
        return productRepository.getProductByProductAndCategory(keyWord1,keyWord2);
    }

    @Override
    public List<ProductDTO> getProductsByPage(int pageIndex, int pageSize) {
        return productRepository.getProductsByPage(pageIndex,pageSize);
    }

    @Override
    public int countProducts() {
        return productRepository.countProducts();
    }
}
