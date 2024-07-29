package com.example.ss11.service.impl;

import com.example.ss11.entity.Product;
import com.example.ss11.service.IProductService;

import java.util.ArrayList;
import java.util.List;

public class ProductServiceImpl implements IProductService {
    public static List<Product> products = new ArrayList<Product>();
    static {
        products.add(new Product(1L,"Quần",1200.0,"mô tả","GU",true));
        products.add(new Product(2L,"Áo",1500.0,"mô tả","GAP",true));
        products.add(new Product(3L,"Váy",3000.0,"mô tả","ABC",true));
    }

    @Override
    public boolean addProduct(Product product) {
        product.setId(getNewId());
        products.add(product);
        return true;
    }



    @Override
    public Long getNewId() {
        Long maxId = 0L;
        for (Product product : products) {
            if (product.getId() > maxId) {
                maxId = product.getId();
            }
        }
        return maxId +1;
    }

    @Override
    public void deleteByid(Long id) {
        int indexDelete = finIndexByid(id);
        products.remove(indexDelete);
    }

    @Override
    public Product findById(Long id) {
        if(finIndexByid(id) != -1){
           return products.get(finIndexByid(id));
        }
        return null;
    }

    @Override
    public boolean updateProduct(Product product) {
        products.set(finIndexByid(product.getId()), product);
        return true;
    }

    @Override
    public List<Product> searchProduct(String keyword) {
        return products.stream().filter(item -> item.getName().toLowerCase().contains(keyword.toLowerCase())).toList();
    }

    public int finIndexByid(Long id) {
        for (int i = 0; i < products.size(); i++) {
            if (products.get(i).getId().equals(id)) {
                return i;
            }
        }
        return -1;
    }
}

