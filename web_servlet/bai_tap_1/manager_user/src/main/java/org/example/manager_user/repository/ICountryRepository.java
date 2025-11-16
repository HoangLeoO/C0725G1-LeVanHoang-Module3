package org.example.manager_user.repository;

import org.example.manager_user.entity.Country;

import java.util.List;

public interface ICountryRepository {
    List<Country> getAll();
}
