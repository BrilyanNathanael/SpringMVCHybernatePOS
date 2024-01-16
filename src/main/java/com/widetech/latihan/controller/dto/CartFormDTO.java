package com.widetech.latihan.controller.dto;

import javax.validation.constraints.Min;
import javax.validation.constraints.NotNull;

public class CartFormDTO {
	private String itemCode;
	private int quantity;
	
	public String getItemCode() {
		return itemCode;
	}
	public void setItemCode(String itemCode) {
		this.itemCode = itemCode;
	}
	public int getQuantity() {
		return quantity;
	}
	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
}
