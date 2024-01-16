package com.widetech.latihan.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

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
import com.widetech.latihan.controller.dto.ProductDTO;
import com.widetech.latihan.controller.dto.PaymentDTO;
import com.widetech.latihan.model.Cart;
import com.widetech.latihan.model.Product;
import com.widetech.latihan.model.Sale;
import com.widetech.latihan.service.ProductService;



@Controller
@RequestMapping("/auth")
public class CartController {

	@Autowired
	private ProductService productService;
	
	@RequestMapping(value="/checkout", method=RequestMethod.GET)
	public String checkout(@RequestParam(value="itemCode", required=false) String itemCode, Map<String, Object> map, HttpSession session) {
		List<ProductDTO> listProductDTO = mapListToDTO(productService.getAllProduct());
		CartFormDTO cart = new CartFormDTO();
		
		if(null != itemCode) {
			ProductDTO productDTO = mapObjToDTO(productService.getProductByItemCode(itemCode));
			map.put("product", productDTO);
		}
		
		map.put("listProductId", listProductDTO);
		map.put("cart", cart);
		return "checkout";
	}
	
	@RequestMapping(value = "/cart", method = RequestMethod.POST)
	public String addToCart(@ModelAttribute("cart") CartFormDTO cartFormDTO, BindingResult result, Map<String, Object> map, HttpSession session) {	
		List<Cart> listCart;
		Product p = productService.getProductByItemCode(cartFormDTO.getItemCode());
		if(session.getAttribute("myCart") == null) {
			listCart = new ArrayList<Cart>();
			listCart = addItemToCart(listCart, p, cartFormDTO.getQuantity());
		}
		else {
			CartViewDTO oldCart =  (CartViewDTO) session.getAttribute("myCart");
			listCart = oldCart.getListCarts();
			
			boolean checkSameItem = checkSameItem(listCart, p, cartFormDTO.getQuantity());
			if(!checkSameItem) {
				listCart = addItemToCart(listCart, p, cartFormDTO.getQuantity());
			}
			
		}
		
		CartViewDTO cartViewDTO = new CartViewDTO();
		cartViewDTO.setListCarts(listCart);
		cartViewDTO.setTotalGrandPrice();
		cartViewDTO.setCalculateTax();
		
		session.setAttribute("myCart", cartViewDTO);
		return "redirect:/auth/cart";
		
	}
	
	private List<Cart> addItemToCart(List<Cart> listCart, Product p, int quantity) {
		// TODO Auto-generated method stub
		Cart cart = new Cart();
		cart.setProduct(p);
		cart.setPrice(p.getPrice());
		cart.setQuantity(quantity);
		listCart.add(cart);	
		return listCart;
	}

	@RequestMapping("/cart")
	public String viewMyCart(Map<String, Object> map, HttpSession session) {
		CartViewDTO cartViewDTO;
		if(session.getAttribute("myCart") != null) {
			cartViewDTO = (CartViewDTO) session.getAttribute("myCart");
			map.put("myCart", cartViewDTO);
		}
		else {
			cartViewDTO = new CartViewDTO();
			map.put("myCart", cartViewDTO);
		}
		map.put("payment", new PaymentDTO());
		map.put("totalGrandPrice", cartViewDTO.getTotalGrandPrice());
		map.put("tax", cartViewDTO.getCalculateTax());
		
		return "cart";
	}
	
	private boolean checkSameItem(List<Cart> listCart, Product p, int requestQuantity) {
		for(Cart c:listCart) {
			if(p.getItemCode().equals(c.getProduct().getItemCode())) {
				c.setQuantity(c.getQuantity() + requestQuantity);
				return true;
			}
		}
		return false;
	}
	
	private ProductDTO mapObjToDTO(Product product) {
		// TODO Auto-generated method stub
		ProductDTO dto = new ProductDTO();
		dto.setItemCode(product.getItemCode());
		dto.setPrice(product.getPrice());
		dto.setDescription(product.getDescription());
		dto.setType(product.getType());
		dto.setTax(product.getTax());
		
		return dto;
	}

	private List<ProductDTO> mapListToDTO(List<Product> allProduct) {
		// TODO Auto-generated method stub
		List<ProductDTO> productDTO = new ArrayList<ProductDTO>();
		for(Product p : allProduct) {
			ProductDTO dto = new ProductDTO();
			dto.setItemCode(p.getItemCode());
			productDTO.add(dto);
		}
		
		return productDTO;
	}

	public ProductService getProductService() {
		return productService;
	}

	public void setProductService(ProductService productService) {
		this.productService = productService;
	}

}