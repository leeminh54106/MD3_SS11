package com.example.ss11.service;

import com.example.ss11.entity.Product;

import java.util.List;

public interface IProductService {
    boolean addProduct(Product product);

    Long getNewId();

    void deleteByid(Long id);

    Product findById(Long id);

    boolean updateProduct(Product product);

    List<Product> searchProduct(String keyword);
}
