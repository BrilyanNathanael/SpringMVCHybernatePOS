package com.widetech.latihan.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.widetech.latihan.dao.ProductDao;
import com.widetech.latihan.model.Product;
import com.widetech.latihan.service.ProductService;

@Service
public class ProductServiceImpl implements ProductService {

	@Autowired
	private ProductDao productDao;

	@Override
	@Transactional
	public void addProduct(Product product) {
		// TODO Auto-generated method stub
		productDao.addProduct(product);
	}

	@Override
	@Transactional
	public List<Product> getAllProduct() {
		// TODO Auto-generated method stub
		return productDao.getAllProducts();
	}

	@Override
	@Transactional
	public Product getProductByItemCode(String itemCode) {
		// TODO Auto-generated method stub
		return productDao.getProductByItemCode(itemCode);
	}

	@Override
	@Transactional
	public void updateProduct(Product product) {
		// TODO Auto-generated method stub
		productDao.updateProduct(product);
	}

	@Override
	@Transactional
	public void deleteProduct(String itemCode) {
		// TODO Auto-generated method stub
		productDao.deleteProduct(itemCode);
	}

	@Override
	public ProductDao getProductDao() {
		// TODO Auto-generated method stub
		return productDao;
	}

	public void setProductDao(ProductDao productDao) {
		this.productDao = productDao;
	}
	
}