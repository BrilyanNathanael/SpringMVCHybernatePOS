package com.widetech.latihan.controller.dto;

import javax.validation.constraints.Min;
import javax.validation.constraints.NotNull;

import org.hibernate.validator.constraints.NotBlank;
import org.hibernate.validator.constraints.NotEmpty;



public class ProductDTO {
	@NotNull(message = "Item Code is required")
	@NotBlank(message = "Item Code is required")
	private String itemCode;
	
	@NotNull(message = "Price is required")
	@Min(value = 5000, message = "Minimum price is 5000")
	private int price;
	
	@NotNull(message = "Description is required")
	@NotBlank(message = "Description is required")
	private String description;
	
	@NotNull(message = "Type is required")
	@NotBlank(message = "Type is required")
	private String type;
	private int tax;
	
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
}
