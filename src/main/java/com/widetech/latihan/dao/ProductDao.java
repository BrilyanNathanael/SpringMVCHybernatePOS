package com.widetech.latihan.dao;

import java.util.List;

import com.widetech.latihan.model.Product;

public interface ProductDao {

	//Create of CRUD
	void addProduct(Product product);

	//Read of CRUD
	List<Product> getAllProducts();

	//Read of CRUD
	Product getProductByItemCode(String itemCode);

	//Update of CRUD
	void updateProduct(Product product);

	//Delete of CRUD
	void deleteProduct(String itemCode);

}