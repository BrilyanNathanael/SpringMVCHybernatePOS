package com.widetech.latihan.controller.dto;

import java.util.List;

import com.widetech.latihan.model.Tax;
import com.widetech.latihan.model.Cart;
import com.widetech.latihan.model.Product;

public class CartViewDTO {
	private List<Cart> listCarts;
	private int totalGrandPrice;
	private int tax;
	
	public List<Cart> getListCarts() {
		return listCarts;
	}
	public void setListCarts(List<Cart> listCarts) {
		this.listCarts = listCarts;
	}
	public int getTotalGrandPrice() {
		return totalGrandPrice;
	}
	public void setTotalGrandPrice() {
		int totalPrice = 0;
		for(Cart c:this.listCarts) {
			totalPrice = totalPrice + (c.getQuantity() * c.getPrice());
		}
		
		this.totalGrandPrice = totalPrice;
	}
	public int getCalculateTax() {
		return tax;
	}
	public void setCalculateTax() {
		int itemTax = 0;
		for(Cart c:this.listCarts) {
			if(c.getProduct().getTax() == 0) {
				itemTax = itemTax + ((int) (c.getQuantity() * c.getPrice() * Tax.tax));
			}
		}
		
		this.tax = itemTax;
	}
	
	
}
