package com.widetech.latihan.dao.impl;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.widetech.latihan.dao.SaleDao;
import com.widetech.latihan.model.Product;
import com.widetech.latihan.model.Sale;
import com.widetech.latihan.model.SaleItem;

@Repository
public class SaleDaoImpl implements SaleDao {
	@Autowired
	private SessionFactory sessionFactory;


	@Override
	public List<Sale> getAllSale() {
		// TODO Auto-generated method stub
//		return sessionFactory.getCurrentSession().createQuery("from Sale").getResultList();
		
		Session session = sessionFactory.getCurrentSession();
		List<Sale> sale = null;
		String hqlQuery = "from Sale";
		Query query = session.createQuery(hqlQuery);
		sale = (List<Sale>) query.getResultList();
		
		return sale;
	}

	@Override
	public void addSale(Sale sale) {
		// TODO Auto-generated method stub
		sessionFactory.getCurrentSession().save(sale);
	}

	@Override
	public void addSaleItem(SaleItem saleItem) {
		// TODO Auto-generated method stub
		sessionFactory.getCurrentSession().save(saleItem);
	}

	

	

}