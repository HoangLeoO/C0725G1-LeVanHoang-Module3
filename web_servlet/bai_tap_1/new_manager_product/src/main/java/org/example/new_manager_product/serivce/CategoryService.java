package org.example.new_manager_product.serivce;

import org.example.new_manager_product.entity.Category;
import org.example.new_manager_product.repository.CategoryRepository;
import org.example.new_manager_product.repository.ICategoryRepository;

import java.util.List;

public class CategoryService implements  ICategoryService{
    protected ICategoryRepository categoryRepository = new CategoryRepository();
    @Override
    public List<Category> getAll() {
        return categoryRepository.getAll();
    }
}
