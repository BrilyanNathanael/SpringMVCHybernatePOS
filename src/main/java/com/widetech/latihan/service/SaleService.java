package com.widetech.latihan.service;

import java.util.List;

import com.widetech.latihan.model.Sale;

public interface SaleService {

	// Create of CRUD
	void addSale(Sale sale);

	// Read of CRUD
	List<Sale> getAllSale();


}