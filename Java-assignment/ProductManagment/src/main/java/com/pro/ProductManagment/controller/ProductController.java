package com.pro.ProductManagment.controller;

import com.pro.ProductManagment.dto.ProductResponseDTO;
import com.pro.ProductManagment.entity.Product;
import com.pro.ProductManagment.service.ProductService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("rest/product")
public class ProductController{

    private static final Logger log = LoggerFactory.getLogger(ProductController.class);

    @Autowired
    ProductService productService;

    @GetMapping("/list")
    public ResponseEntity<List<ProductResponseDTO>> findAllProducts(){
        try {
            return ResponseEntity.ok(productService.getAllProducts());
        } catch (Exception e) {
            log.error("Failed to fetch all products", e);
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).build();
        }
    }

    @GetMapping("/{id}")
    public ResponseEntity<ProductResponseDTO> findProductByID(@PathVariable("id") Long id){
        try{
            return ResponseEntity.ok(productService.findById(id));
        }catch (Exception e){
            log.error("Failed to fetch product by id: {}", id, e);
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).build();
        }
    }
    @PostMapping("/")
    public ResponseEntity<ProductResponseDTO> saveProduct(@RequestBody Product product){
        try{
            return ResponseEntity.status(HttpStatus.CREATED).body(productService.saveProduct(product));
        } catch (Exception e) {
            log.error("Failed to save product", e);
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).build();
        }
    }

    @PutMapping("/")
    public ResponseEntity<ProductResponseDTO> updateProduct(@RequestBody Product product){
        try{
            return ResponseEntity.ok(productService.updateProduct(product));
        } catch (Exception e) {
            log.error("Failed to update product with id: {}", product.getProd_id(), e);
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).build();
        }
    }

    @DeleteMapping("/")
    public ResponseEntity<ProductResponseDTO> deleteProduct(@RequestBody Product product){
        try {
            productService.deleteProduct(product);
            return ResponseEntity.status(HttpStatus.NO_CONTENT).build();
        } catch (Exception e) {
            log.error("Failed to delete product with id: {}", product.getProd_id(), e);
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).build();
        }
    }

    @GetMapping("/byName")
    public ResponseEntity<List<ProductResponseDTO>> getProductByName(@RequestParam(name = "name")String name){
        try{
            return ResponseEntity.ok(productService.getAllProductsbyName(name));
        }catch (Exception e){
            log.error("Failed to fetch products by name: {}", name, e);
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).build();
        }
    }



}
