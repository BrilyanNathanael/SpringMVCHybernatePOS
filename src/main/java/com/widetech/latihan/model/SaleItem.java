package com.widetech.latihan.model;

import java.io.Serializable;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Embedded;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;

import org.hibernate.annotations.Cascade;
import org.hibernate.annotations.CascadeType;
import org.springframework.beans.factory.annotation.Autowired;


@Entity
@Table(name = "sale_item")
public class SaleItem implements Serializable{
	@Id
	@GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "sale_item_sequence")
	@SequenceGenerator(name = "sale_item_sequence", sequenceName = "sale_item_sequence", initialValue = 1, allocationSize=1)
	private int id;
	
	@ManyToOne
	@JoinColumn(name = "sale_id")
	private Sale sale;
	
	@OneToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "item_id", referencedColumnName = "item_code")
	@Cascade(CascadeType.ALL)
	private Product product;
	
	private int quantity;
	
	private int price;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public Sale getSale() {
		return sale;
	}

	public void setSale(Sale sale) {
		this.sale = sale;
	}

	public Product getProduct() {
		return product;
	}

	public void setProduct(Product product) {
		this.product = product;
	}

	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}
	
}
