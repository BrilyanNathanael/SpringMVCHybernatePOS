package com.widetech.latihan.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.widetech.latihan.controller.dto.ProductDTO;
import com.widetech.latihan.model.Product;
import com.widetech.latihan.service.ProductService;


@Controller
@RequestMapping("/auth")
public class ProductController {

	@Autowired
	private ProductService productService;

	@RequestMapping("/product")
	public String listProducts(Map<String, Object> map) {
		map.put("product", new ProductDTO());
		List<ProductDTO> productDTO = mapListToDTO(productService.getAllProduct());
		map.put("productList", productDTO);
		return "product";
	}

	private List<ProductDTO> mapListToDTO(List<Product> allProduct) {
		// TODO Auto-generated method stub
		List<ProductDTO> productViewDTO = new ArrayList<ProductDTO>();
		for(Product p : allProduct) {
			ProductDTO dto = new ProductDTO();
			dto.setItemCode(p.getItemCode());
			dto.setPrice(p.getPrice());
			dto.setDescription(p.getDescription());
			dto.setType(p.getType());
			dto.setTax(p.getTax());
			productViewDTO.add(dto);
		}
		
		return productViewDTO;
	}

	@RequestMapping(value = "/product", method = RequestMethod.POST)
	public String addProduct(@Valid @ModelAttribute("product") ProductDTO productDTO, BindingResult result, Map<String, Object> map) {
		
		if(result.hasErrors()) {
			List<ProductDTO> listProductDTO = mapListToDTO(productService.getAllProduct());
			map.put("productList", listProductDTO);
			return "product";
		}
		else {			
			Product p = mapToObj(productDTO);
			if (null != productDTO) {
				productService.addProduct(p);
			}
			return "redirect:/auth/product";
		}
	}

	private Product mapToObj(ProductDTO productDTO) {
		// TODO Auto-generated method stub
		Product p = new Product();
		p.setItemCode(productDTO.getItemCode());
		p.setPrice(productDTO.getPrice());
		p.setDescription(productDTO.getDescription());
		p.setTax(productDTO.getTax());
		p.setType(productDTO.getType());
		return p;
	}

	@RequestMapping(value = "/delete-product/{itemCode}")
	public String deleteItemCode(@PathVariable("itemCode") String itemCode) {
		productService.deleteProduct(itemCode);
		return "redirect:/auth/product";
	}

	@RequestMapping("/product/{itemCode}")
	public String showProduct(@PathVariable("itemCode") String itemCode, Map<String, Object> map) {
		Product product = productService.getProductByItemCode(itemCode);
		ProductDTO dto = mapObjToDTO(product);
//		 Providing new value for Edit
		map.put("product", dto);
		return "product-edit";
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

	@RequestMapping(value = "/product/{itemCode}", method = RequestMethod.POST)
	public String updateProduct(@PathVariable("itemCode") String itemCode, @Valid @ModelAttribute("product") ProductDTO productDTO, BindingResult result, Map<String, Object> map) {
		if(result.hasErrors()) {
			map.put("product", productDTO);
			return "product-edit";
		}
		else {
			Product old = productService.getProductByItemCode(itemCode);
			// Providing new value for Edit
			old.setPrice(productDTO.getPrice());
			old.setDescription(productDTO.getDescription());
			old.setType(productDTO.getType());
			old.setTax(productDTO.getTax());
			productService.updateProduct(old);
			
			return "redirect:/auth/product";
		}
	}

	public ProductService getProductService() {
		return productService;
	}

	public void setProductService(ProductService productService) {
		this.productService = productService;
	}

}