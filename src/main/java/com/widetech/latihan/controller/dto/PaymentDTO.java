package com.widetech.latihan.controller.dto;

public class PaymentDTO {
	private String payment;
	private int amount;
	private int cash_in_hand;
	
	public String getPayment() {
		return payment;
	}
	public void setPayment(String payment) {
		this.payment = payment;
	}
	public int getAmount() {
		return amount;
	}
	public void setAmount(int amount) {
		this.amount = amount;
	}
	public int getCash_in_hand() {
		return cash_in_hand;
	}
	public void setCash_in_hand(int cash_in_hand) {
		this.cash_in_hand = cash_in_hand;
	}
	
	
}
