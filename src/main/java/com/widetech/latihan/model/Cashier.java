package com.widetech.latihan.model;

import javax.persistence.Embeddable;

@Embeddable
public class Cashier {
	private String cashier;

	public String getCashier() {
		return cashier;
	}

	public void setCashier(String cashier) {
		this.cashier = cashier;
	}
	
}
