package com.widetech.latihan.controller.dto;

import java.util.ArrayList;
import java.util.List;

import com.widetech.latihan.model.Cashier;
import com.widetech.latihan.model.Payment;
import com.widetech.latihan.model.SaleItem;

public class SaleDTO {
	private int saleNumber;
	private String transDate;
	private Cashier cashier;
	private Payment payment;
	private int tax;
	private List<SaleItem> listSaleItems;
	public int getSaleNumber() {
		return saleNumber;
	}
	public void setSaleNumber(int saleNumber) {
		this.saleNumber = saleNumber;
	}
	public String getTransDate() {
		return transDate;
	}
	public void setTransDate(String transDate) {
		this.transDate = transDate;
	}
	public Cashier getCashier() {
		return cashier;
	}
	public void setCashier(Cashier cashier) {
		this.cashier = cashier;
	}
	public Payment getPayment() {
		return payment;
	}
	public void setPayment(Payment payment) {
		this.payment = payment;
	}
	public int getTax() {
		return tax;
	}
	public void setTax(int tax) {
		this.tax = tax;
	}
	public List<SaleItem> getListSaleItems() {
		return listSaleItems;
	}
	public void setListSaleItems(List<SaleItem> listSaleItems) {
		this.listSaleItems = listSaleItems;
	}
}
