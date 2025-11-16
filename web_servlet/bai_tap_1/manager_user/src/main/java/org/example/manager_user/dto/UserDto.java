package org.example.manager_user.dto;

public class UserDto {
    private int id ;
    private String name ;
    private String code_country;
    private String name_country;

    public UserDto() {
    }

    public UserDto(int id, String name, String code_country, String name_country) {
        this.id = id;
        this.name = name;
        this.code_country = code_country;
        this.name_country = name_country;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getCode_country() {
        return code_country;
    }

    public void setCode_country(String code_country) {
        this.code_country = code_country;
    }

    public String getName_country() {
        return name_country;
    }

    public void setName_country(String name_country) {
        this.name_country = name_country;
    }
}
