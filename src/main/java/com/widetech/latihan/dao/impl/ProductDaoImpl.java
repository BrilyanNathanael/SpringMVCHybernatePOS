package com.widetech.latihan.dao.impl;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.widetech.latihan.dao.ProductDao;
import com.widetech.latihan.model.Product;

@Repository
public class ProductDaoImpl implements ProductDao {
	@Autowired
	private SessionFactory sessionFactory;

	@Override
	public void addProduct(Product product) {
		// TODO Auto-generated method stub
		sessionFactory.getCurrentSession().save(product);
	}

	@Override
	@SuppressWarnings("unchecked")
	public List<Product> getAllProducts() {
		// TODO Auto-generated method stub
		return sessionFactory.getCurrentSession().createQuery("from Product").getResultList();
	}

	@Override
	@SuppressWarnings("rawtypes")
	public Product getProductByItemCode(String itemCode) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();
		Product product = null;
		String hqlQuery = "from Product where itemCode = :itemCode";
		Query query = session.createQuery(hqlQuery);
		query.setParameter("itemCode", itemCode);
		product = (Product) query.getSingleResult();
		return product;
	}

	@Override
	public void updateProduct(Product product) {
		// TODO Auto-generated method stub
		sessionFactory.getCurrentSession().update(product);
	}

	@Override
	public void deleteProduct(String itemCode) {
		// TODO Auto-generated method stub
		Product product = (Product) sessionFactory.getCurrentSession().load(Product.class, itemCode);
		if (null != product) {
			sessionFactory.getCurrentSession().delete(product);
		}
	}

	

}