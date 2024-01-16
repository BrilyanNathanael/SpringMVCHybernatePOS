package com.widetech.latihan.dao;

import java.util.List;

import com.widetech.latihan.model.Product;
import com.widetech.latihan.model.Sale;
import com.widetech.latihan.model.SaleItem;

public interface SaleDao {

	//Create of CRUD
	void addSale(Sale sale);
	
	void addSaleItem(SaleItem saleItem);

	//Read of CRUD
	List<Sale> getAllSale();

	//Read of CRUD
//	Product getProductByItemCode(String itemCode);
//
//	//Update of CRUD
//	void updateProduct(Product product);
//
//	//Delete of CRUD
//	void deleteProduct(String itemCode);

}