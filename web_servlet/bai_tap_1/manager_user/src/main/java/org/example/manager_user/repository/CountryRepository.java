package org.example.manager_user.repository;

import org.example.manager_user.entity.Country;
import org.example.manager_user.util.DatabaseUtil;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class CountryRepository implements ICountryRepository {
    private final String SELECT_ALL = "SELECT * FROM country;";


    @Override
    public List<Country> getAll() {
        List<Country> listCountry = new ArrayList<>();
        try(Connection connection = DatabaseUtil.getConnectDB()) {
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()){
                int id = resultSet.getInt("id");
                String code_country = resultSet.getString("code_country");
                String name_country = resultSet.getString("name_country");
                listCountry.add(new Country(id,code_country,name_country));
            }
        }catch (SQLException e) {
            System.out.println("lỗi lấy dữ liệu");
        }
        return listCountry;
    }
}
