package org.example.new_manager_product.repository;

import org.example.new_manager_product.dto.ProductDTO;
import org.example.new_manager_product.entity.Product;
import org.example.new_manager_product.util.DatabaseUtil;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class ProductRepository implements IProductRepository {
    private final String SELECT_ALL = " select p.*, c.name_category from Product p join Category C on p.id_category = C.id_category";
    private final String SELECT_BY_ID = "select p.*, c.name_category from Product p join Category C on p.id_category = C.id_category where p.id_product = ?";
    private final String INSECT_INTO =
            "INSERT INTO Product (name_product, price, id_category) VALUES (?,?, ?);";
    private final String UPDATE_BY_ID = "update Product set name_product = ? , price = ? , id_category = ? where id_product = ?";
    private final String DELETE_BY_ID = "delete from Product where id_product = ?";
    private final String SEARCH_BY_NAME = "select p.*, c.name_category\n" +
            "from Product p\n" +
            "join Category c on p.id_category = c.id_category\n" +
            "where c.name_category like ?\n" +
            "  and p.name_product like ?";

    private final String PAGE = "SELECT p.*, c.name_category FROM Product p " +
            "JOIN Category c ON p.id_category = c.id_category " +
            "ORDER BY p.id_product LIMIT ? OFFSET ?";

    @Override
    public List<ProductDTO> getAll() {
        List<ProductDTO> listProductDTO = new ArrayList<>();
        try (Connection connection = DatabaseUtil.getConnectDB()) {
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                int id_product = resultSet.getInt("id_product");
                String name_product = resultSet.getString("name_product");
                double price = resultSet.getDouble("price");
                int id_category = resultSet.getInt("id_category");
                String name_category = resultSet.getString("name_category");
                listProductDTO.add(new ProductDTO(id_product, name_product, price, id_category, name_category));
            }
        } catch (Exception e) {
            System.out.println("Lỗi đọc database");
        }
        return listProductDTO;
    }

    @Override
    public ProductDTO getProductById(int product) {
        ProductDTO productDTO = null;
        try (Connection connection = DatabaseUtil.getConnectDB()) {
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_BY_ID);
            preparedStatement.setInt(1, product);
            ResultSet resultSet = preparedStatement.executeQuery();
            if (resultSet.next()) {
                int id_product = resultSet.getInt("id_product");
                String name_product = resultSet.getString("name_product");
                double price = resultSet.getDouble("price");
                int id_category = resultSet.getInt("id_category");
                String name_category = resultSet.getString("name_category");
                productDTO = new ProductDTO(id_product, name_product, price, id_category, name_category);
            }
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println("Lỗi database");
        }
        return productDTO;
    }

    @Override
    public boolean add(Product product) {
        try (Connection connection = DatabaseUtil.getConnectDB()) {
            PreparedStatement preparedStatement = connection.prepareStatement(INSECT_INTO);
            preparedStatement.setString(1, product.getName_product());
            preparedStatement.setDouble(2, product.getPrice());
            preparedStatement.setInt(3, product.getId_category());
            int row = preparedStatement.executeUpdate();
            return row > 0;
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    public boolean update(Product product) {
        try (Connection connection = DatabaseUtil.getConnectDB()) {
            PreparedStatement preparedStatement = connection.prepareStatement(UPDATE_BY_ID);
            preparedStatement.setString(1, product.getName_product());
            preparedStatement.setDouble(2, product.getPrice());
            preparedStatement.setInt(3, product.getId_category());
            preparedStatement.setInt(4, product.getId_product());
            int row = preparedStatement.executeUpdate();
            return row > 0;
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    public boolean deleteById(int id) {
        try (Connection connection = DatabaseUtil.getConnectDB();) {
            PreparedStatement preparedStatement = connection.prepareStatement(DELETE_BY_ID);
            preparedStatement.setInt(1, id);
            int row = preparedStatement.executeUpdate();
            return row > 0;
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println("lỗi lấy dữ liệu");
        }
        return false;
    }

    @Override
    public List<ProductDTO> getProductByProductAndCategory(String keyword1, String keyword2) {
        List<ProductDTO> listProductDTO = new ArrayList<>();
        try (Connection connection = DatabaseUtil.getConnectDB()) {
            PreparedStatement preparedStatement = connection.prepareStatement(SEARCH_BY_NAME);
            preparedStatement.setString(1, "%" + keyword1 + "%");
            preparedStatement.setString(2, "%" + keyword2 + "%");
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                int id_product = resultSet.getInt("id_product");
                String name_product = resultSet.getString("name_product");
                double price = resultSet.getDouble("price");
                int id_category = resultSet.getInt("id_category");
                String name_category = resultSet.getString("name_category");
                listProductDTO.add(new ProductDTO(id_product, name_product, price, id_category, name_category));
            }
        } catch (Exception e) {
            System.out.println("Lỗi đọc database");
        }
        return listProductDTO;
    }

    @Override
    public List<ProductDTO> getProductsByPage(int pageIndex, int pageSize) {
        List<ProductDTO> list = new ArrayList<>();
        int offset = (pageIndex - 1) * pageSize;
        try (Connection conn = DatabaseUtil.getConnectDB();
             PreparedStatement ps = conn.prepareStatement(PAGE)) {

            ps.setInt(1, pageSize);
            ps.setInt(2, offset);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                list.add(new ProductDTO(
                        rs.getInt("id_product"),
                        rs.getString("name_product"),
                        rs.getDouble("price"),
                        rs.getInt("id_category"),
                        rs.getString("name_category")
                ));
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    @Override
    public int countProducts() {
        String sql = "SELECT COUNT(*) FROM Product";
        try (Connection conn = DatabaseUtil.getConnectDB();
             PreparedStatement ps = conn.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {
            if (rs.next()) return rs.getInt(1);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return 0;
    }


}
