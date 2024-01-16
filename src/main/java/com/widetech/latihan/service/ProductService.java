package com.widetech.latihan.service;

import java.util.List;

import com.widetech.latihan.dao.ProductDao;
import com.widetech.latihan.model.Product;

public interface ProductService {

	// Create of CRUD
	void addProduct(Product product);

	// Read of CRUD
	List<Product> getAllProduct();

	// Read of CRUD
	Product getProductByItemCode(String itemCode);

	// Update of CRUD
	void updateProduct(Product product);

	// Delete of CRUD
	void deleteProduct(String itemCode);

	ProductDao getProductDao();

}