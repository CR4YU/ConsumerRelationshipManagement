package org.example.crm.controller;

import org.example.crm.dao.CustomerDAO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/customer")
public class CustomerController {

	@Autowired
	CustomerDAO customerDAO;

	@GetMapping("/list")
	public String listCustomers(Model model) {
		model.addAttribute("customers", customerDAO.findAll());
		return "list-customers";
	}
}
