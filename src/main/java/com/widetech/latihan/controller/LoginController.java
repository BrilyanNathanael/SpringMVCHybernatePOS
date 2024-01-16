package com.widetech.latihan.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.widetech.latihan.controller.dto.ProductDTO;
import com.widetech.latihan.controller.dto.UserDTO;
import com.widetech.latihan.model.Product;
import com.widetech.latihan.service.ProductService;


@Controller
public class LoginController {
	@RequestMapping("/login")
	public String index(Map<String, Object> map, HttpSession session) {
		if("Brilyan".equals(session.getAttribute("userContext"))) {
			return "redirect:/";
		}
		
		map.put("user", new UserDTO());
		return "login";
	}
	
	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String login(@Valid @ModelAttribute("user") UserDTO userDTO, BindingResult result, Map<String, Object> map, HttpSession session) {		
		if(result.hasErrors()) {
			map.put("user", userDTO);
			return "login";
		}
		else {
			if("Brilyan".equals(userDTO.getUsername()) && "password".equals(userDTO.getPassword())) {
				session.setAttribute("userContext", userDTO.getUsername());
				return "redirect:/";			
			}
			map.put("error", "There is something wrong in username / password");
			return "login";
		}
	}
	
	@RequestMapping(value = "/logout", method = RequestMethod.POST)
	public String logout(HttpSession session) {
		session.removeAttribute("userContext");
		session.removeAttribute("myCart");
		return "redirect:/login";
	}
}