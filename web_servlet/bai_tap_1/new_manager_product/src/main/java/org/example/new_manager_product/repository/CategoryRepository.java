package org.example.new_manager_product.repository;

import org.example.new_manager_product.entity.Category;
import org.example.new_manager_product.util.DatabaseUtil;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

public class CategoryRepository implements ICategoryRepository {

    private final String SELECT_ALL = "SELECT * FROM Category";

    @Override
    public List<Category> getAll() {
        List<Category> listCategory = new ArrayList<>();
        try (Connection connection = DatabaseUtil.getConnectDB()) {
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                int id_category = resultSet.getInt("id_category");
                String name_category = resultSet.getString("name_category");
                listCategory.add(new Category(id_category, name_category));
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return listCategory;
    }
}
