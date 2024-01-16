package com.widetech.latihan.model;

import java.io.Serializable;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Embedded;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;

import org.springframework.beans.factory.annotation.Autowired;

@Entity
@Table(name = "item")
public class Product implements Serializable{
	@Id
	@Column(name = "item_code", length = 15)
	private String itemCode;
	private int price;
	private String description;
	private String type;
	
	@Column(name = "taxable")
	private int tax;
	
	@OneToMany(mappedBy = "product")
	private List<SaleItem> saleItem;
	
	public String getItemCode() {
		return itemCode;
	}
	public void setItemCode(String itemCode) {
		this.itemCode = itemCode;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public int getTax() {
		return tax;
	}
	public void setTax(int tax) {
		this.tax = tax;
	}
	public List<SaleItem> getSaleItem() {
		return saleItem;
	}
	public void setSaleItem(List<SaleItem> saleItem) {
		this.saleItem = saleItem;
	}
	
}
