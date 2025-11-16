package org.example.manager_user.service;

import org.example.manager_user.entity.Country;
import org.example.manager_user.repository.CountryRepository;
import org.example.manager_user.repository.ICountryRepository;

import java.util.List;

public class CountryService implements ICountryService{
    private ICountryRepository countryRepository = new CountryRepository();
    @Override
    public List<Country> getAll() {
        return countryRepository.getAll();
    }
}
