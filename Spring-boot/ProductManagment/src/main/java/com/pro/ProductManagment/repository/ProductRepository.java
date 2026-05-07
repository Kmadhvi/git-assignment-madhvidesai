package com.pro.ProductManagment.repository;

import com.pro.ProductManagment.entity.Product;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface ProductRepository extends JpaRepository<Product,Long> {

   @Query("select p from Product p where p.p_name = :name")
   List<Product> findByProductName(@Param("name") String name);

    // JPQL
    @Query("select p from Product p where p.p_name = :n")
    List<Product> findProductByName(@Param("n") String name);

    // Native Query
    @Query(value = "select * from product where prod_name= :n", nativeQuery = true)
    List<Product> findProdByName(@Param("n") String name);

}
