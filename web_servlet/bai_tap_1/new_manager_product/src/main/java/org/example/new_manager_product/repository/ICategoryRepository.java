package org.example.new_manager_product.repository;

import org.example.new_manager_product.entity.Category;

import java.util.List;

public interface ICategoryRepository {
    List<Category> getAll();
}
