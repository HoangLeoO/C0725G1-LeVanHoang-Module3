package org.example.manager_user.entity;

public class User {
    private int id ;
    private String name ;
    private int id_country;

    public User() {
    }

    public User( String name, int id_country) {
        this.name = name;
        this.id_country = id_country;
    }
    public User(int id, String name, int id_country) {
        this.id = id;
        this.name = name;
        this.id_country = id_country;
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

    public int getId_country() {
        return id_country;
    }

    public void setId_country(int id_country) {
        this.id_country = id_country;
    }
}
