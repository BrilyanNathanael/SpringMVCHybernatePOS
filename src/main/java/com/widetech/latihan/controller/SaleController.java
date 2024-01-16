package com.widetech.latihan.controller;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.widetech.latihan.controller.dto.CartFormDTO;
import com.widetech.latihan.controller.dto.CartViewDTO;
import com.widetech.latihan.controller.dto.PaymentDTO;
import com.widetech.latihan.controller.dto.ProductDTO;
import com.widetech.latihan.controller.dto.SaleDTO;
import com.widetech.latihan.model.Cart;
import com.widetech.latihan.model.Cashier;
import com.widetech.latihan.model.Payment;
import com.widetech.latihan.model.Product;
import com.widetech.latihan.model.Sale;
import com.widetech.latihan.model.SaleItem;
import com.widetech.latihan.service.ProductService;
import com.widetech.latihan.service.SaleService;



@Controller
@RequestMapping("/auth")
public class SaleController {

	@Autowired
	private SaleService saleService;
	
	@RequestMapping("/transaction")
	public String getTransactions(Map<String, Object> map) {
		List<SaleDTO> listSaleDTO = mapListToDTO(saleService.getAllSale());
		map.put("listSales", listSaleDTO);
		return "transactions";
	}
	
	private List<SaleDTO> mapListToDTO(List<Sale> allSale) {
		// TODO Auto-generated method stub
		List<SaleDTO> saleDTO = new ArrayList<SaleDTO>();
		for(Sale s: allSale) {
			SaleDTO dto = new SaleDTO();
			dto.setSaleNumber(s.getSaleNumber());
			dto.setTransDate(s.getTransDate());
			dto.setCashier(s.getCashier());
			dto.setPayment(s.getPayment());
			dto.setListSaleItems(s.getSaleItems());
			dto.setTax(s.getTax());
			saleDTO.add(dto);
		}
		
		return saleDTO;
	}

	@RequestMapping(value = "/transaction", method = RequestMethod.POST)
	public String addTransaction(@ModelAttribute("payment") PaymentDTO paymentDTO, BindingResult result, HttpSession session) {	
		CartViewDTO cartViewDTO = (CartViewDTO) session.getAttribute("myCart");
		
		List<SaleItem> listSaleItem = new ArrayList<SaleItem>();
		Sale sale = new Sale();
		
		Cashier c = new Cashier();
		c.setCashier("Nathan");
		sale.setCashier(c);
		
		Payment p = new Payment();
		p.setPayment(paymentDTO.getPayment());
		p.setAmount(paymentDTO.getAmount());
		p.setCash_in_hand(paymentDTO.getAmount() - (cartViewDTO.getTotalGrandPrice() + cartViewDTO.getCalculateTax()));
		sale.setPayment(p);
		
		sale.setTax(cartViewDTO.getCalculateTax());
		sale.setTransDate(new Date().toString());
		
		for(Cart cart:cartViewDTO.getListCarts()) {
			SaleItem saleItem = new SaleItem();
			saleItem.setProduct(cart.getProduct());
			saleItem.setPrice(cart.getPrice());
			saleItem.setQuantity(cart.getQuantity());
			saleItem.setSale(sale);
			listSaleItem.add(saleItem);
		}
		
		sale.setSaleItems(listSaleItem);
		saleService.addSale(sale);
		
		session.removeAttribute("myCart");
		return "redirect:/auth/transaction";
	}

	public SaleService getSaleService() {
		return saleService;
	}

	public void setSaleService(SaleService saleService) {
		this.saleService = saleService;
	}

}