package com.pro.ProductManagment.service;

import com.pro.ProductManagment.dto.ProductResponseDTO;
import com.pro.ProductManagment.entity.Product;

import java.util.List;

public interface ProductService {

    ProductResponseDTO findById(Long id);

    List<ProductResponseDTO> getAllProducts();

    ProductResponseDTO saveProduct(Product product);

    ProductResponseDTO updateProduct(Product product);

    void deleteProduct(Product product);

    List<ProductResponseDTO> getAllProductsbyName(String name);





}
