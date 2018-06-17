package org.example.crm.controller;

import org.example.crm.model.Customer;
import org.example.crm.service.CustomerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
@RequestMapping("/customer")
public class CustomerController {

	@Autowired
	private CustomerService customerService;

	@GetMapping("/list")
	public String listCustomers(Model model) {
		model.addAttribute("customers", customerService.getCustomers());
		return "list-customers";
	}

	@GetMapping("/showFormForAddCustomer")
	public String showFormForAddCustomer(Model model) {
		model.addAttribute("customer", new Customer());
		return "customer-form";
	}

	@PostMapping("/saveCustomer")
	public String saveCustomer(@ModelAttribute("customer") Customer customer) {
		customerService.saveCustomer(customer);
		return "redirect:/customer/list";
	}

	@GetMapping("/showFormForUpdateCustomer")
	public String showFormForUpdateCustomer( @RequestParam("customerId") Long id, Model model) {
		model.addAttribute("customer", customerService.getCustomer(id));
		return "customer-form";
	}

	@GetMapping("/delete")
	public String deleteCustomer(@RequestParam("customerId") Long id) {
		customerService.deleteCustomer(id);
		return "redirect:/customer/list";
	}

	@PostMapping("/search")
	public String searchCustomers(@RequestParam("name") String name, Model model) {
		model.addAttribute("customers", customerService.searchCustomers(name));
		return "list-customers";
	}
}
