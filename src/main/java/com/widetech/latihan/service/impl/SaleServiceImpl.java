package com.widetech.latihan.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.widetech.latihan.dao.ProductDao;
import com.widetech.latihan.dao.SaleDao;
import com.widetech.latihan.model.Product;
import com.widetech.latihan.model.Sale;
import com.widetech.latihan.model.SaleItem;
import com.widetech.latihan.service.ProductService;
import com.widetech.latihan.service.SaleService;

@Service
public class SaleServiceImpl implements SaleService {

	@Autowired
	private SaleDao saleDao;

	public SaleDao getSaleDao() {
		// TODO Auto-generated method stub
		return saleDao;
	}

	public void setSaleDao(SaleDao saleDao) {
		this.saleDao = saleDao;
	}

	@Override
	@Transactional
	public void addSale(Sale sale) {
		// TODO Auto-generated method stub
		saleDao.addSale(sale);
	}

	@Override
	@Transactional
	public List<Sale> getAllSale() {
		// TODO Auto-generated method stub
		return saleDao.getAllSale();
	}
	
}