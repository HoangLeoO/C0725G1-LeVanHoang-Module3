package org.example.manager_user.repository;

import org.example.manager_user.dto.UserDto;
import org.example.manager_user.entity.User;
import org.example.manager_user.util.DatabaseUtil;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class UserRepository implements IUserRepository {
    private final String SELECT_ALL = "SELECT U.*,C.code_country,C.name_country FROM user U JOIN country C  ON U.id_country = C.id";
    private final String INSERT_INTO = "insert into user(name, id_country) VALUES (?,?)";
    private final String UPDATE_BY_ID = "UPDATE user SET name = ? , id_country = ?  WHERE id = ?";
    private final String DELETE_BY_ID = "delete from user where id = ?";
    private final String GET_BY_ID = "select * from user where id = ?";

    @Override
    public List<UserDto> getAll() {
        List<UserDto> listUserDto = new ArrayList<>();
        try (Connection connection = DatabaseUtil.getConnectDB()) {
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                int id = resultSet.getInt("id");
                String name = resultSet.getString("name");
                String code_country = resultSet.getString("code_country");
                String name_country = resultSet.getString("name_country");
                listUserDto.add(new UserDto(id, name, code_country, name_country));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return listUserDto;
    }

        @Override
        public User getUserById(int id) {
            User user = null;
            try (Connection connection = DatabaseUtil.getConnectDB();
                 PreparedStatement preparedStatement = connection.prepareStatement(GET_BY_ID)) {

                preparedStatement.setInt(1, id);

                try (ResultSet resultSet = preparedStatement.executeQuery()) {
                    if (resultSet.next()) {
                        int id_user = resultSet.getInt("id");
                        String name = resultSet.getString("name");
                        int id_country = resultSet.getInt("id_country");
                        user = new User(id_user, name, id_country);
                        System.out.println("oke");
                    }
                }

            } catch (Exception e) {
                e.printStackTrace();
            }

            return user;
        }

    @Override
    public boolean add(User user) {
        try (Connection connection = DatabaseUtil.getConnectDB();) {
            PreparedStatement preparedStatement = connection.prepareStatement(INSERT_INTO);
            preparedStatement.setString(1, user.getName());
            preparedStatement.setInt(2, user.getId_country());
            int effectRow = preparedStatement.executeUpdate();
            return effectRow == 1;
        } catch (SQLException e) {
            e.printStackTrace();
            System.out.println("lỗi lấy dữ liệu");
        }
        return false;
    }

    @Override
    public void update(User user) {
        try (Connection connection = DatabaseUtil.getConnectDB();) {
            PreparedStatement preparedStatement = connection.prepareStatement(UPDATE_BY_ID);
            preparedStatement.setString(1, user.getName());
            preparedStatement.setInt(2, user.getId_country());
            preparedStatement.setInt(3, user.getId());
            preparedStatement.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println("lỗi lấy dữ liệu");
        }
    }

    @Override
    public boolean delete(int id) {
        try (Connection connection = DatabaseUtil.getConnectDB();) {
            PreparedStatement preparedStatement = connection.prepareStatement(DELETE_BY_ID);
            preparedStatement.setInt(1, id);
            preparedStatement.executeUpdate();
            return true;
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println("lỗi lấy dữ liệu");
        }
        return false;
    }
}
