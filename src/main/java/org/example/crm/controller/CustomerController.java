package org.example.crm.controller;

import org.example.crm.model.Customer;
import org.example.crm.service.CustomerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.StringTrimmerEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;

@Controller
@RequestMapping("/customer")
public class CustomerController {

	@Autowired
	private CustomerService customerService;

	@InitBinder
	public void initBinder(WebDataBinder dataBinder) {
		boolean trimToNull = true;
		StringTrimmerEditor stringTrimmerEditor = new StringTrimmerEditor(trimToNull);

		dataBinder.registerCustomEditor(String.class, stringTrimmerEditor);
	}

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
	public String saveCustomer(@Valid @ModelAttribute("customer") Customer customer, BindingResult bindingResult) {
		if(bindingResult.hasErrors()) {
			return "customer-form";
		}
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
