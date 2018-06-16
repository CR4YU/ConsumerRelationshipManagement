package org.example.crm.service;

import org.example.crm.model.Customer;

import java.util.List;

public interface CustomerService {

	List<Customer> getCustomers();

	void saveCustomer(Customer customer);

	Customer getCustomer(Long id);

	void deleteCustomer(Long id);
}
