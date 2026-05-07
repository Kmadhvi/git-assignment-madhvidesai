package com.pro.ProductManagment.service.impl;

import com.pro.ProductManagment.dto.ProductResponseDTO;
import com.pro.ProductManagment.entity.Product;
import com.pro.ProductManagment.repository.ProductRepository;
import com.pro.ProductManagment.service.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

@Service
public class ProductServiceImpl implements ProductService {

    @Autowired
    ProductRepository productRepository;


    @Override
    public ProductResponseDTO findById(Long id) {
        Optional<Product> product = productRepository.findById(id);
        return maptodo(product.get());
    }

    @Override
    public List<ProductResponseDTO> getAllProducts() {
        List<Product> products = productRepository.findAll();
        List<ProductResponseDTO> productList = new ArrayList<>();
        for (Product product : products) {
            productList.add(maptodo(product));
        }
        return  productList;
    }

    @Override
    public ProductResponseDTO saveProduct(Product product) {
        Product saveProduct = productRepository.save(product);
        return maptodo(saveProduct);
    }

    @Override
    public ProductResponseDTO updateProduct(Product product) {
        Product updateProduct = productRepository.save(product);
        return maptodo(updateProduct);
    }

    @Override
    public void deleteProduct(Product product) {
        productRepository.delete(product);
    }

    @Override
    public List<ProductResponseDTO> getAllProductsbyName(String name) {
        List<Product> products = productRepository.findByProductName(name);

      List<ProductResponseDTO> productList = new ArrayList<>();
       for (Product product : products) {
           productList.add(maptodo(product));
       }
        return productList;
    }

    private ProductResponseDTO maptodo(Product product) {

        ProductResponseDTO dto =new ProductResponseDTO();

        dto.setProd_id(product.getProd_id());
        dto.setP_name(product.getP_name());
        dto.setP_category(product.getP_category());
        return dto;
        }
}
