package com.widetech.latihan.controller.dto;

import java.util.ArrayList;
import java.util.List;

import javax.validation.constraints.NotNull;

import org.hibernate.validator.constraints.NotBlank;

import com.widetech.latihan.model.Cashier;
import com.widetech.latihan.model.Payment;
import com.widetech.latihan.model.SaleItem;

public class UserDTO {
	@NotNull(message = "Username is required")
	@NotBlank(message = "Username is required")
	private String username;
	@NotNull(message = "Password is required")
	@NotBlank(message = "Password is required")
	private String password;
	
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	
	
}
